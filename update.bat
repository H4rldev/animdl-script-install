@echo off
type %~dp0\logo.txt
type %~dp0\credits.txt
:checkperms  
net session >nul 2>&1
if %errorLevel% == 0 (
   goto update
) else (
   echo Please run this as an Administrator.
   pause
   exit
)

:update
choco install python
choco install mpv
refreshenv && python -m pip install -U git+https://www.github.com/justfoolingaround/animdl
del /F /Q Downloader.bat
powershell.exe -c "invoke-webrequest 'https://raw.githubusercontent.com/H4rldev/animdl-batch-script/master/Downloader.bat' -outfile .\Downloader.bat"
goto leave

:leave
cls
type %~dp0\logo.txt
type %~dp0\credits.txt

echo Update should be done now.
echo Thanks for using my batch script :]
pause
exit

