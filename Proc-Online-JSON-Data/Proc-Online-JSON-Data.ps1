$apiUrl = "https://api.github.com/repos/PowerShell/PowerShell"

$respObj = Invoke-RestMethod -Uri $apiUrl -Method Get

[string]$name = $respObj.name
[int]$forksCount = $respObj.forks
[int]$starsCount = $respObj.stargazers_count

[System.Console]::WriteLine("Name: {0}", $name)
[System.Console]::WriteLine("Stars: {0}", $starsCount)
[System.Console]::WriteLine("Forks: {0}", $forksCount)