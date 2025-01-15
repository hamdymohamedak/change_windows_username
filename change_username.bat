@echo off
:: Check if the script is running as Administrator
openfiles >nul 2>&1
if %errorlevel% neq 0 (
    echo This script must be run as Administrator.
    echo Restarting the script as Administrator...
    powershell -Command "Start-Process cmd -ArgumentList '/c, \"%~f0\"' -Verb runAs"
    exit /b
)

:: Get the current username
for /f "tokens=2 delims=\" %%a in ('whoami') do set currentUser=%%a

:: Change the username to "askander"
net user %currentUser% /fullname:"askander"

exit
