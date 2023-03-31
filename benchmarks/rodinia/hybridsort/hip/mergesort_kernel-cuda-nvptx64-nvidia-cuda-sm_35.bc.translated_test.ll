; ModuleID = 'mergesort_kernel-cuda-nvptx64-nvidia-cuda-sm_35.bc.translated_test.bc'
source_filename = "mergesort_kernel.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

%struct.__cuda_builtin_blockIdx_t = type { i8 }
%struct.__cuda_builtin_blockDim_t = type { i8 }
%struct.__cuda_builtin_threadIdx_t = type { i8 }
%struct.float4 = type { float, float, float, float }

$_ZN25__cuda_builtin_blockIdx_t17__fetch_builtin_xEv = comdat any

$_ZN25__cuda_builtin_blockDim_t17__fetch_builtin_xEv = comdat any

$_ZN26__cuda_builtin_threadIdx_t17__fetch_builtin_xEv = comdat any

$_ZN25__cuda_builtin_blockIdx_t17__fetch_builtin_yEv = comdat any

@tex = addrspace(1) externally_initialized global i64 undef, align 4
@txt = addrspace(1) externally_initialized global i64 undef, align 4
@constStartAddr = addrspace(4) externally_initialized global [1025 x i32] zeroinitializer, align 16
@finalStartAddr = addrspace(4) externally_initialized global [1025 x i32] zeroinitializer, align 16
@nullElems = addrspace(4) externally_initialized global [1024 x i32] zeroinitializer, align 16
@blockIdx = extern_weak addrspace(1) global %struct.__cuda_builtin_blockIdx_t, align 1
@blockDim = extern_weak addrspace(1) global %struct.__cuda_builtin_blockDim_t, align 1
@threadIdx = extern_weak addrspace(1) global %struct.__cuda_builtin_threadIdx_t, align 1
@llvm.compiler.used = appending global [4 x ptr] [ptr addrspacecast (ptr addrspace(1) @tex to ptr), ptr addrspacecast (ptr addrspace(4) @constStartAddr to ptr), ptr addrspacecast (ptr addrspace(4) @finalStartAddr to ptr), ptr addrspacecast (ptr addrspace(4) @nullElems to ptr)], section "llvm.metadata"

; Function Attrs: convergent mustprogress noinline nounwind optnone
define %struct.float4 @_Z8sortElem6float4(ptr noundef byval(%struct.float4) align 16 %0) #0 {
  %2 = alloca %struct.float4, align 16, addrspace(5)
  %3 = addrspacecast ptr addrspace(5) %2 to ptr
  %4 = getelementptr inbounds %struct.float4, ptr %0, i32 0, i32 0
  %5 = load float, ptr %4, align 16
  %6 = getelementptr inbounds %struct.float4, ptr %0, i32 0, i32 1
  %7 = load float, ptr %6, align 4
  %8 = fcmp contract ogt float %5, %7
  br i1 %8, label %9, label %12

9:                                                ; preds = %1
  %10 = getelementptr inbounds %struct.float4, ptr %0, i32 0, i32 1
  %11 = load float, ptr %10, align 4
  br label %15

12:                                               ; preds = %1
  %13 = getelementptr inbounds %struct.float4, ptr %0, i32 0, i32 0
  %14 = load float, ptr %13, align 16
  br label %15

15:                                               ; preds = %12, %9
  %16 = phi contract float [ %11, %9 ], [ %14, %12 ]
  %17 = getelementptr inbounds %struct.float4, ptr %3, i32 0, i32 0
  store float %16, ptr %17, align 16
  %18 = getelementptr inbounds %struct.float4, ptr %0, i32 0, i32 1
  %19 = load float, ptr %18, align 4
  %20 = getelementptr inbounds %struct.float4, ptr %0, i32 0, i32 0
  %21 = load float, ptr %20, align 16
  %22 = fcmp contract ogt float %19, %21
  br i1 %22, label %23, label %26

23:                                               ; preds = %15
  %24 = getelementptr inbounds %struct.float4, ptr %0, i32 0, i32 1
  %25 = load float, ptr %24, align 4
  br label %29

26:                                               ; preds = %15
  %27 = getelementptr inbounds %struct.float4, ptr %0, i32 0, i32 0
  %28 = load float, ptr %27, align 16
  br label %29

29:                                               ; preds = %26, %23
  %30 = phi contract float [ %25, %23 ], [ %28, %26 ]
  %31 = getelementptr inbounds %struct.float4, ptr %3, i32 0, i32 1
  store float %30, ptr %31, align 4
  %32 = getelementptr inbounds %struct.float4, ptr %0, i32 0, i32 2
  %33 = load float, ptr %32, align 8
  %34 = getelementptr inbounds %struct.float4, ptr %0, i32 0, i32 3
  %35 = load float, ptr %34, align 4
  %36 = fcmp contract ogt float %33, %35
  br i1 %36, label %37, label %40

37:                                               ; preds = %29
  %38 = getelementptr inbounds %struct.float4, ptr %0, i32 0, i32 3
  %39 = load float, ptr %38, align 4
  br label %43

40:                                               ; preds = %29
  %41 = getelementptr inbounds %struct.float4, ptr %0, i32 0, i32 2
  %42 = load float, ptr %41, align 8
  br label %43

43:                                               ; preds = %40, %37
  %44 = phi contract float [ %39, %37 ], [ %42, %40 ]
  %45 = getelementptr inbounds %struct.float4, ptr %3, i32 0, i32 2
  store float %44, ptr %45, align 8
  %46 = getelementptr inbounds %struct.float4, ptr %0, i32 0, i32 3
  %47 = load float, ptr %46, align 4
  %48 = getelementptr inbounds %struct.float4, ptr %0, i32 0, i32 2
  %49 = load float, ptr %48, align 8
  %50 = fcmp contract ogt float %47, %49
  br i1 %50, label %51, label %54

51:                                               ; preds = %43
  %52 = getelementptr inbounds %struct.float4, ptr %0, i32 0, i32 3
  %53 = load float, ptr %52, align 4
  br label %57

54:                                               ; preds = %43
  %55 = getelementptr inbounds %struct.float4, ptr %0, i32 0, i32 2
  %56 = load float, ptr %55, align 8
  br label %57

57:                                               ; preds = %54, %51
  %58 = phi contract float [ %53, %51 ], [ %56, %54 ]
  %59 = getelementptr inbounds %struct.float4, ptr %3, i32 0, i32 3
  store float %58, ptr %59, align 4
  %60 = getelementptr inbounds %struct.float4, ptr %3, i32 0, i32 0
  %61 = load float, ptr %60, align 16
  %62 = getelementptr inbounds %struct.float4, ptr %3, i32 0, i32 2
  %63 = load float, ptr %62, align 8
  %64 = fcmp contract ogt float %61, %63
  br i1 %64, label %65, label %68

65:                                               ; preds = %57
  %66 = getelementptr inbounds %struct.float4, ptr %3, i32 0, i32 2
  %67 = load float, ptr %66, align 8
  br label %71

68:                                               ; preds = %57
  %69 = getelementptr inbounds %struct.float4, ptr %3, i32 0, i32 0
  %70 = load float, ptr %69, align 16
  br label %71

71:                                               ; preds = %68, %65
  %72 = phi contract float [ %67, %65 ], [ %70, %68 ]
  %73 = getelementptr inbounds %struct.float4, ptr %0, i32 0, i32 0
  store float %72, ptr %73, align 16
  %74 = getelementptr inbounds %struct.float4, ptr %3, i32 0, i32 1
  %75 = load float, ptr %74, align 4
  %76 = getelementptr inbounds %struct.float4, ptr %3, i32 0, i32 3
  %77 = load float, ptr %76, align 4
  %78 = fcmp contract ogt float %75, %77
  br i1 %78, label %79, label %82

79:                                               ; preds = %71
  %80 = getelementptr inbounds %struct.float4, ptr %3, i32 0, i32 3
  %81 = load float, ptr %80, align 4
  br label %85

82:                                               ; preds = %71
  %83 = getelementptr inbounds %struct.float4, ptr %3, i32 0, i32 1
  %84 = load float, ptr %83, align 4
  br label %85

85:                                               ; preds = %82, %79
  %86 = phi contract float [ %81, %79 ], [ %84, %82 ]
  %87 = getelementptr inbounds %struct.float4, ptr %0, i32 0, i32 1
  store float %86, ptr %87, align 4
  %88 = getelementptr inbounds %struct.float4, ptr %3, i32 0, i32 2
  %89 = load float, ptr %88, align 8
  %90 = getelementptr inbounds %struct.float4, ptr %3, i32 0, i32 0
  %91 = load float, ptr %90, align 16
  %92 = fcmp contract ogt float %89, %91
  br i1 %92, label %93, label %96

93:                                               ; preds = %85
  %94 = getelementptr inbounds %struct.float4, ptr %3, i32 0, i32 2
  %95 = load float, ptr %94, align 8
  br label %99

96:                                               ; preds = %85
  %97 = getelementptr inbounds %struct.float4, ptr %3, i32 0, i32 0
  %98 = load float, ptr %97, align 16
  br label %99

