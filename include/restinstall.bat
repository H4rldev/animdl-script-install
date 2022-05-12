@echo off
if exist "C:\Python39\Scripts" (
   echo Python already installed [possibly]
   goto checkmpv
) else (
   goto installpython
)
:installpython
choco install python
:checkmpv
if exist "%DEFAULTUSERPROFILE%\AppData\Roaming\mpv" (
   echo mpv already installed [most likely]
   goto checkanimdl
) 
:installmpv
choco install mpv

:checkanimdl
if exist "C:\Python39\Scripts\animdl.exe" (
   echo anim-dl already installed. [most likely]
   goto mogus
) else (
   goto installinganimdl
)
:installinganimdl
title Installing Anim-DL: [=====----]
refreshenv && pip install animdl && title Installing Anim-DL: [=========]

:mogus