# Toolchains

This repository stores all the toolchains that contain backend compilers, which allow **thrushc** to **effectively compile to a given architecture**. This repository is also used by the thrush package manager (**thorium**) to download, install, and configure the compiler for proper operation on the hosted system.

This repository contains toolchains with:

- **LLVM tools** precompiled (v17.0.6)
- **Clang** precompiled (v17.0.6)

## Manual installation 

> [!NOTE]  
> The Thorium package manager is responsible for automatically installing the toolchains on each operating system, using the `thorium install` command. You can do this manually, but it's **not recommended**.

## Linux

#### Create 'thrushlang' folder at %HOME% directory:

```console
cd ~ && mkdir -p thrushlang/backends/llvm && cd thrushlang/backends/llvm
```

#### Download the latest toolchain release:

- **[Linux Toolchain x64](https://github.com/thrushlang/toolchains/releases/download/Toolchains/thrushlang-toolchain-llvm-linux-x64-v1.0.2.tar.xz)**

#### Unzip the toolchain:

~ Change the 'X' characters to the version you are going to use.

```console
tar -xf thrushlang-toolchain-llvm-linux-x64-vX.X.X.tar.xz
```

#### Unzip the tools and executables:

```console
find . -type f -name "*.xz" -execdir xz -d {} \;
```

~ You can now use `thrushc` and enable compilation to binaries correctly.

## Windows

#### Create 'thrushlang' folder at %APPDATA% directory:

- Change the '<username>' word with the user name of your Windows profile.

```console
mkdir "C:/Users/<username>/AppData/Roaming/thrushlang/backends/llvm"
```

#### Download the latest toolchain release:

- **[Windows Toolchain x64](https://github.com/thrushlang/toolchains/releases/download/Toolchains/thrushlang-toolchain-llvm-windows-x64-v1.0.0.tar.xz)**

#### Unzip the toolchain:

- Change the 'X' characters to the version you are going to use.
- Change the '<username>' word with the user name of your Windows profile.

```console
tar -xJf thrushlang-toolchain-llvm-windows-x64-vX.X.X.tar.xz -C "C:/Users/<username>/AppData/Roaming/thrushlang/backends/llvm"
```

~ You can now use `thrushc` and enable compilation to binaries correctly.

