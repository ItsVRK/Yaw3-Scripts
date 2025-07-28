@echo off
echo Setting OpenXR layer to SteamVR..

::REG IMPORT "D:\StandAlone\YawVR\Scripts\openxr-steamvr.reg"

REG ADD HKLM\SOFTWARE\Khronos\OpenXR\1 /v ActiveRuntime /t REG_SZ /d "C:\Program Files (x86)\Steam\steamapps\common\SteamVR\steamxr_win64.json" /f

if %ERRORLEVEL% equ 0 (
    echo Successfully imported registry settings.
) else (
    echo ERROR: Failed to import registry settings. ErrorLevel: %ERRORLEVEL%
    echo IMPORTANT: This script likely needs to be run 'As Administrator'.
)

echo.

:: Get active user
for /f "tokens=1,* delims= " %%a in ('whoami') do set "ACTIVEUSER=%%a"
echo Running app launches as: %ACTIVEUSER%

:: Define inline commands to be launched via SCHTASKS
set "CMD_GAMELINK=cmd /c start \"\" \"steam://rungameid/3376270\""
set "CMD_INFUSEVR=cmd /c start \"\" \"steam://rungameid/2532240\""

:: Launch GameLink
call :RunAsUserTask "YawGameLink" "%CMD_GAMELINK%"
timeout /t 2

:: Launch InfuseVR
call :RunAsUserTask "InfuseVR" "%CMD_INFUSEVR%"

goto :eof

:RunAsUserTask
set "TASKNAME=%~1"
set "TASKCMD=%~2"

:: Create the scheduled task
schtasks /create /tn "%TASKNAME%" /tr "%TASKCMD%" /sc onstart /ru "%ACTIVEUSER%" /f

:: Run it and clean up
schtasks /run /tn "%TASKNAME%"
timeout /t 5 >nul
schtasks /delete /tn "%TASKNAME%" /f
goto :eof