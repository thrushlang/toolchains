# Toolchains

This repository houses all the standard toolchains containing backend compilers for the **Thrush programming language**.

This repository contains:

- **LLVM tools** (v17.0.6)
- **Clang** (v17.0.6)

# ToolChain variations

## Standard version

- The standard version of the toolchains contains a version optimized for compilation times, being much faster than the lightweight versions. The only drawbacks are that they are **much heavier**.

## Lightweight version

- The lightweight version of the toolchains is optimized to only be as light as possible compared to the standard ones. With disadvantages such as **compilation times being much slower**.