99:                                               ; preds = %96, %93
  %100 = phi contract float [ %95, %93 ], [ %98, %96 ]
  %101 = getelementptr inbounds %struct.float4, ptr %0, i32 0, i32 2
  store float %100, ptr %101, align 8
  %102 = getelementptr inbounds %struct.float4, ptr %3, i32 0, i32 3
  %103 = load float, ptr %102, align 4
  %104 = getelementptr inbounds %struct.float4, ptr %3, i32 0, i32 1
  %105 = load float, ptr %104, align 4
  %106 = fcmp contract ogt float %103, %105
  br i1 %106, label %107, label %110

107:                                              ; preds = %99
  %108 = getelementptr inbounds %struct.float4, ptr %3, i32 0, i32 3
  %109 = load float, ptr %108, align 4
  br label %113

110:                                              ; preds = %99
  %111 = getelementptr inbounds %struct.float4, ptr %3, i32 0, i32 1
  %112 = load float, ptr %111, align 4
  br label %113

113:                                              ; preds = %110, %107
  %114 = phi contract float [ %109, %107 ], [ %112, %110 ]
  %115 = getelementptr inbounds %struct.float4, ptr %0, i32 0, i32 3
  store float %114, ptr %115, align 4
  %116 = getelementptr inbounds %struct.float4, ptr %0, i32 0, i32 0
  %117 = load float, ptr %116, align 16
  %118 = getelementptr inbounds %struct.float4, ptr %3, i32 0, i32 0
  store float %117, ptr %118, align 16
  %119 = getelementptr inbounds %struct.float4, ptr %0, i32 0, i32 1
  %120 = load float, ptr %119, align 4
  %121 = getelementptr inbounds %struct.float4, ptr %0, i32 0, i32 2
  %122 = load float, ptr %121, align 8
  %123 = fcmp contract ogt float %120, %122
  br i1 %123, label %124, label %127

124:                                              ; preds = %113
  %125 = getelementptr inbounds %struct.float4, ptr %0, i32 0, i32 2
  %126 = load float, ptr %125, align 8
  br label %130

127:                                              ; preds = %113
  %128 = getelementptr inbounds %struct.float4, ptr %0, i32 0, i32 1
  %129 = load float, ptr %128, align 4
  br label %130

130:                                              ; preds = %127, %124
  %131 = phi contract float [ %126, %124 ], [ %129, %127 ]
  %132 = getelementptr inbounds %struct.float4, ptr %3, i32 0, i32 1
  store float %131, ptr %132, align 4
  %133 = getelementptr inbounds %struct.float4, ptr %0, i32 0, i32 2
  %134 = load float, ptr %133, align 8
  %135 = getelementptr inbounds %struct.float4, ptr %0, i32 0, i32 1
  %136 = load float, ptr %135, align 4
  %137 = fcmp contract ogt float %134, %136
  br i1 %137, label %138, label %141

138:                                              ; preds = %130
  %139 = getelementptr inbounds %struct.float4, ptr %0, i32 0, i32 2
  %140 = load float, ptr %139, align 8
  br label %144

141:                                              ; preds = %130
  %142 = getelementptr inbounds %struct.float4, ptr %0, i32 0, i32 1
  %143 = load float, ptr %142, align 4
  br label %144

144:                                              ; preds = %141, %138
  %145 = phi contract float [ %140, %138 ], [ %143, %141 ]
  %146 = getelementptr inbounds %struct.float4, ptr %3, i32 0, i32 2
  store float %145, ptr %146, align 8
  %147 = getelementptr inbounds %struct.float4, ptr %0, i32 0, i32 3
  %148 = load float, ptr %147, align 4
  %149 = getelementptr inbounds %struct.float4, ptr %3, i32 0, i32 3
  store float %148, ptr %149, align 4
  %150 = load %struct.float4, ptr %3, align 16
  ret %struct.float4 %150
}

; Function Attrs: convergent mustprogress noinline nounwind optnone
define %struct.float4 @_Z9getLowest6float4S_(ptr noundef byval(%struct.float4) align 16 %0, ptr noundef byval(%struct.float4) align 16 %1) #0 {
  %3 = alloca %struct.float4, align 16, addrspace(5)
  %4 = addrspacecast ptr addrspace(5) %3 to ptr
  %5 = getelementptr inbounds %struct.float4, ptr %0, i32 0, i32 0
  %6 = load float, ptr %5, align 16
  %7 = getelementptr inbounds %struct.float4, ptr %1, i32 0, i32 3
  %8 = load float, ptr %7, align 4
  %9 = fcmp contract olt float %6, %8
  br i1 %9, label %10, label %13

10:                                               ; preds = %2
  %11 = getelementptr inbounds %struct.float4, ptr %0, i32 0, i32 0
  %12 = load float, ptr %11, align 16
  br label %16

13:                                               ; preds = %2
  %14 = getelementptr inbounds %struct.float4, ptr %1, i32 0, i32 3
  %15 = load float, ptr %14, align 4
  br label %16

16:                                               ; preds = %13, %10
  %17 = phi contract float [ %12, %10 ], [ %15, %13 ]
  %18 = getelementptr inbounds %struct.float4, ptr %0, i32 0, i32 0
  store float %17, ptr %18, align 16
  %19 = getelementptr inbounds %struct.float4, ptr %0, i32 0, i32 1
  %20 = load float, ptr %19, align 4
  %21 = getelementptr inbounds %struct.float4, ptr %1, i32 0, i32 2
  %22 = load float, ptr %21, align 8
  %23 = fcmp contract olt float %20, %22
  br i1 %23, label %24, label %27

24:                                               ; preds = %16
  %25 = getelementptr inbounds %struct.float4, ptr %0, i32 0, i32 1
  %26 = load float, ptr %25, align 4
  br label %30

27:                                               ; preds = %16
  %28 = getelementptr inbounds %struct.float4, ptr %1, i32 0, i32 2
  %29 = load float, ptr %28, align 8
  br label %30

30:                                               ; preds = %27, %24
  %31 = phi contract float [ %26, %24 ], [ %29, %27 ]
  %32 = getelementptr inbounds %struct.float4, ptr %0, i32 0, i32 1
  store float %31, ptr %32, align 4
  %33 = getelementptr inbounds %struct.float4, ptr %0, i32 0, i32 2
  %34 = load float, ptr %33, align 8
  %35 = getelementptr inbounds %struct.float4, ptr %1, i32 0, i32 1
  %36 = load float, ptr %35, align 4
  %37 = fcmp contract olt float %34, %36
  br i1 %37, label %38, label %41

38:                                               ; preds = %30
  %39 = getelementptr inbounds %struct.float4, ptr %0, i32 0, i32 2
  %40 = load float, ptr %39, align 8
  br label %44

41:                                               ; preds = %30
  %42 = getelementptr inbounds %struct.float4, ptr %1, i32 0, i32 1
  %43 = load float, ptr %42, align 4
  br label %44

44:                                               ; preds = %41, %38
  %45 = phi contract float [ %40, %38 ], [ %43, %41 ]
  %46 = getelementptr inbounds %struct.float4, ptr %0, i32 0, i32 2
  store float %45, ptr %46, align 8
  %47 = getelementptr inbounds %struct.float4, ptr %0, i32 0, i32 3
  %48 = load float, ptr %47, align 4
  %49 = getelementptr inbounds %struct.float4, ptr %1, i32 0, i32 0
  %50 = load float, ptr %49, align 16
  %51 = fcmp contract olt float %48, %50
  br i1 %51, label %52, label %55

52:                                               ; preds = %44
  %53 = getelementptr inbounds %struct.float4, ptr %0, i32 0, i32 3
  %54 = load float, ptr %53, align 4
  br label %58

55:                                               ; preds = %44
  %56 = getelementptr inbounds %struct.float4, ptr %1, i32 0, i32 0
  %57 = load float, ptr %56, align 16
  br label %58

58:                                               ; preds = %55, %52
  %59 = phi contract float [ %54, %52 ], [ %57, %55 ]
  %60 = getelementptr inbounds %struct.float4, ptr %0, i32 0, i32 3
  store float %59, ptr %60, align 4
  call void @llvm.memcpy.p0.p0.i64(ptr align 16 %4, ptr align 16 %0, i64 16, i1 false)
  %61 = load %struct.float4, ptr %4, align 16
  ret %struct.float4 %61
}

; Function Attrs: argmemonly nocallback nofree nounwind willreturn
declare void @llvm.memcpy.p0.p0.i64(ptr noalias nocapture writeonly, ptr noalias nocapture readonly, i64, i1 immarg) #1

; Function Attrs: convergent mustprogress noinline nounwind optnone
define %struct.float4 @_Z10getHighest6float4S_(ptr noundef byval(%struct.float4) align 16 %0, ptr noundef byval(%struct.float4) align 16 %1) #0 {
  %3 = alloca %struct.float4, align 16, addrspace(5)
  %4 = addrspacecast ptr addrspace(5) %3 to ptr
  %5 = getelementptr inbounds %struct.float4, ptr %0, i32 0, i32 3
  %6 = load float, ptr %5, align 4
  %7 = getelementptr inbounds %struct.float4, ptr %1, i32 0, i32 0
  %8 = load float, ptr %7, align 16
  %9 = fcmp contract oge float %6, %8
  br i1 %9, label %10, label %13

10:                                               ; preds = %2
  %11 = getelementptr inbounds %struct.float4, ptr %0, i32 0, i32 3
  %12 = load float, ptr %11, align 4
  br label %16

