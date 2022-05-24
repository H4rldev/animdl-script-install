@echo off
title Installer
type %~dp0\logo.txt
type %~dp0\credits.txt
:init
IF EXIST "%~dp0\install" (
   echo Requirement of installation [[32mTRUE[0m]
   pause
   cls
   type %~dp0\logo.txt
   type %~dp0\credits.txt
   goto check_Permissions
) ELSE (
   echo Requirement of installation [[31mFALSE[0m]
   pause
   exit
   )

:check_Permissions    
net session >nul 2>&1
if %errorLevel% == 0 (
   goto install
) else (
     echo Please run this as an Administrator. && pause
     exit
  )

:install
del /F /Q "%~dp0\uninstall.bat"
del /F /Q "%~dp0\update.bat"
powershell.exe -c "invoke-webrequest 'https://raw.githubusercontent.com/H4rldev/animdl-batch-script/master/Downloader.bat' -outfile %~dp0\Downloader.bat"
start /B "Installer" %~dp0\install\maininstall.bat