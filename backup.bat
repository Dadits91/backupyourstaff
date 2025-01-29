@echo off
:: Check if the script is running with Administrator privileges
NET SESSION >nul 2>&1
IF %ERRORLEVEL% NEQ 0 (
    :: If not, request Administrator privileges
    echo Requesting Administrator privileges...
    powershell -Command "Start-Process '%~dp0backup.bat' -Verb runAs"
    exit /b
)

:: Run the PowerShell script silently in the background
powershell -WindowStyle Hidden -ExecutionPolicy Bypass -File "%~dp0BackupUserDataToUSB.ps1"
exit
