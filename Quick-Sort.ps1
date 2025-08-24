$arr1 = [int[]](3, 1, 2, 5, 4, 8, 7, 0, 9, 6)

function Partition()
{
    param(
        [int[]]$arr,
        [int]$low,
        [int]$high
    )

    $pivotIndex = $high
    $pivotValue = $arr[$pivotIndex]

    [int]$i = $low
    [int]$j = ($low - 1)

    while ($i -lt $high) {
        if ($arr[$i] -lt $pivotValue) {
            $j++
            $arr[$j], $arr[$i] = $arr[$i], $arr[$j]
        }
        $i++
    }
    $j++
    $arr[$j], $arr[$pivotIndex] = $arr[$pivotIndex], $arr[$j]

    return $j
}


function QuickSortImpl()
{
    param(
        [int[]]$arr,
        [int]$low,
        [int]$high
    )

    if ($low -le $high) {
        $pos = Partition -arr $arr -low $low -high $high
        QuickSortImpl -arr $arr -low ($pos + 1) -high $high
        QuickSortImpl -arr $arr -low $low -high ($pos - 1)
    }
}

function QuickSort()
{
    param(
        [int[]]$arr,
        [int]$len = $arr.Length
    )

    QuickSortImpl -arr $arr -low 0 -high ($len - 1)
}

Write-Host $arr1
QuickSort -arr $arr1
Write-Host $arr1