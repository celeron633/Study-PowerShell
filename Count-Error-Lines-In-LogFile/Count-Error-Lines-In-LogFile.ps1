$count = 0

Get-ChildItem -File | Where-Object {$_.Name -like '*.log'} | ForEach-Object {
    $content = Get-Item $_.FullName
    $matchResult = Select-String -Pattern '.*error.*' $content

    foreach ($item in $matchResult) {
        $count += 1
    }
}

[System.Console]::WriteLine("Errors: {0}", $count)