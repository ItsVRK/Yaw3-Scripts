@echo off
echo Setting OpenXR layer to SteamVR...

:: Optional registry import
:: REG IMPORT "%~dp0openxr-steamvr.reg"

REG ADD HKLM\SOFTWARE\Khronos\OpenXR\1 /v ActiveRuntime /t REG_SZ /d "C:\Program Files (x86)\Steam\steamapps\common\SteamVR\steamxr_win64.json" /f

if %ERRORLEVEL% equ 0 (
    echo Successfully imported registry settings.
) else (
    echo ERROR: Failed to import registry settings. ErrorLevel: %ERRORLEVEL%
    echo IMPORTANT: This script likely needs to be run 'As Administrator'.
)

echo.

:: Start VoiceAttack
start "" "C:\Program Files (x86)\Steam\steamapps\common\VoiceAttack 2\VoiceAttack.exe"

:: Get the active user
for /f "tokens=1,* delims= " %%a in ('whoami') do set "ACTIVEUSER=%%a"
echo Active user is: %ACTIVEUSER%

:: === ED00: Launch EDCoPilot (fire and forget)
set "CMD_EDCOPILOT=cmd /c start \"\" \"C:\EDCoPilot\LaunchEDCoPilot.exe\""
call :RunAsUserTask "EDCoPilot" "%CMD_EDCOPILOT%"

:: Give it time to load before launching Yaw Apps
timeout /t 25

:: === Launch GameLink to control Yaw VR motion simulator
set "CMD_GAMELINK=cmd /c start \"\" \"steam://rungameid/3376270\""
call :RunAsUserTask "GameLink" "%CMD_GAMELINK%"

:: Give GameLink 2 seconds to initialize before launching InfuseVR
timeout /t 2

:: === Launch InfuseVR
set "CMD_INFUSEVR=cmd /c start \"\" \"steam://rungameid/2532240\""
call :RunAsUserTask "InfuseVR" "%CMD_INFUSEVR%"

:: === ED01: Launch Elite Dangerous
set "CMD_EDLAUNCH=cmd /c start \"\" \"steam://rungameid/359320\""
call :RunAsUserTask "EDLaunch" "%CMD_EDLAUNCH%"

goto :eof

:RunAsUserTask
set "TASKNAME=%~1"
set "TASKCMD=%~2"

:: Create task with inline command string
schtasks /create /tn "%TASKNAME%" /tr "%TASKCMD%" /sc onstart /ru "%ACTIVEUSER%" /f

:: Run and clean up
schtasks /run /tn "%TASKNAME%"
timeout /t 5 >nul
schtasks /delete /tn "%TASKNAME%" /f
goto :eof
