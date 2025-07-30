Get-ChildItem -Recurse "C:\" -File -ErrorAction SilentlyContinue | 
    Where-Object {$_.Length -gt (10 *1024 *1024)} | 
        Sort-Object Length -Descending | 
            Select-Object FullName, Length -First 10