13:                                               ; preds = %2
  %14 = getelementptr inbounds %struct.float4, ptr %1, i32 0, i32 0
  %15 = load float, ptr %14, align 16
  br label %16

16:                                               ; preds = %13, %10
  %17 = phi contract float [ %12, %10 ], [ %15, %13 ]
  %18 = getelementptr inbounds %struct.float4, ptr %1, i32 0, i32 0
  store float %17, ptr %18, align 16
  %19 = getelementptr inbounds %struct.float4, ptr %0, i32 0, i32 2
  %20 = load float, ptr %19, align 8
  %21 = getelementptr inbounds %struct.float4, ptr %1, i32 0, i32 1
  %22 = load float, ptr %21, align 4
  %23 = fcmp contract oge float %20, %22
  br i1 %23, label %24, label %27

24:                                               ; preds = %16
  %25 = getelementptr inbounds %struct.float4, ptr %0, i32 0, i32 2
  %26 = load float, ptr %25, align 8
  br label %30

27:                                               ; preds = %16
  %28 = getelementptr inbounds %struct.float4, ptr %1, i32 0, i32 1
  %29 = load float, ptr %28, align 4
  br label %30

30:                                               ; preds = %27, %24
  %31 = phi contract float [ %26, %24 ], [ %29, %27 ]
  %32 = getelementptr inbounds %struct.float4, ptr %1, i32 0, i32 1
  store float %31, ptr %32, align 4
  %33 = getelementptr inbounds %struct.float4, ptr %0, i32 0, i32 1
  %34 = load float, ptr %33, align 4
  %35 = getelementptr inbounds %struct.float4, ptr %1, i32 0, i32 2
  %36 = load float, ptr %35, align 8
  %37 = fcmp contract oge float %34, %36
  br i1 %37, label %38, label %41

38:                                               ; preds = %30
  %39 = getelementptr inbounds %struct.float4, ptr %0, i32 0, i32 1
  %40 = load float, ptr %39, align 4
  br label %44

41:                                               ; preds = %30
  %42 = getelementptr inbounds %struct.float4, ptr %1, i32 0, i32 2
  %43 = load float, ptr %42, align 8
  br label %44

44:                                               ; preds = %41, %38
  %45 = phi contract float [ %40, %38 ], [ %43, %41 ]
  %46 = getelementptr inbounds %struct.float4, ptr %1, i32 0, i32 2
  store float %45, ptr %46, align 8
  %47 = getelementptr inbounds %struct.float4, ptr %0, i32 0, i32 0
  %48 = load float, ptr %47, align 16
  %49 = getelementptr inbounds %struct.float4, ptr %1, i32 0, i32 3
  %50 = load float, ptr %49, align 4
  %51 = fcmp contract oge float %48, %50
  br i1 %51, label %52, label %55

52:                                               ; preds = %44
  %53 = getelementptr inbounds %struct.float4, ptr %0, i32 0, i32 0
  %54 = load float, ptr %53, align 16
  br label %58

55:                                               ; preds = %44
  %56 = getelementptr inbounds %struct.float4, ptr %1, i32 0, i32 3
  %57 = load float, ptr %56, align 4
  br label %58

58:                                               ; preds = %55, %52
  %59 = phi contract float [ %54, %52 ], [ %57, %55 ]
  %60 = getelementptr inbounds %struct.float4, ptr %1, i32 0, i32 3
  store float %59, ptr %60, align 4
  call void @llvm.memcpy.p0.p0.i64(ptr align 16 %4, ptr align 16 %1, i64 16, i1 false)
  %61 = load %struct.float4, ptr %4, align 16
  ret %struct.float4 %61
}

; Function Attrs: convergent mustprogress noinline norecurse nounwind optnone
define amdgpu_kernel void @_Z14mergeSortFirstP6float4i(ptr addrspace(1) noundef %0, i32 noundef %1) #2 {
  %3 = alloca ptr, align 8, addrspace(5)
  %4 = addrspacecast ptr addrspace(5) %3 to ptr
  %5 = alloca i32, align 4, addrspace(5)
  %6 = addrspacecast ptr addrspace(5) %5 to ptr
  %7 = alloca i32, align 4, addrspace(5)
  %8 = addrspacecast ptr addrspace(5) %7 to ptr
  %9 = alloca %struct.float4, align 16, addrspace(5)
  %10 = addrspacecast ptr addrspace(5) %9 to ptr
  %11 = alloca i64, align 4, addrspace(5)
  %12 = addrspacecast ptr addrspace(5) %11 to ptr
  %13 = alloca %struct.float4, align 16, addrspace(5)
  %14 = addrspacecast ptr addrspace(5) %13 to ptr
  %15 = alloca %struct.float4, align 16, addrspace(5)
  %16 = addrspacecast ptr addrspace(5) %15 to ptr
  %17 = addrspacecast ptr addrspace(1) %0 to ptr
  store ptr %17, ptr %4, align 8
  store i32 %1, ptr %6, align 4
  %18 = call noundef i32 @_ZN25__cuda_builtin_blockIdx_t17__fetch_builtin_xEv() #7
  store i32 %18, ptr %8, align 4
  %19 = load i32, ptr %8, align 4
  %20 = call noundef i32 @_ZN25__cuda_builtin_blockDim_t17__fetch_builtin_xEv() #7
  %21 = mul i32 %19, %20
  %22 = call noundef i32 @_ZN26__cuda_builtin_threadIdx_t17__fetch_builtin_xEv() #7
  %23 = add i32 %21, %22
  %24 = load i32, ptr %6, align 4
  %25 = sdiv i32 %24, 4
  %26 = icmp ult i32 %23, %25
  br i1 %26, label %27, label %61

27:                                               ; preds = %2
  %28 = call i64 @llvm.nvvm.texsurf.handle.internal.p1(ptr addrspace(1) @tex)
  store i64 %28, ptr %12, align 4
  %29 = load i32, ptr %8, align 4
  %30 = call noundef i32 @_ZN25__cuda_builtin_blockDim_t17__fetch_builtin_xEv() #7
  %31 = mul i32 %29, %30
  %32 = call noundef i32 @_ZN26__cuda_builtin_threadIdx_t17__fetch_builtin_xEv() #7
  %33 = add i32 %31, %32
  %34 = load i64, ptr %12, align 4
  %35 = call %struct.float4 @_ZL10tex1DfetchI6float4EN17__nv_tex_rmet_retIT_E4typeE7textureIS2_Li1EL19cudaTextureReadMode0EEi(i64 %34, i32 noundef %33) #7
  %36 = getelementptr inbounds %struct.float4, ptr %10, i32 0, i32 0
  %37 = extractvalue %struct.float4 %35, 0
  store float %37, ptr %36, align 16
  %38 = getelementptr inbounds %struct.float4, ptr %10, i32 0, i32 1
  %39 = extractvalue %struct.float4 %35, 1
  store float %39, ptr %38, align 4
  %40 = getelementptr inbounds %struct.float4, ptr %10, i32 0, i32 2
  %41 = extractvalue %struct.float4 %35, 2
  store float %41, ptr %40, align 8
  %42 = getelementptr inbounds %struct.float4, ptr %10, i32 0, i32 3
  %43 = extractvalue %struct.float4 %35, 3
  store float %43, ptr %42, align 4
  call void @llvm.memcpy.p0.p0.i64(ptr align 16 %16, ptr align 16 %10, i64 16, i1 false)
  %44 = call %struct.float4 @_Z8sortElem6float4(ptr noundef byval(%struct.float4) align 16 %16) #7
  %45 = getelementptr inbounds %struct.float4, ptr %14, i32 0, i32 0
  %46 = extractvalue %struct.float4 %44, 0
  store float %46, ptr %45, align 16
  %47 = getelementptr inbounds %struct.float4, ptr %14, i32 0, i32 1
  %48 = extractvalue %struct.float4 %44, 1
  store float %48, ptr %47, align 4
  %49 = getelementptr inbounds %struct.float4, ptr %14, i32 0, i32 2
  %50 = extractvalue %struct.float4 %44, 2
  store float %50, ptr %49, align 8
  %51 = getelementptr inbounds %struct.float4, ptr %14, i32 0, i32 3
  %52 = extractvalue %struct.float4 %44, 3
  store float %52, ptr %51, align 4
  %53 = load ptr, ptr %4, align 8
  %54 = load i32, ptr %8, align 4
  %55 = call noundef i32 @_ZN25__cuda_builtin_blockDim_t17__fetch_builtin_xEv() #7
  %56 = mul i32 %54, %55
  %57 = call noundef i32 @_ZN26__cuda_builtin_threadIdx_t17__fetch_builtin_xEv() #7
  %58 = add i32 %56, %57
  %59 = zext i32 %58 to i64
  %60 = getelementptr inbounds %struct.float4, ptr %53, i64 %59
  call void @llvm.memcpy.p0.p0.i64(ptr align 16 %60, ptr align 16 %14, i64 16, i1 false)
  br label %61

61:                                               ; preds = %27, %2
  ret void
}

; Function Attrs: alwaysinline convergent mustprogress nounwind
define linkonce_odr noundef i32 @_ZN25__cuda_builtin_blockIdx_t17__fetch_builtin_xEv() #3 comdat align 2 {
  %1 = call i32 @llvm.amdgcn.workgroup.id.x()
  ret i32 %1
}

