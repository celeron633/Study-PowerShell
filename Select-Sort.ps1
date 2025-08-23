$arr1 = [int[]](3, 1, 2, 5, 4, 8, 7, 0, 9, 6)

function Select-Sort()
{
    param(
        [int[]]$arr,
        [int]$len = $arr.Length
    )
    
    [int]$sortedIndex = 0

    while ($sortedIndex -lt $len) {
        $minIndex = $sortedIndex
        $minValue = $arr[$minIndex]

        # 选出未排序部分最小的
        for ($i = $sortedIndex + 1; $i -lt $len; $i++) {
            if ($arr[$i] -lt $minValue) {
                $minIndex = $i
                $minValue = $arr[$i]
            }
        }
        # 交换
        $arr[$sortedIndex], $arr[$minIndex] = $arr[$minIndex], $arr[$sortedIndex]
        # 已排序的Index++
        $sortedIndex++
    }
}

Write-Host $arr1
Select-Sort -arr $arr1
Write-Host $arr1