Get-ChildItem -Recurse "C:\" -File -ErrorAction SilentlyContinue | 
    Where-Object {$_.Length -gt (10 *1024 *1024)} | 
        Sort-Object Length -Descending | 
            Select-Object FullName, Length -First 10 |
                ForEach-Object {
                    $fileSizeMB = $_.Length / 1024 / 1024
                    [System.Console]::WriteLine("Path: [{0}], Size: [{1:F2}]MB", $_.FullName, $fileSizeMB)
                }