@echo off
if "%~1" == "" (goto :failed) else (if "%~2" == "" (set "macro=default") else (set "macro=%~2"))
if /i "%~1" == "p" (if exist "%macro%.mcr" (MacroCMD.exe /p /ek:17 "%macro%.mcr")&exit /b)
if exist "%macro%.mcr" del /F /Q "%macro%.mcr"
MacroCMD.exe /r /ek:144 "%macro%.mcr"
exit /b
:failed