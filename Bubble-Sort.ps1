function Generate-Random-Number()
{
    param(
        [Parameter(Mandatory=$true)]
        [AllowEmptyCollection()]
        [System.Collections.ArrayList]$list,
        [int]$count = 10
    )

    $randomObject = [System.Random]::new()

    for ($i = 0; $i -lt $count; $i++) {
        $list.Add($randomObject.Next(1, 100)) | Out-Null
    }
}

function Bubble-Sort()
{
    param(
        [Parameter(Mandatory=$true)]
        [System.Collections.ArrayList]$list
    )
    [int]$len = $list.Count

    for ($i = 0; $i -lt $len; $i++) {
        for ($j = 0; $j -lt ($len - $i - 1); $j++) {
            if ($list[$j+1] -lt $list[$j]) {
                $list[$j], $list[$j+1] = $list[$j+1], $list[$j]
            }
        }
    }
}

$list1 = New-Object System.Collections.ArrayList
Generate-Random-Number -list $list1 -count 20
Write-Host $list1
Bubble-Sort -list $list1
Write-Host $list1