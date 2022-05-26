@echo off
type %~dp0\logo.txt
type %~dp0\credits.txt

:uninstall
choco uninstall mpv
choco uninstall python
pip uninstall animdl
RD %ALLUSERSPROFILE%\chocolatey
del /F /Q Downloader.bat
del /F /Q license.txt
goto uninstall2

:uninstall2
cls 
type %~dp0\logo.txt
type %~dp0\credits.txt
echo animdl and the batch script should now be gone. Goodbye
cls
del /F /Q %~dp0\logo.txt
del /F /Q %~dp0\credits.txt
del /F /Q %~dp0\license.txt
del /F /Q %~dp0\Downloader.bat
if exist "%~dp0\update.bat" (
   del /F /Q %~dp0\update.bat
   goto uninstall3
) else (
   goto check1
)

:check1
if exist "%USERPROFILE%\.animdl" (
   RD /S /Q %USERPROFILE%\.animdl
   goto uninstall3
) else (
   goto uninstall3
)

:uninstall3
echo I'm sorry to see you go.
echo I hope you enjoyed using this tool.
echo Bye.
pause
start /B "yes" "cmd /C del /F /Q %~dp0\uninstall.bat && exit"
exit
