@echo off

del /F /Q "%~dp0\Downloader.bat"
powershell.exe -c "invoke-webrequest 'https://raw.githubusercontent.com/H4rldev/animdl-batch-script/master/Downloader.bat' -outfile %~dp0\Downloader.bat"

exit