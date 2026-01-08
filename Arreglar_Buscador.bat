@echo off
REM ============================================================
REM Windows 10 Search Repair Tool - Batch Launcher
REM ============================================================
REM 
REM This batch file provides an easy way to launch the Python
REM repair tool without needing to open a command prompt.
REM 
REM It automatically detects Python installation and provides
REM fallback options if Python is not available.
REM 
REM Author: @danysers
REM Version: 1.0.0
REM ============================================================

title Windows 10 Search Repair Tool
echo.
echo ================================================
echo    WINDOWS 10 SEARCH REPAIR TOOL
echo ================================================
echo.
echo Initializing Python repair script...
echo.

REM First attempt: Try standard 'python' command
echo [1/3] Attempting to run with 'python' command...
python "%~dp0arreglar_buscador_windows.py"

REM Second attempt: Try Python Launcher if first attempt failed
if %errorlevel% neq 0 (
    echo.
    echo [2/3] Python command failed, trying Python Launcher 'py'...
    py "%~dp0arreglar_buscador_windows.py"
)

REM Third attempt: Provide manual instructions if both failed
if %errorlevel% neq 0 (
    echo.
    echo ================================================
    echo   ERROR: Python is not installed on this system
    echo ================================================
    echo.
    echo To use this repair tool, you need Python installed:
    echo.
    echo   Step 1: Visit https://www.python.org/downloads/
    echo   Step 2: Download and install Python for Windows
    echo   Step 3: Restart this program
    echo.
    echo ALTERNATIVE - Manual Repair Commands:
    echo.
    echo If you prefer to run commands manually, open PowerShell
    echo as Administrator and execute these commands one by one:
    echo.
    echo   1. Start-Process "ms-windows-store://pdp/?productid=9nblggh4tlx0"
    echo   2. taskkill /f /im ctfmon.exe ^& start ctfmon.exe
    echo   3. taskkill /f /im explorer.exe ^& start explorer.exe
    echo.
    echo These commands will:
    echo   - Refresh Microsoft Store search components
    echo   - Restart text input services
    echo   - Restart Windows Explorer
    echo.
)

echo.
echo Press any key to close this window...
pause >nul