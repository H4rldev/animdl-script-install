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
echo <nimdl and the batch script should now be gone. Goodbye
cls
del /F /Q logo.txt
del /F /Q credits.txt
pause
exit
