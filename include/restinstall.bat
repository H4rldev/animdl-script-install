@echo off
title Cloning: [---------]




:checkpython
if exist "C:\Python39\Scripts" (
   echo Python already installed [possibly]
   goto checkmpv
) else (
   goto installpython
)

:checkmpv
if exist "C:\ProgramData\chocolatey\lib\mpv.install" (
   echo mpv already installed [most likely]
   goto checkanimdl
) else (
   goto installmpv
)

:checkanimdl
if exist "C:\Python39\Scripts\animdl.exe" (
   echo anim-dl already installed. [most likely]
   goto mogus
) else (
   goto installinganimdl
)

:installmpv
choco install mpv
goto checkanimdl

:installpython
choco install python
goto checkmpv

:installinganimdl
title Installing Anim-DL: [=====----]
refreshenv && pip install animdl && title Installing Anim-DL: [=========]


:mogus