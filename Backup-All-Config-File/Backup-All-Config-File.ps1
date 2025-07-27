$srcDir = "C:\AppConfigs"
$dstDir = "C:\BackupConfigs\"

if (-not (Test-Path -PathType Container -Path $dstDir)) {
    New-Item -ItemType Directory $dstDir -Force
}

Get-ChildItem -Path $srcDir -File | Where-Object {$_.Name -like '*.config'} | ForEach-Object {
    $oldName = $_.Name;
    # $newName = $dstDir + "$oldName" + "_" + (Get-Date -Format "yyyyMMdd_HHmmss").ToString()
    $newName = ($oldName -replace '.config', '') + "_" + (Get-Date -Format "yyyyMMdd_HHmmss").ToString() + ".config"
    $newNameWithPath = $dstDir + $newName
    # Copy-Item -Path $_.FullName -Destination
    # Write-Output $newNameWithPath
    Copy-Item -Path $_.FullName -Destination $newNameWithPath
}