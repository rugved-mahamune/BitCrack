@echo off
setlocal EnableDelayedExpansion

rem Specify the maximum value
set "max_value=35000"

rem Generate a random number between 0 and max_value
:generate_random
set /a "rand1=!random!"
set /a "rand2=!random!"

rem Combine rand1 and rand2 to extend the range
set /a "combined_random=((rand1 * 32768) + rand2) %% max_value"

set start=%combined_random%*1019100258536400
set end=(%combined_random%+1)*1019100258536400
echo Random number between 0 and %max_value%: !combined_random!
echo printing %start%

pause