; Function Attrs: alwaysinline convergent mustprogress nounwind
define linkonce_odr noundef i32 @_ZN25__cuda_builtin_blockDim_t17__fetch_builtin_xEv() #3 comdat align 2 {
  %1 = call i32 @cudaamd.nvvm.read.ptx.sreg.ntid.x()
  ret i32 %1
}

; Function Attrs: alwaysinline convergent mustprogress nounwind
define linkonce_odr noundef i32 @_ZN26__cuda_builtin_threadIdx_t17__fetch_builtin_xEv() #3 comdat align 2 {
  %1 = call i32 @llvm.amdgcn.workitem.id.x()
  ret i32 %1
}

; Function Attrs: alwaysinline convergent mustprogress nounwind
define internal %struct.float4 @_ZL10tex1DfetchI6float4EN17__nv_tex_rmet_retIT_E4typeE7textureIS2_Li1EL19cudaTextureReadMode0EEi(i64 %0, i32 noundef %1) #3 {
  %3 = alloca %struct.float4, align 16, addrspace(5)
  %4 = addrspacecast ptr addrspace(5) %3 to ptr
  %5 = alloca i64, align 4, addrspace(5)
  %6 = addrspacecast ptr addrspace(5) %5 to ptr
  %7 = alloca i32, align 4, addrspace(5)
  %8 = addrspacecast ptr addrspace(5) %7 to ptr
  %9 = alloca i64, align 4, addrspace(5)
  %10 = addrspacecast ptr addrspace(5) %9 to ptr
  store i64 %0, ptr %6, align 4
  store i32 %1, ptr %8, align 4
  %11 = load i64, ptr %6, align 4
  store i64 %11, ptr %10, align 4
  %12 = load i32, ptr %8, align 4
  %13 = load i64, ptr %10, align 4
  call void @_ZN12_GLOBAL__N_110__cuda_tex11__tex_fetchINS0_5__TagILi95EEE6float47textureIS4_Li1EL19cudaTextureReadMode0EEJiEEEvPT0_T1_DpT2_(ptr noundef %4, i64 %13, i32 noundef %12) #7
  %14 = load %struct.float4, ptr %4, align 16
  ret %struct.float4 %14
}

; Function Attrs: nounwind readnone
declare i64 @llvm.nvvm.texsurf.handle.internal.p1(ptr addrspace(1)) #4

; Function Attrs: convergent mustprogress noinline norecurse nounwind optnone
define amdgpu_kernel void @_Z13mergeSortPassP6float4ii(ptr addrspace(1) noundef %0, i32 noundef %1, i32 noundef %2) #2 {
  %4 = alloca ptr, align 8, addrspace(5)
  %5 = addrspacecast ptr addrspace(5) %4 to ptr
  %6 = alloca i32, align 4, addrspace(5)
  %7 = addrspacecast ptr addrspace(5) %6 to ptr
  %8 = alloca i32, align 4, addrspace(5)
  %9 = addrspacecast ptr addrspace(5) %8 to ptr
  %10 = alloca i32, align 4, addrspace(5)
  %11 = addrspacecast ptr addrspace(5) %10 to ptr
  %12 = alloca i32, align 4, addrspace(5)
  %13 = addrspacecast ptr addrspace(5) %12 to ptr
  %14 = alloca i32, align 4, addrspace(5)
  %15 = addrspacecast ptr addrspace(5) %14 to ptr
  %16 = alloca i32, align 4, addrspace(5)
  %17 = addrspacecast ptr addrspace(5) %16 to ptr
  %18 = alloca i32, align 4, addrspace(5)
  %19 = addrspacecast ptr addrspace(5) %18 to ptr
  %20 = alloca ptr, align 8, addrspace(5)
  %21 = addrspacecast ptr addrspace(5) %20 to ptr
  %22 = alloca i32, align 4, addrspace(5)
  %23 = addrspacecast ptr addrspace(5) %22 to ptr
  %24 = alloca %struct.float4, align 16, addrspace(5)
  %25 = addrspacecast ptr addrspace(5) %24 to ptr
  %26 = alloca i64, align 4, addrspace(5)
  %27 = addrspacecast ptr addrspace(5) %26 to ptr
  %28 = alloca i32, align 4, addrspace(5)
  %29 = addrspacecast ptr addrspace(5) %28 to ptr
  %30 = alloca i32, align 4, addrspace(5)
  %31 = addrspacecast ptr addrspace(5) %30 to ptr
  %32 = alloca i32, align 4, addrspace(5)
  %33 = addrspacecast ptr addrspace(5) %32 to ptr
  %34 = alloca %struct.float4, align 16, addrspace(5)
  %35 = addrspacecast ptr addrspace(5) %34 to ptr
  %36 = alloca %struct.float4, align 16, addrspace(5)
  %37 = addrspacecast ptr addrspace(5) %36 to ptr
  %38 = alloca %struct.float4, align 16, addrspace(5)
  %39 = addrspacecast ptr addrspace(5) %38 to ptr
  %40 = alloca i64, align 4, addrspace(5)
  %41 = addrspacecast ptr addrspace(5) %40 to ptr
  %42 = alloca %struct.float4, align 16, addrspace(5)
  %43 = addrspacecast ptr addrspace(5) %42 to ptr
  %44 = alloca i64, align 4, addrspace(5)
  %45 = addrspacecast ptr addrspace(5) %44 to ptr
  %46 = alloca %struct.float4, align 16, addrspace(5)
  %47 = addrspacecast ptr addrspace(5) %46 to ptr
  %48 = alloca i64, align 4, addrspace(5)
  %49 = addrspacecast ptr addrspace(5) %48 to ptr
  %50 = alloca %struct.float4, align 16, addrspace(5)
  %51 = addrspacecast ptr addrspace(5) %50 to ptr
  %52 = alloca i64, align 4, addrspace(5)
  %53 = addrspacecast ptr addrspace(5) %52 to ptr
  %54 = alloca %struct.float4, align 16, addrspace(5)
  %55 = addrspacecast ptr addrspace(5) %54 to ptr
  %56 = alloca %struct.float4, align 16, addrspace(5)
  %57 = addrspacecast ptr addrspace(5) %56 to ptr
  %58 = alloca %struct.float4, align 16, addrspace(5)
  %59 = addrspacecast ptr addrspace(5) %58 to ptr
  %60 = alloca %struct.float4, align 16, addrspace(5)
  %61 = addrspacecast ptr addrspace(5) %60 to ptr
  %62 = alloca %struct.float4, align 16, addrspace(5)
  %63 = addrspacecast ptr addrspace(5) %62 to ptr
  %64 = alloca %struct.float4, align 16, addrspace(5)
  %65 = addrspacecast ptr addrspace(5) %64 to ptr
  %66 = alloca %struct.float4, align 16, addrspace(5)
  %67 = addrspacecast ptr addrspace(5) %66 to ptr
  %68 = alloca %struct.float4, align 16, addrspace(5)
  %69 = addrspacecast ptr addrspace(5) %68 to ptr
  %70 = alloca %struct.float4, align 16, addrspace(5)
  %71 = addrspacecast ptr addrspace(5) %70 to ptr
  %72 = alloca %struct.float4, align 16, addrspace(5)
  %73 = addrspacecast ptr addrspace(5) %72 to ptr
  %74 = alloca i8, align 1, addrspace(5)
  %75 = addrspacecast ptr addrspace(5) %74 to ptr
  %76 = alloca i8, align 1, addrspace(5)
  %77 = addrspacecast ptr addrspace(5) %76 to ptr
  %78 = addrspacecast ptr addrspace(1) %0 to ptr
  store ptr %78, ptr %5, align 8
  store i32 %1, ptr %7, align 4
  store i32 %2, ptr %9, align 4
  %79 = call noundef i32 @_ZN25__cuda_builtin_blockIdx_t17__fetch_builtin_xEv() #7
  %80 = call noundef i32 @_ZN25__cuda_builtin_blockDim_t17__fetch_builtin_xEv() #7
  %81 = mul i32 %79, %80
  %82 = call noundef i32 @_ZN26__cuda_builtin_threadIdx_t17__fetch_builtin_xEv() #7
  %83 = add i32 %81, %82
  store i32 %83, ptr %11, align 4
  %84 = load i32, ptr %11, align 4
  %85 = load i32, ptr %9, align 4
  %86 = sdiv i32 %84, %85
  store i32 %86, ptr %13, align 4
  %87 = load i32, ptr %13, align 4
  %88 = icmp sge i32 %87, 1024
  br i1 %88, label %89, label %90

89:                                               ; preds = %3
  br label %325

