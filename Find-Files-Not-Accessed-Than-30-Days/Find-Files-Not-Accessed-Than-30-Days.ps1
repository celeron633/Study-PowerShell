$myPath = "./"

if ($args.Count -ge 1) {
    $myPath = $args[0]
}

if ((Test-Path $myPath) -eq $false) {
    Write-Error "Invalid path: [$myPath]"
} else {
    Get-ChildItem -Path $myPath -File -Recurse -ErrorAction SilentlyContinue | ForEach-Object {
        # $fileAttr = Get-ItemProperty $_.FullName
        $fileAccessDt = $_.LastAccessTime
        $nowDt = [System.DateTime]::Now

        if (($fileAccessDt.AddDays(30)) -lt $nowDt) {
            [System.Console]::WriteLine("{0} is not accessed than 30 days!", $_.FullName);
        } 
    }

}

