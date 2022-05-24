if exist "%ALLUSERSPROFILE%\chocolatey\bin" (
   echo Already installed continuing.
   goto :amongus
) else (
   goto :install
)

:install
::This installs choco, as found on https://chocolatey.org/docs/installation
@"%SystemRoot%\System32\WindowsPowerShell\v1.0\powershell.exe" -NoProfile -InputFormat None -ExecutionPolicy Bypass -Command " [System.Net.ServicePointManager]::SecurityProtocol = 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))" && SET "PATH=%PATH%;%ALLUSERSPROFILE%\chocolatey\bin"
:amongus
