@echo off
title Installer
type %~dp0\logo.txt
type %~dp0\credits.txt
:choice
echo Install?
choice /C YN /N /T 10 /D Y /M Y/N:
if %errorlevel% == 1 (
   goto :install
) 
if %errorlevel% == 2 (
   goto :exit
)

:install
cls
type %~dp0\logo.txt
type %~dp0\credits.txt
title Installing Choco: [---------]
call %~dp0\chocoinstall.bat
title Installing Choco: [=========]
title Cloning: [---------]
call %~dp0\restinstall.bat

:exit
pause
