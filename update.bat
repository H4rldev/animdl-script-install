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
python -m pip install -U git+https://www.github.com/justfoolingaround/animdl
powershell.exe -c "invoke-webrequest 'https://raw.githubusercontent.com/H4rldev/animdl-batch-script-install-files/master/replacedownloader.bat' -outfile %~dp0\replacedownloader.bat"
goto leave

:leave
cls
type %~dp0\logo.txt
type %~dp0\credits.txt
echo Update should be done now.
echo Thanks for using my batch script :]
pause
start /B "yes" "%~dp0\replacedownloader.bat"
start /B "yes" "cmd /C del /F /Q %~dp0\update.bat && exit"
exit