@echo off
title Cloning: [---------]

:checkpython
if exist "C:\Python39\" (
   echo Python already installed [possibly]
   goto :checkmpv
) else (
   goto :installpython
)

:checkmpv
if exist "C:\ProgramData\chocolatey\lib\mpv.install" (
   echo mpv already installed [most likely]
   goto :checkanimdl
) else (
   goto :installmpv
)

:checkanimdl
if exist "C:\Python39\Scripts\animdl.exe" (
   echo anim-dl already installed. [most likely]
   goto :checkffmpeg
) else (
   goto :installinganimdl
)

:installmpv
choco install mpv
goto :checkanimdl

:installpython
choco install python
setx /M PATH "%PATH%;%USERPROFILE%\AppData\Roaming\Python\Python39\Scripts"
goto :checkmpv

:installffmpeg
choco install ffmpeg
goto :mogus

:installinganimdl
title Installing Anim-DL: [=====----]
refreshenv && python -m pip install git+https://www.github.com/justfoolingaround/animdl && title Installing Anim-DL: [=========]
goto :checkffmpeg


:checkffmpeg
if exist "C:\ProgramData\chocolatey\lib\ffmpeg\tools\ffmpeg\bin" (
   echo ffmpeg already installed. [most likely]
   goto :mogus
) else (
   goto :installffmpeg
)

:mogus