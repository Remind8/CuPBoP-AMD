## Adapted from AMD's ROCm-Device-Libs/cmake/OCL.cmake

# -Wno-error=atomic-alignment was added to workaround build problems due to
# potential mis-aligned atomic ops detected by clang
set (AMDGPU_TARGET_TRIPLE amdgcn-amd-amdhsa)
set (CLANG_OCL_FLAGS -fcolor-diagnostics -Werror -Wno-error=atomic-alignment -x cl -Xclang
    -cl-std=CL2.0 -target "${AMDGPU_TARGET_TRIPLE}" -fvisibility=protected -fomit-frame-pointer
    -Xclang -finclude-default-header -Xclang -fexperimental-strict-floating-point
    -nogpulib -cl-no-stdinc "${CLANG_OPTIONS_APPEND}")
set (BC_EXT .bc)
set (LIB_SUFFIX ".lib${BC_EXT}")
set (STRIP_SUFFIX ".strip${BC_EXT}")
set (FINAL_SUFFIX "${BC_EXT}")

# Disable code object version module flag if available.
file(WRITE ${CMAKE_BINARY_DIR}/tmp.cl "")
execute_process (
    COMMAND ${LLVM_TOOLS_BINARY_DIR}/clang${EXE_SUFFIX} ${CLANG_OCL_FLAGS} -Xclang -mcode-object-version=none ${CMAKE_BINARY_DIR}/tmp.cl
    RESULT_VARIABLE TEST_CODE_OBJECT_VERSION_NONE_RESULT
    ERROR_QUIET
)
file(REMOVE ${CMAKE_BINARY_DIR}/tmp.cl)
if (NOT TEST_CODE_OBJECT_VERSION_NONE_RESULT)
    message(STATUS "Setting disable code object version module flag.")
    set(CLANG_OCL_FLAGS ${CLANG_OCL_FLAGS} -Xclang -mcode-object-version=none)
endif()

# Set `inc_options` to contain Clang command-line for include directories for
# current source directory.
macro(set_inc_options)
    get_property(inc_dirs
        DIRECTORY "${CMAKE_CURRENT_SOURCE_DIR}"
        PROPERTY INCLUDE_DIRECTORIES)
    set(inc_options)
    foreach(inc_dir ${inc_dirs})
        list(APPEND inc_options "-I${inc_dir}")
    endforeach()
endmacro()

