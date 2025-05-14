@echo off
setlocal EnableDelayedExpansion

:: Obtener BASE_NAME eliminando 'refs/tags/' de GITHUB_REF
set "GITHUB_REF=%GITHUB_REF%"
set "BASE_NAME=%GITHUB_REF:refs/tags/=%"

:: Crear BUILD_ID concatenando BASE_NAME y GITHUB_RUN_ID
set "BUILD_ID=%BASE_NAME%-%GITHUB_RUN_ID%"

:: Guardar BUILD_ID en GITHUB_ENV para su uso en pasos posteriores
echo BUILD_ID=%BUILD_ID%>>%GITHUB_ENV%
echo BUILD_ID=%TAG_NAME%>>%GITHUB_ENV%

:: Mostrar valores para depuración
echo Unique ID: %BUILD_ID%
echo Base name: %TAG_NAME%

endlocal
