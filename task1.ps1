param (
    [string]$directory = "C:\Temp",
    [int]$numFiles = 10
)

if (-not (Test-Path $directory)) {
    New-Item -ItemType Directory -Path $directory
}

$fileList = "$directory\filelist.txt"

if (Test-Path $fileList) {
    $existingFiles = Get-Content $fileList | ForEach-Object { $_.Trim() }
} else {
    $existingFiles = @()
}

$newFiles = @()

for ($i = 1; $i -le $numFiles; $i++) {
    $fileName = "File$i.txt"
    $filePath = Join-Path -Path $directory -ChildPath $fileName
    
    if (-not $existingFiles.Contains($filePath)) {
        New-Item -Path $filePath -ItemType File
        $newFiles += $filePath
    }
}

if ($newFiles.Count -gt 0) {
    $newFiles | Out-File -FilePath $fileList -Append
}
