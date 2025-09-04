

function Heapify()
{
    param(
        [int[]]$arr,
        [int]$n,
        [int]$i
    )

    $smallest = $i
    $left = $i * 2 + 1
    $right = $i * 2 + 2

    if ($left -lt $n -and $arr[$left] -lt $arr[$smallest]) {
        $smallest = $left
    }

    if ($right -lt $n -and $arr[$right] -lt $arr[$smallest]) {
        $smallest = $right
    }

    if ($smallest -ne $i) {
        $arr[$i], $arr[$smallest] = $arr[$smallest], $arr[$i]
        Heapify -arr $arr -n $n -i $smallest
    }
}

function MakeHeap()
{
    param(
        [int[]]$arr
    )

    [int]$n = $arr.Length
    [int]$lastNonLeafIndex = [System.Math]::Floor($n / 2) - 1

    for ($i = $lastNonLeafIndex; $i -ge 0; $i--) {
        Heapify -arr $arr -n $n -i $i
    }
}

function HeapSort()
{
    param(
        [int[]]$arr
    )

    [int]$n = $arr.Length

    MakeHeap -arr $arr
    for ($i = $n - 1; $i -ge 0; $i--) {
        $arr[$i], $arr[0] = $arr[0], $arr[$i]
        Heapify -arr $arr -n $i -i 0
    }
}

[int[]]$arr1 = @(2, 1, 3, 5, 4, 7, 0, 6, 9, 8)

Write-Host "before sorting:"
Write-Host $arr1
# Write-Host $arr1.GetType()
# MakeHeap -arr $arr1
HeapSort -arr $arr1
Write-Host "after sorting:"
Write-Host $arr1