90:                                               ; preds = %3
  %91 = load i32, ptr %11, align 4
  %92 = load i32, ptr %13, align 4
  %93 = load i32, ptr %9, align 4
  %94 = mul nsw i32 %92, %93
  %95 = sub nsw i32 %91, %94
  store i32 %95, ptr %15, align 4
  %96 = load i32, ptr %13, align 4
  %97 = sext i32 %96 to i64
  %98 = getelementptr inbounds [1025 x i32], ptr addrspacecast (ptr addrspace(4) @constStartAddr to ptr), i64 0, i64 %97
  %99 = load i32, ptr %98, align 4
  %100 = load i32, ptr %15, align 4
  %101 = load i32, ptr %7, align 4
  %102 = mul nsw i32 %100, %101
  %103 = add nsw i32 %99, %102
  store i32 %103, ptr %17, align 4
  %104 = load i32, ptr %17, align 4
  %105 = load i32, ptr %7, align 4
  %106 = sdiv i32 %105, 2
  %107 = add nsw i32 %104, %106
  store i32 %107, ptr %19, align 4
  %108 = load ptr, ptr %5, align 8
  %109 = load i32, ptr %17, align 4
  %110 = sext i32 %109 to i64
  %111 = getelementptr inbounds %struct.float4, ptr %108, i64 %110
  store ptr %111, ptr %21, align 8
  %112 = load i32, ptr %17, align 4
  %113 = load i32, ptr %13, align 4
  %114 = add nsw i32 %113, 1
  %115 = sext i32 %114 to i64
  %116 = getelementptr inbounds [1025 x i32], ptr addrspacecast (ptr addrspace(4) @constStartAddr to ptr), i64 0, i64 %115
  %117 = load i32, ptr %116, align 4
  %118 = icmp sge i32 %112, %117
  br i1 %118, label %119, label %120

119:                                              ; preds = %90
  br label %325

120:                                              ; preds = %90
  %121 = load i32, ptr %19, align 4
  %122 = load i32, ptr %13, align 4
  %123 = add nsw i32 %122, 1
  %124 = sext i32 %123 to i64
  %125 = getelementptr inbounds [1025 x i32], ptr addrspacecast (ptr addrspace(4) @constStartAddr to ptr), i64 0, i64 %124
  %126 = load i32, ptr %125, align 4
  %127 = icmp sge i32 %121, %126
  br i1 %127, label %128, label %162

128:                                              ; preds = %120
  store i32 0, ptr %23, align 4
  br label %129

129:                                              ; preds = %158, %128
  %130 = load i32, ptr %23, align 4
  %131 = load i32, ptr %13, align 4
  %132 = add nsw i32 %131, 1
  %133 = sext i32 %132 to i64
  %134 = getelementptr inbounds [1025 x i32], ptr addrspacecast (ptr addrspace(4) @constStartAddr to ptr), i64 0, i64 %133
  %135 = load i32, ptr %134, align 4
  %136 = load i32, ptr %17, align 4
  %137 = sub nsw i32 %135, %136
  %138 = icmp slt i32 %130, %137
  br i1 %138, label %139, label %161

139:                                              ; preds = %129
  %140 = call i64 @llvm.nvvm.texsurf.handle.internal.p1(ptr addrspace(1) @tex)
  store i64 %140, ptr %27, align 4
  %141 = load i32, ptr %17, align 4
  %142 = load i32, ptr %23, align 4
  %143 = add nsw i32 %141, %142
  %144 = load i64, ptr %27, align 4
  %145 = call %struct.float4 @_ZL10tex1DfetchI6float4EN17__nv_tex_rmet_retIT_E4typeE7textureIS2_Li1EL19cudaTextureReadMode0EEi(i64 %144, i32 noundef %143) #7
  %146 = getelementptr inbounds %struct.float4, ptr %25, i32 0, i32 0
  %147 = extractvalue %struct.float4 %145, 0
  store float %147, ptr %146, align 16
  %148 = getelementptr inbounds %struct.float4, ptr %25, i32 0, i32 1
  %149 = extractvalue %struct.float4 %145, 1
  store float %149, ptr %148, align 4
  %150 = getelementptr inbounds %struct.float4, ptr %25, i32 0, i32 2
  %151 = extractvalue %struct.float4 %145, 2
  store float %151, ptr %150, align 8
  %152 = getelementptr inbounds %struct.float4, ptr %25, i32 0, i32 3
  %153 = extractvalue %struct.float4 %145, 3
  store float %153, ptr %152, align 4
  %154 = load ptr, ptr %21, align 8
  %155 = load i32, ptr %23, align 4
  %156 = sext i32 %155 to i64
  %157 = getelementptr inbounds %struct.float4, ptr %154, i64 %156
  call void @llvm.memcpy.p0.p0.i64(ptr align 16 %157, ptr align 16 %25, i64 16, i1 false)
  br label %158

158:                                              ; preds = %139
  %159 = load i32, ptr %23, align 4
  %160 = add nsw i32 %159, 1
  store i32 %160, ptr %23, align 4
  br label %129, !llvm.loop !12

161:                                              ; preds = %129
  br label %325

162:                                              ; preds = %120
  store i32 0, ptr %29, align 4
  store i32 0, ptr %31, align 4
  store i32 0, ptr %33, align 4
  %163 = call i64 @llvm.nvvm.texsurf.handle.internal.p1(ptr addrspace(1) @tex)
  store i64 %163, ptr %41, align 4
  %164 = load i32, ptr %17, align 4
  %165 = load i32, ptr %29, align 4
  %166 = add nsw i32 %164, %165
  %167 = load i64, ptr %41, align 4
  %168 = call %struct.float4 @_ZL10tex1DfetchI6float4EN17__nv_tex_rmet_retIT_E4typeE7textureIS2_Li1EL19cudaTextureReadMode0EEi(i64 %167, i32 noundef %166) #7
  %169 = getelementptr inbounds %struct.float4, ptr %39, i32 0, i32 0
  %170 = extractvalue %struct.float4 %168, 0
  store float %170, ptr %169, align 16
  %171 = getelementptr inbounds %struct.float4, ptr %39, i32 0, i32 1
  %172 = extractvalue %struct.float4 %168, 1
  store float %172, ptr %171, align 4
  %173 = getelementptr inbounds %struct.float4, ptr %39, i32 0, i32 2
  %174 = extractvalue %struct.float4 %168, 2
  store float %174, ptr %173, align 8
  %175 = getelementptr inbounds %struct.float4, ptr %39, i32 0, i32 3
  %176 = extractvalue %struct.float4 %168, 3
  store float %176, ptr %175, align 4
  call void @llvm.memcpy.p0.p0.i64(ptr align 16 %35, ptr align 16 %39, i64 16, i1 false)
  %177 = call i64 @llvm.nvvm.texsurf.handle.internal.p1(ptr addrspace(1) @tex)
  store i64 %177, ptr %45, align 4
  %178 = load i32, ptr %19, align 4
  %179 = load i32, ptr %31, align 4
  %180 = add nsw i32 %178, %179
  %181 = load i64, ptr %45, align 4
  %182 = call %struct.float4 @_ZL10tex1DfetchI6float4EN17__nv_tex_rmet_retIT_E4typeE7textureIS2_Li1EL19cudaTextureReadMode0EEi(i64 %181, i32 noundef %180) #7
  %183 = getelementptr inbounds %struct.float4, ptr %43, i32 0, i32 0
  %184 = extractvalue %struct.float4 %182, 0
  store float %184, ptr %183, align 16
  %185 = getelementptr inbounds %struct.float4, ptr %43, i32 0, i32 1
  %186 = extractvalue %struct.float4 %182, 1
  store float %186, ptr %185, align 4
  %187 = getelementptr inbounds %struct.float4, ptr %43, i32 0, i32 2
  %188 = extractvalue %struct.float4 %182, 2
  store float %188, ptr %187, align 8
  %189 = getelementptr inbounds %struct.float4, ptr %43, i32 0, i32 3
  %190 = extractvalue %struct.float4 %182, 3
  store float %190, ptr %189, align 4
  call void @llvm.memcpy.p0.p0.i64(ptr align 16 %37, ptr align 16 %43, i64 16, i1 false)
  br label %191