# called with NAME: library name
#             SOURCES: .cl and .ll source files
#             INTERNAL_LINK_LIBS: Extra .lls to be linked and internalized into final library
macro(opencl_bc_lib)
    set(parse_options)
    set(one_value_args NAME)
    set(multi_value_args SOURCES INTERNAL_LINK_LIBS)

    cmake_parse_arguments(OPENCL_BC_LIB "${parse_options}" "${one_value_args}" "${multi_value_args}" ${ARGN})

    set(name ${OPENCL_BC_LIB_NAME})
    set(sources ${OPENCL_BC_LIB_SOURCES})
    set(internal_link_libs ${OPENCL_BC_LIB_INTERNAL_LINK_LIBS})

    # Mirror the install layout structure.
    set(OUTPUT_DIR ${PROJECT_BINARY_DIR}/${INSTALL_ROOT_SUFFIX})
    file(MAKE_DIRECTORY ${OUTPUT_DIR})

    set(OUT_NAME ${name})
    set(OUTPUT_BC_LIB ${OUTPUT_DIR}/${name}${FINAL_SUFFIX})

    set(clean_files)

    list(APPEND AMDGCN_LIB_LIST ${name})
    set(AMDGCN_LIB_LIST ${AMDGCN_LIB_LIST} PARENT_SCOPE)

    list(APPEND AMDGCN_DEP_LIST ${name})
    set(AMDGCN_DEP_LIST ${AMDGCN_DEP_LIST} PARENT_SCOPE)

    set_inc_options()
    set(deps)
    foreach(file ${OPENCL_BC_LIB_SOURCES})
        get_filename_component(fname_we "${file}" NAME_WE)
        get_filename_component(fext "${file}" EXT)
        if (fext STREQUAL ".cl")
            set(output "${CMAKE_CURRENT_BINARY_DIR}/${fname_we}${BC_EXT}")
            add_custom_command(OUTPUT "${output}"
                COMMAND $<TARGET_FILE:clang>
                    ${inc_options} ${CLANG_OCL_FLAGS}
                    -emit-llvm -c "${file}" -o "${output}"
                DEPENDS "${file}" "${CLANG}"
                # FIXME: Currently IMPLICIT_DEPENDS is only supported for GNU Makefile,
                # so as an overly-conservatively workaround to cover all generators
                # we just assume all .cl sources require irif.h. If all the generators
                # we care about begin to support IMPLICIT_DEPENDS we won't need this.
                # "${CMAKE_CURRENT_SOURCE_DIR}/../irif/inc/irif.h"
                IMPLICIT_DEPENDS C "${file}")
            list(APPEND deps "${output}")
            list(APPEND clean_files "${output}")
        endif()
        if (fext STREQUAL ".ll")
            list(APPEND deps "${file}")
        endif()
    endforeach()

    # The llvm-link command-lines can get long enough to trigger strange behavior
    # on Windows. LLVM tools support "response files" which can work around this:
    # http://llvm.org/docs/CommandLine.html#response-files
    set(RESPONSE_COMMAND_LINE)
    foreach(dep ${deps})
        set(RESPONSE_COMMAND_LINE "${RESPONSE_COMMAND_LINE} ${dep}")
    endforeach()
    file(WRITE "${CMAKE_CURRENT_BINARY_DIR}/response.in" "@RESPONSE_COMMAND_LINE@")
    configure_file("${CMAKE_CURRENT_BINARY_DIR}/response.in"
        "${CMAKE_CURRENT_BINARY_DIR}/${OUT_NAME}_response" @ONLY)

    add_custom_command(OUTPUT ${OUTPUT_BC_LIB}
        # Link regular library dependencies
        COMMAND $<TARGET_FILE:llvm-link>
            -o "${OUT_NAME}.link0${LIB_SUFFIX}" "@${OUT_NAME}_response"
        # Extra link step with internalize
        COMMAND $<TARGET_FILE:llvm-link> -internalize -only-needed "${name}.link0${LIB_SUFFIX}"
            -o "${OUT_NAME}${LIB_SUFFIX}" ${internal_link_libs}
        COMMAND $<TARGET_FILE:opt> -passes=amdgpu-unify-metadata,strip
            -o "${OUT_NAME}${STRIP_SUFFIX}" "${OUT_NAME}${LIB_SUFFIX}"
        COMMAND "${PREPARE_BUILTINS}"
            -o ${OUTPUT_BC_LIB} "${OUT_NAME}${STRIP_SUFFIX}"
            DEPENDS "${deps}" "${CMAKE_CURRENT_BINARY_DIR}/${OUT_NAME}_response" "${PREPARE_BUILTINS}" ${internal_link_libs})

    add_custom_target("${name}" ALL
        DEPENDS "${OUTPUT_DIR}/${OUT_NAME}${FINAL_SUFFIX}"
        SOURCES ${OPENCL_BC_LIB_SOURCES})
    set_target_properties(${name} PROPERTIES
        OUTPUT_NAME "${OUTPUT_DIR}/${OUT_NAME}${FINAL_SUFFIX}"
        ARCHIVE_OUTPUT_DIRECTORY "${CMAKE_CURRENT_BINARY_DIR}"
        ARCHIVE_OUTPUT_NAME "${name}"
        PREFIX "" SUFFIX ${FINAL_SUFFIX})

    list(APPEND clean_files
        "${OUT_NAME}${LIB_SUFFIX}" "${OUT_NAME}${STRIP_SUFFIX}")

    set_property(GLOBAL APPEND PROPERTY AMD_DEVICE_LIBS ${name})

    if(NOT ROCM_DEVICELIB_STANDALONE_BUILD)
        add_dependencies("${name}" llvm-link clang opt llvm-objdump)
    endif()

    if (TARGET prepare-builtins)
        add_dependencies("${name}" prepare-builtins)
    endif()

    set_directory_properties(PROPERTIES ADDITIONAL_MAKE_CLEAN_FILES "${clean_files}")
endmacro()
