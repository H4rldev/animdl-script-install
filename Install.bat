@echo off
title Installer
type %~dp0\logo.txt
:init
IF EXIST "%~dp0\include" (
   echo Requirement of installation [[32mTRUE[0m]
   pause
   cls
   type %~dp0\logo.txt
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
start /B "Installer" %~dp0\include\maininstall.bat