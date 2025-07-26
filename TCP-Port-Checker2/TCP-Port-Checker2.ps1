[string]$ipAddr = "192.168.31.3"
[int]$port = 22

$tcpClient = [System.Net.Sockets.TcpClient]::new()

# async way
$asyncObject = $tcpClient.BeginConnect($ipAddr, $port, $null, $null)

if (-not $asyncObject.AsyncWaitHandle.WaitOne(3000, $false)) {
    Write-Warning "connect to [$ipAddr]:[$port] FAILED"
    exit -1
}
Write-Warning "connect to [$ipAddr]:[$port] SUCCESS"
$tcpClient.EndConnect($asyncObject)

