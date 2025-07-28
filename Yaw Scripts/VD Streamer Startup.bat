@echo off
echo Setting OpenXR layer to VDXR...

REG ADD "HKLM\SOFTWARE\Khronos\OpenXR\1" /v ActiveRuntime /t REG_SZ /d "C:\Program Files\Virtual Desktop Streamer\OpenXR\virtualdesktop-openxr.json" /f
if %ERRORLEVEL% neq 0 (
    echo ERROR: Failed to import registry settings. Run 'As Administrator' if needed.
    goto :eof
)

echo Successfully imported registry settings.

:: Get active user
for /f "tokens=1,* delims= " %%a in ('whoami') do set "ACTIVEUSER=%%a"
echo Running app launches as: %ACTIVEUSER%

:: Create the scheduled task to run once immediately using the relative path of launchVD.bat
schtasks /create /tn "VDStream" /tr "cmd /c \"%~dp0launchVD.bat\"" /sc onstart /ru "%ACTIVEUSER%" /f

:: Run the scheduled task
schtasks /run /tn "VDStream"

:: Wait for task to run and clean up
timeout /t 5 >nul
schtasks /delete /tn "VDStream" /f

goto :eof
