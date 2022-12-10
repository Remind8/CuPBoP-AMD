#include <unordered_map>
#include <string>
#include <functional>

#include "llvm/IR/Module.h"
#include "llvm/IR/Instructions.h"
#include "llvm/IR/IRBuilder.h"
#include "llvm/IR/IntrinsicInst.h"
#include "llvm/IR/Intrinsics.h"
#include "llvm/IR/IntrinsicsAMDGPU.h"
#include "llvm/IR/IntrinsicsNVPTX.h"
#include "llvm/IR/CallingConv.h"

#include "init_amdgpu.hpp"
#include "utils.hpp"



using namespace llvm;

void remove_metadata(Module& M) {
  SmallVector<std::pair<unsigned, MDNode *>, 4> MDs;
  for (Module::iterator i = M.begin(), e = M.end(); i != e; ++i) {
    Function *F = &(*i);
    F->getAllMetadata(MDs);
    for (auto &MD : MDs) {
      
      F->setMetadata(MD.first, NULL);
    }
    F->removeFnAttr("target-features");
    F->removeFnAttr("target-cpu");
  }
}

namespace {
    struct op_context {
        std::vector<Instruction*> insts_to_remove;
        llvm::Module& M;
    };

    using intrinsic_replacer = std::function<void(op_context&, IntrinsicInst&)>;

    void replace_intrinsic(op_context& ctx, IntrinsicInst& call, Intrinsic::ID replacement) {
        // IRBuilder<> builder(ctx.M.getContext());
        // builder.SetInsertPoint(&call);
        auto* replacementDeclaration = Intrinsic::getDeclaration(&ctx.M, replacement);
        call.setCalledFunction(replacementDeclaration);
    }

    intrinsic_replacer direct_replacement(Intrinsic::ID replacement) {
        using namespace std::placeholders;
        return std::bind(replace_intrinsic, _1, _2, replacement);
    }
};



void replace_intrinsics(Module& M, Function& kernel) {
    std::unordered_map<Intrinsic::ID, ::intrinsic_replacer> knownIntrinsics = {
        { Intrinsic::nvvm_read_ptx_sreg_tid_x, direct_replacement(Intrinsic::amdgcn_workitem_id_x) },
        { Intrinsic::nvvm_read_ptx_sreg_tid_y, direct_replacement(Intrinsic::amdgcn_workitem_id_y) },
        { Intrinsic::nvvm_read_ptx_sreg_tid_z, direct_replacement(Intrinsic::amdgcn_workitem_id_z) },
        { Intrinsic::nvvm_read_ptx_sreg_ctaid_x, direct_replacement(Intrinsic::amdgcn_workgroup_id_x) },
        { Intrinsic::nvvm_read_ptx_sreg_ctaid_y, direct_replacement(Intrinsic::amdgcn_workgroup_id_y) },
        { Intrinsic::nvvm_read_ptx_sreg_ctaid_z, direct_replacement(Intrinsic::amdgcn_workgroup_id_z) }
    };

    op_context opCtx = { {}, M };

    for (auto& BB : kernel) {
        for (auto& I : BB) {
            if (auto* call = dyn_cast<IntrinsicInst>(&I)) {
                if (auto oldIntrinsicId = call->getIntrinsicID()) {
                    auto replacer = knownIntrinsics.find(oldIntrinsicId);
                    if (replacer != knownIntrinsics.end()) {
                        replacer->second(opCtx, *call);
                    }
                }
            }
        }
    }

    for (auto& inst : opCtx.insts_to_remove) {
        inst->eraseFromParent();
    }
}

void convert_kernel(Module& M, Function& kernel) {
    kernel.setCallingConv(CallingConv::AMDGPU_KERNEL);
    kernel.removeFnAttr("target-cpu");
    kernel.removeFnAttr("target-features");
}

void insert_amdgpu_kernel(Module& M) {
  std::vector<llvm::Function*> kernels = discover_cuda_kernels(M);

  //Replace the Kernels 
  for (auto* kernel : kernels) {
      convert_kernel(M, *kernel);
      replace_intrinsics(M, *kernel);
  }

}

void init_amdgpu(Module& M) {

  // metadata
  remove_metadata(M);

  // insert amdgpu_kernel to kernel function
  insert_amdgpu_kernel(M);

  



}