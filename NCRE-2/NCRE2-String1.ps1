function fun1()
{
    param(
        [string]$strInput
    )

    [string]$strResult = ''

    $i = 0
    $strInput.ToCharArray() | ForEach-Object {
        $ch = [char]$_
        if ($i % 2 -ne 0) {
            $ch = $ch.ToString().ToUpper()
        }
        $strResult += $ch
        $i++
    }

    return $strResult
}

$str1 = Read-Host
fun1 -strInput $str1