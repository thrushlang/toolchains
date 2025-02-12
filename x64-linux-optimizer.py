#!/usr/bin/python

# #####################################################################################
#
#  Optimizer and Reorganizer for the Thrush Toolchain for Clang & LLVM x64 binaries.
#
# #####################################################################################

import os
from typing import List

# Set this flag to true if you want to reorganize precompiled llvm and clang.
REORGANIZE_PRECOMPILED_BINARIES: bool = False

# Only modify if you want to reorganize clang and precompiled llvm.
REORGANIZE_BASED_PATH: str = ""
REORGANIZE_TARGET_PATH: str = ""

def optimize_toolchain(path: str):

    if not os.path.exists(path): return

    for name in os.listdir(path):
        if os.path.isfile(os.path.join(path, name)):
            if os.access(os.path.join(path, name), os.X_OK) or os.path.join(path, name).endswith(".so"):
                os.system(f"sstrip {os.path.join(path, name)}")

            if os.path.join(path, name).endswith(".a"):
                os.system(f"strip --strip-all {os.path.join(path, name)}")

        if os.path.isdir(os.path.join(path, name)): optimize_toolchain(os.path.join(path, name))

def reorganize_precompiled_binaries(based: List[str], target: List[str]):

    based_basenames: List[str] = [os.path.basename(lib) for lib in based]

    for lib in target:
        if os.path.basename(lib) not in based_basenames:
            os.system(f"rm -rf {lib}")

def get_target(path: str, generated_target: List[str], visited: set = None) -> List[str]:
    if not os.path.exists(path):
        return generated_target

    if visited is None:
        visited = set()

    if path in visited:
        return generated_target

    visited.add(path)

    for name in os.listdir(path):
        full_path = os.path.join(path, name)
        if os.path.isfile(full_path):
            generated_target.append(os.path.abspath(full_path))
        elif os.path.isdir(full_path):
            get_target(full_path, generated_target, visited)

    return generated_target

if __name__ == "__main__":

    if REORGANIZE_PRECOMPILED_BINARIES:

        based: List[str] = get_target(REORGANIZE_BASED_PATH, [])
        target: List[str] = get_target(REORGANIZE_TARGET_PATH, [])

        reorganize_precompiled_binaries(based, target)

    optimize_toolchain("clang/bin")
    optimize_toolchain("clang/lib")
    optimize_toolchain("llvm/")
