$redInterna="Ethernet"
$ubicacion = Read-Host "On ets, a Casa(1) o a l'institut (2)?"
if ($ubicacion -eq 1) {
    $dirIP="172.30.5.150"
    $gw="172.30.5.1"
    $prefixL=24
    $dns="1.1.1.1"
    Write-Host "Ets a casa"
    Write-Host "Activant la configuració IP estàtica"
    Get-NetAdapter –name $redInterna | Remove-NetIPAddress -Confirm:$false  >$null 2>&1
    Get-NetAdapter –name $redInterna | New-NetIPAddress -addressfamily IPv4 –ipaddress $dirIP -DefaultGateway $gw –prefixlength $prefixL –type unicast  >$null 2>&1
    Set-DnsClientServerAddress -InterfaceAlias $redInterna -ServerAddresses $dns  >$null 2>&1 
} else {
    Write-Host "Ets a l'institut"
    Write-Host "Activant la configuració IP diàmica"
    Remove-NetIPAddress –InterfaceAlias $redInterna -Confirm:$false  >$null 2>&1
    Remove-NetRoute -InterfaceAlias $redInterna -Confirm:$false  >$null 2>&1
    Set-NetIPInterface -InterfaceAlias $redInterna -Dhcp Enabled  >$null 2>&1
    Set-DnsClientServerAddress -InterfaceAlias $redInterna -ResetServerAddresses  >$null 2>&1 
}
Restart-NetAdapter -Name $redInterna
Write-Host "Configuració realitzada!" 
Pause
Get-NetIPConfiguration -InterfaceAlias $redInterna
