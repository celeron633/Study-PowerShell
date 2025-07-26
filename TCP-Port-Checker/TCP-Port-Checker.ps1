[string]$ipAddr = "192.168.31.2"
[int]$port = 22

$tcpClient = [System.Net.Sockets.TcpClient]::new()

# block connect
try {
    $tcpClient.Connect($ipAddr, $port)
} catch {
    Write-Error "connect to [$ipAddr]:[$port] FAILED"
    exit -1
}

Write-Output "connect to [$ipAddr]:[$port] SUCCESS"
$tcpClient.Close()
