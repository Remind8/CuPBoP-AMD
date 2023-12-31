# CuPBoP-AMD: Extending CUDA to AMD Platforms

## Introduction

CuPBoP-AMD (Extending CUDA to AMD Platforms) is a extension of the framework of CuPBoP following similar architecture. However,  CuPBoP-AMD has its over version of kernerl and host translators and runtime implementation.
CuPBoP-AMD currently supports many of the Rodinia benchmarks and more support than AMD HIPIFY.

## Install

### Prerequisites

- Linux system
- [LLVM 14.0.1](https://github.com/llvm/llvm-project/releases/tag/llvmorg-14.0.1)
- CUDA Toolkit

### Installation

1. Clone from github

   ```bash
   
   ```

2. Build CuPBoP-AMD

   ```bash
   mkdir build && cd build
   cmake .. \
      -DLLVM_CONFIG_PATH=`which llvm-config` \
      -DCUDA_PATH=$CUDA_PATH
   make
   ```

## Run Rodinia Benchmark example

In this section, we provide an example of how to use CuPBoP-AMD to execute a CUDA program.

```bash
Todo
```

## How to contribute?

Any kinds of contributions are welcome.
Please refer to [Contribution.md](./CONTRIBUTING.md) for more detail.

## Related publications

If you want to refer CuPBoP in your projects, please cite the related
papers:

- [CuPBoP-AMD: Extending CUDA to AMD Platforms](https://doi.org/10.1145/3624062.3624185)
- [CuPBoP: CUDA for Parallelized and Broad-range Processors](https://arxiv.org/abs/2206.07896)

## Contributors

- [Xule Zhou](https://marcuszhou.com/)
- [Jun Chen](https://junchen.me)
- John Lu
- [Hyesoon Kim](https://faculty.cc.gatech.edu/~hyesoon/)

## Acknowledgements


- This research was partially supported by AMD. We also want to thank John Lu, Ruobing Han, and Jaewon Lee
for their support and expertise.
- [CuPBoP: CUDA for Parallelized and Broad-range Processors](https://arxiv.org/abs/2206.07896)
- [Rodinia Benchmark](https://github.com/yuhc/gpu-rodinia)