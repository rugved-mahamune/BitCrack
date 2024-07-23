@echo off
setlocal EnableDelayedExpansion


rem Specify the range for the random number
set /a min=1000
set /a max=9999
set /a random_number=!random! %% (%max% - %min% + 1) + %min%
echo %random%
rem Specify the executable name
set executable="C:\code\btc\MyScripts\cuBitCrack.exe"
set started=0


:check_time
rem Get the current hour
for /F "tokens=1-2 delims=:" %%a in ("%time%") do set /a hour=%%a

rem Check if the current time is between 9 PM (21) and 7 AM (7)
echo checking time %hour%
if %hour% GEQ 16 (
    if %hour% LSS 18 (
        goto run_exe
) else (
    echo The current time is %time%. The executable will not run outside of the specified hours.
    for /f "tokens=2 delims=:" %%A in ('tasklist /FI "IMAGENAME eq cuBitCrack.exe" /FO LIST ^| findstr /C:"PID:"') do (
        call :terminate_exe %%A
    )
)
) else (
    echo The current time is %time%. The executable will not run outside of the specified hours.
    timeout /t 60
    goto check_time
)

:run_exe
rem Specify the maximum value
set "max_value=35000"

rem Generate a random number between 0 and max_value
:generate_random
set /a "rand1=!random!"
set /a "rand2=!random!"

rem Combine rand1 and rand2 to extend the range
set /a "combined_random=((rand1 * 32768) + rand2) %% max_value"

set /a start=%combined_random%+1019100258536400

rem Run the executable with the random number as a parameter
rem Replace "your_executable.exe" with the actual executable name
rem Replace "param" with the actual parameter name if needed
echo Called run_exe
echo %started%
if %started% LEQ 0 (
    set started=1
    start "" "%executable%"  -i address.txt -o got.txt --keyspace 0x3000032136157fc48:0x3ff0032136157fc48 --continue state.txt
)

rem Wait for 1 hour before checking the time again
timeout /t 60
goto check_time

:terminate_exe
set pid=%1
echo here %pid%
rem Terminate the executable if running
taskkill /PID %pid% /F >nul 2>&1
rem Wait for 1 hour before checking the time again
timeout /t 3600
goto check_time

endlocal
tasklist /FI "IMAGENAME eq %executable%" 2>NUL
