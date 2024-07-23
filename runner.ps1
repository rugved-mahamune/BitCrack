function Get-V{
    param(
        [Parameter(Mandatory = $true)]
        [BigInt]$start,
        [Parameter(Mandatory = $true)]
        [BigInt]$section,
        [Parameter(Mandatory = $true)]
        [BigInt]$chunk
    )
    $shex = $start.tostring("x")
}