@echo off

%WORKING_DRIVE%
cd %WORKING_DIR%

::..............................................................................

set THIS_DIR=%CD%

if /i "%BUILD_PROJECT%" == "llvm" goto :llvm
if /i "%BUILD_PROJECT%" == "clang" goto :clang

echo Invalid argument: '%1'
exit -1

:: . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . .

:llvm

mkdir llvm\build
cd llvm\build

cmake .. %LLVM_CMAKE_CONFIGURE_FLAGS%
cmake --build . %CMAKE_BUILD_FLAGS%
cmake --build . --target install %CMAKE_BUILD_FLAGS%

for %%f in ("bin\*.exe") do (
    if /i not "%%~nxf" == "llvm-config.exe" (
        del "%%f"
    )
)

cd %THIS_DIR%

7z a -tzip %GITHUB_WORKSPACE%\%LLVM_RELEASE_FILE% %LLVM_RELEASE_NAME%

goto :eof

:: . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . .

:clang

mkdir clang\build
cd clang\build
cmake .. %CLANG_CMAKE_CONFIGURE_FLAGS%
cmake --build . %CMAKE_BUILD_FLAGS%
cmake --build . --target install %CMAKE_BUILD_FLAGS%

cd %THIS_DIR%

7z a -tzip %GITHUB_WORKSPACE%\%CLANG_RELEASE_FILE% %CLANG_RELEASE_NAME%

goto :eof

::..............................................................................
