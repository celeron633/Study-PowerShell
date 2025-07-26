$dirPath = "./dir"
$logFilePath = "C:\temp\file_log.txt"
$fileNameSet = [System.Collections.Generic.HashSet[String]]::new()

New-Item -ItemType Directory -Path "C:\temp\" -Force

while ($true) {
    Get-ChildItem -File $dirPath | ForEach-Object {
        $fileName = $_.Name
        # check if already processed
        if ($fileNameSet.Contains($fileName)) {
            Write-Output "$fileName already processed"
        } else {
            $fileNameSet.Add($fileName)
            $timestamp = [datetime]::Now.ToUniversalTime().ToString()

            $timestamp + " " + $fileName | Out-File -Append -FilePath $logFilePath
        }

        [System.Threading.Thread]::Sleep(1000)
    }
}