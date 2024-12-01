param (
    [string]$directory = "C:\Temp"
)

$folders = Get-ChildItem -Path $directory -Directory

$datePattern = '(19|20)\d\d-((0[1-9]|1[012])-(0[1-9]|[12]\d)|(0[13-9]|1[012])-30|(0[13578]|1[02])-31)'

$validDateFolders = $folders | Where-Object { $_.Name -match $datePattern }

$validDateFolders | ForEach-Object { Write-Output $_.FullName }
