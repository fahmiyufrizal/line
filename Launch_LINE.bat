@echo off
mklink /J "%localappdata%\LINE" "%~dp0LINE"
reg import "%~dp0_Reg\LINE.reg"

:patch_path_to_static
reg add "HKEY_CURRENT_USER\Software\LINE Corporation\LINE" /f /t REG_SZ /v "InstallDir" /d "%localappdata%/LINE//bin/current"
reg add "HKEY_CURRENT_USER\Software\LINE Corporation\LINE" /f /t REG_SZ /v "LauncherPath" /d "%localappdata%\LINE\bin\LineLauncher.exe"
start "" "%localappdata%\LINE\bin\LineLauncher.exe"