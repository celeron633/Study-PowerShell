$outputFileName = "combined.txt"

Get-ChildItem -File | Where-Object {$_.Name -like '*.txt'} | ForEach-Object {
   [System.String]::Format("----- content of {0} -----", $_.Name) | Out-File -Append -FilePath $outputFileName
   Get-Content $_ | Out-File -Append -FilePath $outputFileName
}