191:                                              ; preds = %318, %162
  %192 = call i64 @llvm.nvvm.texsurf.handle.internal.p1(ptr addrspace(1) @tex)
  store i64 %192, ptr %49, align 4
  %193 = load i32, ptr %17, align 4
  %194 = load i32, ptr %29, align 4
  %195 = add nsw i32 %193, %194
  %196 = add nsw i32 %195, 1
  %197 = load i64, ptr %49, align 4
  %198 = call %struct.float4 @_ZL10tex1DfetchI6float4EN17__nv_tex_rmet_retIT_E4typeE7textureIS2_Li1EL19cudaTextureReadMode0EEi(i64 %197, i32 noundef %196) #7
  %199 = getelementptr inbounds %struct.float4, ptr %47, i32 0, i32 0
  %200 = extractvalue %struct.float4 %198, 0
  store float %200, ptr %199, align 16
  %201 = getelementptr inbounds %struct.float4, ptr %47, i32 0, i32 1
  %202 = extractvalue %struct.float4 %198, 1
  store float %202, ptr %201, align 4
  %203 = getelementptr inbounds %struct.float4, ptr %47, i32 0, i32 2
  %204 = extractvalue %struct.float4 %198, 2
  store float %204, ptr %203, align 8
  %205 = getelementptr inbounds %struct.float4, ptr %47, i32 0, i32 3
  %206 = extractvalue %struct.float4 %198, 3
  store float %206, ptr %205, align 4
  %207 = call i64 @llvm.nvvm.texsurf.handle.internal.p1(ptr addrspace(1) @tex)
  store i64 %207, ptr %53, align 4
  %208 = load i32, ptr %19, align 4
  %209 = load i32, ptr %31, align 4
  %210 = add nsw i32 %208, %209
  %211 = add nsw i32 %210, 1
  %212 = load i64, ptr %53, align 4
  %213 = call %struct.float4 @_ZL10tex1DfetchI6float4EN17__nv_tex_rmet_retIT_E4typeE7textureIS2_Li1EL19cudaTextureReadMode0EEi(i64 %212, i32 noundef %211) #7
  %214 = getelementptr inbounds %struct.float4, ptr %51, i32 0, i32 0
  %215 = extractvalue %struct.float4 %213, 0
  store float %215, ptr %214, align 16
  %216 = getelementptr inbounds %struct.float4, ptr %51, i32 0, i32 1
  %217 = extractvalue %struct.float4 %213, 1
  store float %217, ptr %216, align 4
  %218 = getelementptr inbounds %struct.float4, ptr %51, i32 0, i32 2
  %219 = extractvalue %struct.float4 %213, 2
  store float %219, ptr %218, align 8
  %220 = getelementptr inbounds %struct.float4, ptr %51, i32 0, i32 3
  %221 = extractvalue %struct.float4 %213, 3
  store float %221, ptr %220, align 4
  call void @llvm.memcpy.p0.p0.i64(ptr align 16 %57, ptr align 16 %35, i64 16, i1 false)
  call void @llvm.memcpy.p0.p0.i64(ptr align 16 %59, ptr align 16 %37, i64 16, i1 false)
  %222 = call %struct.float4 @_Z9getLowest6float4S_(ptr noundef byval(%struct.float4) align 16 %57, ptr noundef byval(%struct.float4) align 16 %59) #7
  %223 = getelementptr inbounds %struct.float4, ptr %55, i32 0, i32 0
  %224 = extractvalue %struct.float4 %222, 0
  store float %224, ptr %223, align 16
  %225 = getelementptr inbounds %struct.float4, ptr %55, i32 0, i32 1
  %226 = extractvalue %struct.float4 %222, 1
  store float %226, ptr %225, align 4
  %227 = getelementptr inbounds %struct.float4, ptr %55, i32 0, i32 2
  %228 = extractvalue %struct.float4 %222, 2
  store float %228, ptr %227, align 8
  %229 = getelementptr inbounds %struct.float4, ptr %55, i32 0, i32 3
  %230 = extractvalue %struct.float4 %222, 3
  store float %230, ptr %229, align 4
  call void @llvm.memcpy.p0.p0.i64(ptr align 16 %63, ptr align 16 %35, i64 16, i1 false)
  call void @llvm.memcpy.p0.p0.i64(ptr align 16 %65, ptr align 16 %37, i64 16, i1 false)
  %231 = call %struct.float4 @_Z10getHighest6float4S_(ptr noundef byval(%struct.float4) align 16 %63, ptr noundef byval(%struct.float4) align 16 %65) #7
  %232 = getelementptr inbounds %struct.float4, ptr %61, i32 0, i32 0
  %233 = extractvalue %struct.float4 %231, 0
  store float %233, ptr %232, align 16
  %234 = getelementptr inbounds %struct.float4, ptr %61, i32 0, i32 1
  %235 = extractvalue %struct.float4 %231, 1
  store float %235, ptr %234, align 4
  %236 = getelementptr inbounds %struct.float4, ptr %61, i32 0, i32 2
  %237 = extractvalue %struct.float4 %231, 2
  store float %237, ptr %236, align 8
  %238 = getelementptr inbounds %struct.float4, ptr %61, i32 0, i32 3
  %239 = extractvalue %struct.float4 %231, 3
  store float %239, ptr %238, align 4
  call void @llvm.memcpy.p0.p0.i64(ptr align 16 %69, ptr align 16 %55, i64 16, i1 false)
  %240 = call %struct.float4 @_Z8sortElem6float4(ptr noundef byval(%struct.float4) align 16 %69) #7
  %241 = getelementptr inbounds %struct.float4, ptr %67, i32 0, i32 0
  %242 = extractvalue %struct.float4 %240, 0
  store float %242, ptr %241, align 16
  %243 = getelementptr inbounds %struct.float4, ptr %67, i32 0, i32 1
  %244 = extractvalue %struct.float4 %240, 1
  store float %244, ptr %243, align 4
  %245 = getelementptr inbounds %struct.float4, ptr %67, i32 0, i32 2
  %246 = extractvalue %struct.float4 %240, 2
  store float %246, ptr %245, align 8
  %247 = getelementptr inbounds %struct.float4, ptr %67, i32 0, i32 3
  %248 = extractvalue %struct.float4 %240, 3
  store float %248, ptr %247, align 4
  call void @llvm.memcpy.p0.p0.i64(ptr align 16 %35, ptr align 16 %67, i64 16, i1 false)
  call void @llvm.memcpy.p0.p0.i64(ptr align 16 %73, ptr align 16 %61, i64 16, i1 false)
  %249 = call %struct.float4 @_Z8sortElem6float4(ptr noundef byval(%struct.float4) align 16 %73) #7
  %250 = getelementptr inbounds %struct.float4, ptr %71, i32 0, i32 0
  %251 = extractvalue %struct.float4 %249, 0
  store float %251, ptr %250, align 16
  %252 = getelementptr inbounds %struct.float4, ptr %71, i32 0, i32 1
  %253 = extractvalue %struct.float4 %249, 1
  store float %253, ptr %252, align 4
  %254 = getelementptr inbounds %struct.float4, ptr %71, i32 0, i32 2
  %255 = extractvalue %struct.float4 %249, 2
  store float %255, ptr %254, align 8
  %256 = getelementptr inbounds %struct.float4, ptr %71, i32 0, i32 3
  %257 = extractvalue %struct.float4 %249, 3
  store float %257, ptr %256, align 4
  call void @llvm.memcpy.p0.p0.i64(ptr align 16 %37, ptr align 16 %71, i64 16, i1 false)
  %258 = load ptr, ptr %21, align 8
  %259 = load i32, ptr %33, align 4
  %260 = add nsw i32 %259, 1
  store i32 %260, ptr %33, align 4
  %261 = sext i32 %259 to i64
  %262 = getelementptr inbounds %struct.float4, ptr %258, i64 %261
  call void @llvm.memcpy.p0.p0.i64(ptr align 16 %262, ptr align 16 %35, i64 16, i1 false)
  %263 = load i32, ptr %29, align 4
  %264 = add nsw i32 %263, 1
  %265 = load i32, ptr %7, align 4
  %266 = sdiv i32 %265, 2
  %267 = icmp slt i32 %264, %266
  %268 = zext i1 %267 to i8
  store i8 %268, ptr %75, align 1
  %269 = load i32, ptr %31, align 4
  %270 = add nsw i32 %269, 1
  %271 = load i32, ptr %7, align 4
  %272 = sdiv i32 %271, 2
  %273 = icmp slt i32 %270, %272
  br i1 %273, label %274, label %285

274:                                              ; preds = %191
  %275 = load i32, ptr %19, align 4
  %276 = load i32, ptr %31, align 4
  %277 = add nsw i32 %275, %276
  %278 = add nsw i32 %277, 1
  %279 = load i32, ptr %13, align 4
  %280 = add nsw i32 %279, 1
  %281 = sext i32 %280 to i64
  %282 = getelementptr inbounds [1025 x i32], ptr addrspacecast (ptr addrspace(4) @constStartAddr to ptr), i64 0, i64 %281
  %283 = load i32, ptr %282, align 4
  %284 = icmp slt i32 %278, %283
  br label %285

285:                                              ; preds = %274, %191
  %286 = phi i1 [ false, %191 ], [ %284, %274 ]
  %287 = zext i1 %286 to i8
  store i8 %287, ptr %77, align 1
  %288 = load i8, ptr %75, align 1
  %289 = trunc i8 %288 to i1
  br i1 %289, label %290, label %310

290:                                              ; preds = %285
  %291 = load i8, ptr %77, align 1
  %292 = trunc i8 %291 to i1
  br i1 %292, label %293, label %306

293:                                              ; preds = %290
  %294 = getelementptr inbounds %struct.float4, ptr %47, i32 0, i32 0
  %295 = load float, ptr %294, align 16
  %296 = getelementptr inbounds %struct.float4, ptr %51, i32 0, i32 0
  %297 = load float, ptr %296, align 16
  %298 = fcmp contract olt float %295, %297
  br i1 %298, label %299, label %302

299:                                              ; preds = %293
  %300 = load i32, ptr %29, align 4
  %301 = add nsw i32 %300, 1
  store i32 %301, ptr %29, align 4
  call void @llvm.memcpy.p0.p0.i64(ptr align 16 %35, ptr align 16 %47, i64 16, i1 false)
  br label %305

302:                                              ; preds = %293
  %303 = load i32, ptr %31, align 4
  %304 = add nsw i32 %303, 1
  store i32 %304, ptr %31, align 4
  call void @llvm.memcpy.p0.p0.i64(ptr align 16 %35, ptr align 16 %51, i64 16, i1 false)
  br label %305

305:                                              ; preds = %302, %299
  br label %309

306:                                              ; preds = %290
  %307 = load i32, ptr %29, align 4
  %308 = add nsw i32 %307, 1
  store i32 %308, ptr %29, align 4
  call void @llvm.memcpy.p0.p0.i64(ptr align 16 %35, ptr align 16 %47, i64 16, i1 false)
  br label %309

