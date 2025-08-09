function Binary-Search {
    param (
        [Parameter(Mandatory=$true)]
        [System.Collections.ArrayList]$list,
        [Parameter(Mandatory=$true)]
        [int]$target
    )
    
    [int]$low = 0
    [int]$high = $list.Count - 1

    while ($low -le $high) {
        [int]$mid = ($low + $high) / 2
        if ($list[$mid] -eq $target) {
            return $mid
        } elseif ($list[$mid] -gt $target) {
            $high = $mid - 1
        } elseif ($list[$mid] -lt $target) {
            $low = $mid + 1
        }
    }
    return -1
}

$list1 = New-Object System.Collections.ArrayList
$list1.Add(1) | Out-Null
$list1.Add(3) | Out-Null
$list1.Add(5) | Out-Null
$list1.Add(6) | Out-Null
$list1.Add(7) | Out-Null
$list1.Add(9) | Out-Null
$list1.Add(15) | Out-Null
$list1.Add(20) | Out-Null
$list1.Add(33) | Out-Null
$list1.Add(56) | Out-Null
$list1.Add(88) | Out-Null
$list1.Add(99) | Out-Null

Write-Host $list1
Binary-Search -list $list1 -target 1
Binary-Search -list $list1 -target 15
Binary-Search -list $list1 -target 99
Binary-Search -list $list1 -target 100