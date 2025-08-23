$arr1 = [int[]](3, 1, 2, 5, 4, 8, 7, 0, 9, 6)

function Insert-Sort()
{
    param(
        [int[]]$arr,
        [int]$len = $arr.Length
    )
    

    for ($i = 1; $i -lt $len; $i++) {
        $k = $arr[$i]
        $j = $i - 1

        # 关键点: 查找前面比k大的元素, 往前面挪
        while (($j -ge 0) -and ($arr[$j] -gt $k)) {
            $arr[$j+1] = $arr[$j]
            $j--
        }
        $arr[++$j] = $k
    }
}

Write-Host $arr1
Insert-Sort -arr $arr1
Write-Host $arr1