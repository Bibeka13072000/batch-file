@echo off
setlocal

for /f "delims=" %%i in ('whoami') do set CURRENTUSER=%%i

echo Current User : "%CURRENTUSER%"
echo.

echo Setting redirection.config permission...

icacls "C:\Windows\System32\inetsrv\config\redirection.config" /grant "%CURRENTUSER%:(R)"

if %ERRORLEVEL% NEQ 0 (
 echo WARNING : redirection.config permission failed.
)

echo Setting API folder permission...

icacls "C:\inetpub\wwwroot\PublisheRawanna" /grant "%CURRENTUSER%:(OI)(CI)M" /T /C

if %ERRORLEVEL% NEQ 0 (
 echo ERROR : API folder permission failed.
 pause
 exit /b 1
)

echo.
echo Permission setup completed.
pause