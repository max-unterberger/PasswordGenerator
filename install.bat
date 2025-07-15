@echo off
REM Install the command alias for the password generator script
REM Usage: install.bat [powershell|python]

SETLOCAL ENABLEDELAYEDEXPANSION

IF "%~1"=="" (
    echo Usage: %~nx0 [powershell^|python]
    exit /b 1
)

SET "ALIAS_NAME=password"
SET "SCRIPT_DIR=%~dp0"

IF /I "%~1"=="powershell" (
    SET "TARGET=PowerShell -NoProfile -ExecutionPolicy Bypass -File ""%SCRIPT_DIR%powershell_generator.ps1"""
) ELSE IF /I "%~1"=="python" (
    SET "TARGET=python ""%SCRIPT_DIR%python-generator.py"""
) ELSE (
    echo Invalid parameter: %~1
    echo Use "powershell" or "python"
    exit /b 1
)

REM Always overwrite the password alias in AutoRun
REM Remove any previous doskey password= definition from AutoRun
FOR /F "usebackq tokens=2*" %%A IN (`reg query "HKCU\Software\Microsoft\Command Processor" /v AutoRun 2^>nul`) DO SET "AUTORUN=%%B"
SET "NEW_AUTORUN="

IF DEFINED AUTORUN (
    FOR %%L IN ("!AUTORUN: & =^|!") DO (
        echo %%~L | findstr /I /C:"doskey %ALIAS_NAME%=" >nul
        IF ERRORLEVEL 1 SET "NEW_AUTORUN=!NEW_AUTORUN! %%~L"
    )
)

SET "NEW_AUTORUN=!NEW_AUTORUN! & doskey %ALIAS_NAME%=%TARGET%"

REM Remove leading " & " if present
IF "!NEW_AUTORUN:~0,3!"==" & " SET "NEW_AUTORUN=!NEW_AUTORUN:~3!"

reg add "HKCU\Software\Microsoft\Command Processor" /v AutoRun /d "!NEW_AUTORUN!" /f >nul

echo Alias "%ALIAS_NAME%" set to run: %TARGET%

ENDLOCAL