309:                                              ; preds = %306, %305
  br label %318

310:                                              ; preds = %285
  %311 = load i8, ptr %77, align 1
  %312 = trunc i8 %311 to i1
  br i1 %312, label %313, label %316

313:                                              ; preds = %310
  %314 = load i32, ptr %31, align 4
  %315 = add nsw i32 %314, 1
  store i32 %315, ptr %31, align 4
  call void @llvm.memcpy.p0.p0.i64(ptr align 16 %35, ptr align 16 %51, i64 16, i1 false)
  br label %317

316:                                              ; preds = %310
  br label %319

317:                                              ; preds = %313
  br label %318

318:                                              ; preds = %317, %309
  br label %191, !llvm.loop !14

319:                                              ; preds = %316
  %320 = load ptr, ptr %21, align 8
  %321 = load i32, ptr %33, align 4
  %322 = add nsw i32 %321, 1
  store i32 %322, ptr %33, align 4
  %323 = sext i32 %321 to i64
  %324 = getelementptr inbounds %struct.float4, ptr %320, i64 %323
  call void @llvm.memcpy.p0.p0.i64(ptr align 16 %324, ptr align 16 %37, i64 16, i1 false)
  br label %325

325:                                              ; preds = %319, %161, %119, %89
  ret void
}

; Function Attrs: convergent mustprogress noinline norecurse nounwind optnone
define amdgpu_kernel void @_Z9mergepackPfS_(ptr addrspace(1) noundef %0, ptr addrspace(1) noundef %1) #2 {
  %3 = alloca ptr, align 8, addrspace(5)
  %4 = addrspacecast ptr addrspace(5) %3 to ptr
  %5 = alloca ptr, align 8, addrspace(5)
  %6 = addrspacecast ptr addrspace(5) %5 to ptr
  %7 = alloca i32, align 4, addrspace(5)
  %8 = addrspacecast ptr addrspace(5) %7 to ptr
  %9 = alloca i32, align 4, addrspace(5)
  %10 = addrspacecast ptr addrspace(5) %9 to ptr
  %11 = addrspacecast ptr addrspace(1) %0 to ptr
  store ptr %11, ptr %4, align 8
  %12 = addrspacecast ptr addrspace(1) %1 to ptr
  store ptr %12, ptr %6, align 8
  %13 = call noundef i32 @_ZN25__cuda_builtin_blockIdx_t17__fetch_builtin_xEv() #7
  %14 = call noundef i32 @_ZN25__cuda_builtin_blockDim_t17__fetch_builtin_xEv() #7
  %15 = mul i32 %13, %14
  %16 = call noundef i32 @_ZN26__cuda_builtin_threadIdx_t17__fetch_builtin_xEv() #7
  %17 = add i32 %15, %16
  store i32 %17, ptr %8, align 4
  %18 = call noundef i32 @_ZN25__cuda_builtin_blockIdx_t17__fetch_builtin_yEv() #7
  store i32 %18, ptr %10, align 4
  %19 = load i32, ptr %10, align 4
  %20 = sext i32 %19 to i64
  %21 = getelementptr inbounds [1025 x i32], ptr addrspacecast (ptr addrspace(4) @finalStartAddr to ptr), i64 0, i64 %20
  %22 = load i32, ptr %21, align 4
  %23 = load i32, ptr %8, align 4
  %24 = add nsw i32 %22, %23
  %25 = load i32, ptr %10, align 4
  %26 = add nsw i32 %25, 1
  %27 = sext i32 %26 to i64
  %28 = getelementptr inbounds [1025 x i32], ptr addrspacecast (ptr addrspace(4) @finalStartAddr to ptr), i64 0, i64 %27
  %29 = load i32, ptr %28, align 4
  %30 = icmp sge i32 %24, %29
  br i1 %30, label %31, label %32

31:                                               ; preds = %2
  br label %58

32:                                               ; preds = %2
  %33 = load ptr, ptr %4, align 8
  %34 = load i32, ptr %10, align 4
  %35 = sext i32 %34 to i64
  %36 = getelementptr inbounds [1025 x i32], ptr addrspacecast (ptr addrspace(4) @constStartAddr to ptr), i64 0, i64 %35
  %37 = load i32, ptr %36, align 4
  %38 = mul nsw i32 %37, 4
  %39 = load i32, ptr %10, align 4
  %40 = sext i32 %39 to i64
  %41 = getelementptr inbounds [1024 x i32], ptr addrspacecast (ptr addrspace(4) @nullElems to ptr), i64 0, i64 %40
  %42 = load i32, ptr %41, align 4
  %43 = add nsw i32 %38, %42
  %44 = load i32, ptr %8, align 4
  %45 = add nsw i32 %43, %44
  %46 = sext i32 %45 to i64
  %47 = getelementptr inbounds float, ptr %33, i64 %46
  %48 = load float, ptr %47, align 4
  %49 = load ptr, ptr %6, align 8
  %50 = load i32, ptr %10, align 4
  %51 = sext i32 %50 to i64
  %52 = getelementptr inbounds [1025 x i32], ptr addrspacecast (ptr addrspace(4) @finalStartAddr to ptr), i64 0, i64 %51
  %53 = load i32, ptr %52, align 4
  %54 = load i32, ptr %8, align 4
  %55 = add nsw i32 %53, %54
  %56 = sext i32 %55 to i64
  %57 = getelementptr inbounds float, ptr %49, i64 %56
  store float %48, ptr %57, align 4
  br label %58

58:                                               ; preds = %32, %31
  ret void
}

; Function Attrs: alwaysinline convergent mustprogress nounwind
define linkonce_odr noundef i32 @_ZN25__cuda_builtin_blockIdx_t17__fetch_builtin_yEv() #3 comdat align 2 {
  %1 = call i32 @llvm.amdgcn.workgroup.id.y()
  ret i32 %1
}

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.nvvm.read.ptx.sreg.ctaid.x() #5

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.nvvm.read.ptx.sreg.ntid.x() #5

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.nvvm.read.ptx.sreg.tid.x() #5

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.nvvm.read.ptx.sreg.ctaid.y() #5

; Function Attrs: convergent mustprogress noinline nounwind optnone
define internal void @_ZN12_GLOBAL__N_110__cuda_tex11__tex_fetchINS0_5__TagILi95EEE6float47textureIS4_Li1EL19cudaTextureReadMode0EEJiEEEvPT0_T1_DpT2_(ptr noundef %0, i64 %1, i32 noundef %2) #0 {
  %4 = alloca ptr, align 8, addrspace(5)
  %5 = addrspacecast ptr addrspace(5) %4 to ptr
  %6 = alloca i64, align 4, addrspace(5)
  %7 = addrspacecast ptr addrspace(5) %6 to ptr
  %8 = alloca i32, align 4, addrspace(5)
  %9 = addrspacecast ptr addrspace(5) %8 to ptr
  %10 = alloca %struct.float4, align 16, addrspace(5)
  %11 = addrspacecast ptr addrspace(5) %10 to ptr
  %12 = alloca %struct.float4, align 16, addrspace(5)
  %13 = addrspacecast ptr addrspace(5) %12 to ptr
  %14 = alloca i64, align 4, addrspace(5)
  %15 = addrspacecast ptr addrspace(5) %14 to ptr
  store ptr %0, ptr %5, align 8
  store i64 %1, ptr %7, align 4
  store i32 %2, ptr %9, align 4
  %16 = load i64, ptr %7, align 4
  store i64 %16, ptr %15, align 4
  %17 = load i64, ptr %15, align 4
  %18 = call noundef i64 @_ZN12_GLOBAL__N_110__cuda_tex19__tex_handle_to_objI7textureI6float4Li1EL19cudaTextureReadMode0EEEEyT_(i64 %17) #7
  %19 = load i32, ptr %9, align 4
  %20 = call %struct.float4 @_ZN12_GLOBAL__N_110__cuda_tex14__tex_fetch_v4INS0_5__TagILi95EEEE5__runI6float4EET_yi(i64 noundef %18, i32 noundef %19) #7
  %21 = getelementptr inbounds %struct.float4, ptr %13, i32 0, i32 0
  %22 = extractvalue %struct.float4 %20, 0
  store float %22, ptr %21, align 16
  %23 = getelementptr inbounds %struct.float4, ptr %13, i32 0, i32 1
  %24 = extractvalue %struct.float4 %20, 1
  store float %24, ptr %23, align 4
  %25 = getelementptr inbounds %struct.float4, ptr %13, i32 0, i32 2
  %26 = extractvalue %struct.float4 %20, 2
  store float %26, ptr %25, align 8
  %27 = getelementptr inbounds %struct.float4, ptr %13, i32 0, i32 3
  %28 = extractvalue %struct.float4 %20, 3
  store float %28, ptr %27, align 4
  %29 = call %struct.float4 @_ZN12_GLOBAL__N_110__cuda_tex9__convertI6float4S2_E5__runILi4EEES2_S2_(ptr noundef byval(%struct.float4) align 16 %13) #7
  %30 = getelementptr inbounds %struct.float4, ptr %11, i32 0, i32 0
  %31 = extractvalue %struct.float4 %29, 0
  store float %31, ptr %30, align 16
  %32 = getelementptr inbounds %struct.float4, ptr %11, i32 0, i32 1
  %33 = extractvalue %struct.float4 %29, 1
  store float %33, ptr %32, align 4
  %34 = getelementptr inbounds %struct.float4, ptr %11, i32 0, i32 2
  %35 = extractvalue %struct.float4 %29, 2
  store float %35, ptr %34, align 8
  %36 = getelementptr inbounds %struct.float4, ptr %11, i32 0, i32 3
  %37 = extractvalue %struct.float4 %29, 3
  store float %37, ptr %36, align 4
  %38 = load ptr, ptr %5, align 8
  call void @llvm.memcpy.p0.p0.i64(ptr align 16 %38, ptr align 16 %11, i64 16, i1 false)
  ret void
}

