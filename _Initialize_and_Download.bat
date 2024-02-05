:: LINE Loader
:: by fahmiyufrizal@2024
:: Modifikasi script ini tanpa menghilangkan credits!
:: Script ginian mau dicolong juga? lemah!

@echo off
title LINE Loader [github.com/fahmiyufrizal]
taskkill /f /im Line*
if exist LineInst.exe del /q LineInst.exe
if not exist "%~dp0LINE" mkdir "LINE"
if not exist "%~dp0_Installer" mkdir _Installer
if not exist "%~dp0_Reg" mkdir _Reg

echo [+] Downloading LINE Messenger...
curl -s -L -A "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.107 Safari/537.36" -H "Cache-Control: no-cache" -o "%~dp0_Installer\LineInst.exe" "https://desktop.line-scdn.net/win/new/LineInst.exe">nul

echo [+] Installing LINE Messenger...
start "" "%~dp0_Installer\LineInst.exe" /S
ping 127.0.0.1 -n 30 > nul
xcopy "%localappdata%\LINE" "%~dp0LINE" /Y /E
if exist "%localappdata%\LINE" RD /S /Q "%localappdata%\LINE"
mklink /J "%localappdata%\LINE" "%~dp0LINE"
mkdir "%localappdata%\LINE\Data"
reg export "HKEY_CURRENT_USER\Software\LINE Corporation\LINE" "%~dp0_Reg\LINE.reg" /y

echo [+] Triggering LINE Messenger for the 1st time...
start "" "%localappdata%\LINE\bin\LineLauncher.exe"
ping 127.0.0.1 -n 15 > nul
taskkill /f /im Line*
reg export "HKEY_CURRENT_USER\Software\LINE Corporation\LINE" "%~dp0_Reg\LINE.reg" /y

echo.
cls
echo [+] Use Launch_LINE.exe to launch Line Messenger next time!
echo [+] And use LINE_Updater to update Line or use LINE_auto_updater.bat to schedule auto update!
pause>nul

