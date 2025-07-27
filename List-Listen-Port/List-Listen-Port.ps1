Get-NetTCPConnection | 
    Where-Object {$_.State -eq 'Listen'} | 
    Select-Object LocalAddress, LocalPort | 
    Sort-Object {$_.LocalPort} -Unique