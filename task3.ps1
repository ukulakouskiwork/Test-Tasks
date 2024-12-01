param (
    [string]$signalFilePath = "C:\Temp\signal.txt",
    [string]$serviceName = "Spooler"
)

if (Test-Path $signalFilePath) {
    $content = Get-Content $signalFilePath
    if ($content -contains "ERROR") {
        Write-Output "ERROR detected, restart the $serviceName..."
        Restart-Service -Name $serviceName
        
        Clear-Content -Path $signalFilePath
        Write-Output "The signal file has been cleared."
    }
}
d
