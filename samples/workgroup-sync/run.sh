#!/bin/bash

../../scripts/amdcuda main.cu
LD_LIBRARY_PATH=$(realpath ../../build/runtime):$LD_LIBRARY_PATH ./main.translated