; Function Attrs: convergent mustprogress noinline nounwind optnone
define internal %struct.float4 @_ZN12_GLOBAL__N_110__cuda_tex9__convertI6float4S2_E5__runILi4EEES2_S2_(ptr noundef byval(%struct.float4) align 16 %0) #0 align 2 {
  %2 = alloca %struct.float4, align 16, addrspace(5)
  %3 = addrspacecast ptr addrspace(5) %2 to ptr
  %4 = getelementptr inbounds %struct.float4, ptr %3, i32 0, i32 0
  %5 = getelementptr inbounds %struct.float4, ptr %0, i32 0, i32 0
  %6 = load float, ptr %5, align 16
  store float %6, ptr %4, align 16
  %7 = getelementptr inbounds %struct.float4, ptr %3, i32 0, i32 1
  %8 = getelementptr inbounds %struct.float4, ptr %0, i32 0, i32 1
  %9 = load float, ptr %8, align 4
  store float %9, ptr %7, align 4
  %10 = getelementptr inbounds %struct.float4, ptr %3, i32 0, i32 2
  %11 = getelementptr inbounds %struct.float4, ptr %0, i32 0, i32 2
  %12 = load float, ptr %11, align 8
  store float %12, ptr %10, align 8
  %13 = getelementptr inbounds %struct.float4, ptr %3, i32 0, i32 3
  %14 = getelementptr inbounds %struct.float4, ptr %0, i32 0, i32 3
  %15 = load float, ptr %14, align 4
  store float %15, ptr %13, align 4
  %16 = load %struct.float4, ptr %3, align 16
  ret %struct.float4 %16
}

; Function Attrs: convergent mustprogress noinline nounwind optnone
define internal %struct.float4 @_ZN12_GLOBAL__N_110__cuda_tex14__tex_fetch_v4INS0_5__TagILi95EEEE5__runI6float4EET_yi(i64 noundef %0, i32 noundef %1) #0 align 2 {
  %3 = alloca %struct.float4, align 16, addrspace(5)
  %4 = addrspacecast ptr addrspace(5) %3 to ptr
  %5 = alloca i64, align 8, addrspace(5)
  %6 = addrspacecast ptr addrspace(5) %5 to ptr
  %7 = alloca i32, align 4, addrspace(5)
  %8 = addrspacecast ptr addrspace(5) %7 to ptr
  store i64 %0, ptr %6, align 8
  store i32 %1, ptr %8, align 4
  %9 = getelementptr inbounds %struct.float4, ptr %4, i32 0, i32 0
  %10 = getelementptr inbounds %struct.float4, ptr %4, i32 0, i32 1
  %11 = getelementptr inbounds %struct.float4, ptr %4, i32 0, i32 2
  %12 = getelementptr inbounds %struct.float4, ptr %4, i32 0, i32 3
  %13 = load i64, ptr %6, align 8
  %14 = load i32, ptr %8, align 4
  %15 = call { float, float, float, float } asm "tex.1d.v4.f32.s32\09{$0, $1, $2, $3}, [$4, {$5}];", "=f,=f,=f,=f,l,r"(i64 %13, i32 %14) #8, !srcloc !15
  %16 = extractvalue { float, float, float, float } %15, 0
  %17 = extractvalue { float, float, float, float } %15, 1
  %18 = extractvalue { float, float, float, float } %15, 2
  %19 = extractvalue { float, float, float, float } %15, 3
  store float %16, ptr %9, align 16
  store float %17, ptr %10, align 4
  store float %18, ptr %11, align 8
  store float %19, ptr %12, align 4
  %20 = load %struct.float4, ptr %4, align 16
  ret %struct.float4 %20
}

; Function Attrs: convergent mustprogress noinline nounwind optnone
define internal noundef i64 @_ZN12_GLOBAL__N_110__cuda_tex19__tex_handle_to_objI7textureI6float4Li1EL19cudaTextureReadMode0EEEEyT_(i64 %0) #0 {
  %2 = alloca i64, align 4, addrspace(5)
  %3 = addrspacecast ptr addrspace(5) %2 to ptr
  %4 = alloca i64, align 8, addrspace(5)
  %5 = addrspacecast ptr addrspace(5) %4 to ptr
  store i64 %0, ptr %3, align 4
  %6 = load i64, ptr %3, align 4
  %7 = call i64 asm "mov.b64 $0, $1; ", "=l,l"(i64 %6) #8, !srcloc !16
  store i64 %7, ptr %5, align 8
  %8 = load i64, ptr %5, align 8
  ret i64 %8
}

; Function Attrs: nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #6

declare i32 @cudaamd.nvvm.read.ptx.sreg.ntid.x()

; Function Attrs: nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #6

; Function Attrs: nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.y() #6

declare i32 @_Z9atomicAddPjj(ptr, i32)

declare i32 @_Z9atomicAddPii(ptr, i32)

declare i64 @_Z9atomicAddPyy(ptr, i64)

declare float @_Z9atomicAddPff(ptr, float)

declare i32 @_Z8atomicOrPii(ptr, i32)

declare i32 @_Z8atomicOrPjj(ptr, i32)

declare i64 @_Z8atomicOrPyy(ptr, i64)

declare i32 @_Z9atomicAndPii(ptr, i32)

declare i32 @_Z9atomicAndPjj(ptr, i32)

declare i64 @_Z9atomicAndPyy(ptr, i64)

declare i32 @_Z10atomicExchPii(ptr, i32)

declare i32 @_Z10atomicExchPjj(ptr, i32)

declare i64 @_Z10atomicExchPyy(ptr, i64)

declare float @_Z10atomicExchPff(ptr, float)

declare i32 @_Z9atomicDecPjj(ptr, i32)

declare i32 @_Z9atomicIncPjj(ptr, i32)

declare i32 @_Z9atomicMaxPii(ptr, i32)

declare i32 @_Z9atomicMaxPjj(ptr, i32)

declare i64 @_Z9atomicMaxPyy(ptr, i64)

declare i32 @_Z9atomicMinPii(ptr, i32)

declare i32 @_Z9atomicMinPjj(ptr, i32)

declare i64 @_Z9atomicMinPyy(ptr, i64)

declare i32 @_Z9atomicSubPii(ptr, i32)

declare i32 @_Z9atomicSubPjj(ptr, i32)

declare i32 @_Z9atomicXorPii(ptr, i32)

declare i32 @_Z9atomicXorPjj(ptr, i32)

declare i64 @_Z9atomicXorPyy(ptr, i64)

declare i32 @_Z9atomicCASPiii(ptr, i32, i32)

declare i32 @_Z9atomicCASPjjj(ptr, i32, i32)

declare i64 @_Z9atomicCASPyyy(ptr, i64, i64)

attributes #0 = { convergent mustprogress noinline nounwind optnone "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" }
attributes #1 = { argmemonly nocallback nofree nounwind willreturn }
attributes #2 = { convergent mustprogress noinline norecurse nounwind optnone "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" }
attributes #3 = { alwaysinline convergent mustprogress nounwind "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" }
attributes #4 = { nounwind readnone }
attributes #5 = { nocallback nofree nosync nounwind readnone speculatable willreturn }
attributes #6 = { nounwind readnone speculatable willreturn }
attributes #7 = { convergent nounwind }
attributes #8 = { convergent nounwind readnone }

!llvm.module.flags = !{!0, !1, !2, !3, !4}
!nvvm.annotations = !{!5, !6, !7, !8, !9}
!llvm.ident = !{!10, !11}

!0 = !{i32 2, !"SDK Version", [2 x i32] [i32 11, i32 5]}
!1 = !{i32 1, !"wchar_size", i32 4}
!2 = !{i32 4, !"nvvm-reflect-ftz", i32 0}
!3 = !{i32 7, !"PIC Level", i32 2}
!4 = !{i32 7, !"frame-pointer", i32 2}
!5 = !{ptr addrspace(1) @tex, !"texture", i32 1}
!6 = !{ptr addrspace(1) @txt, !"texture", i32 1}
!7 = !{ptr @_Z14mergeSortFirstP6float4i, !"kernel", i32 1}
!8 = !{ptr @_Z13mergeSortPassP6float4ii, !"kernel", i32 1}
!9 = !{ptr @_Z9mergepackPfS_, !"kernel", i32 1}
!10 = !{!"clang version 16.0.0 (https://github.com/llvm/llvm-project 809855b56f06dd7182685f88fbbc64111df9339a)"}
!11 = !{!"clang version 3.8.0 (tags/RELEASE_380/final)"}
!12 = distinct !{!12, !13}
!13 = !{!"llvm.loop.mustprogress"}
!14 = distinct !{!14, !13}
!15 = !{i64 672300}
!16 = !{i64 738119}
