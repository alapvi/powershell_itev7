
do {
    Write-Host "Configuración de la Dirección IP"
    Write-Host "==============================="
    Write-Host "1.- Configurar dirección estática"
    Write-Host "2.- Configurar dirección dinámica"
    Write-Host "3.- Obtener configuración TCP/IP"
    Write-Host "0.- Salir"
    $opcion = Read-Host  "Introduce opción"
    switch ($opcion)
    {
        '0' {#Salir
            exit
            }
        '1' {#Configurar IP Estática
            Get-NetAdapter | ft
            $name = Read-Host "Introduce Name" 
            Remove-NetIPAddress -InterfaceAlias $name -Confirm:$false 
            Set-NetIPInterface -InterfaceAlias $name -Dhcp Disabled
            $ip = Read-Host "Introduce IP (A.B.C.D)"
            $mask = Read-Host "Introduce CIDR"
            $gw = Read-Host "Introduce Gateway"
            $dns = Read-Host "Introduce DNS"
            New-NetIPAddress -InterfaceAlias $name -IPAddress $ip -PrefixLength $mask -DefaultGateway $gw
            Set-DnsClientServerAddress -InterfaceAlias $name -ServerAddresses $dns 
            Restart-NetAdapter -Name $name
            
            }
        '2' {#Configurar IP Dinámica
            Get-NetAdapter | ft
            $name = Read-Host "Introduce Name" 
            Remove-NetIPAddress -InterfaceAlias $name -Confirm:$false 
            Set-DnsClientServerAddress -InterfaceAlias $name -ResetServerAddresses 
            Set-NetIPInterface -InterfaceAlias $name -Dhcp Enabled 
            Restart-NetAdapter -Name $name

            }
        '3' {#Obtener configuración IP
            Get-NetAdapter | ft
            $index = Read-Host "Introduce ifIndex" 
            Get-NetIPAddress -InterfaceIndex $index -AddressFamily IPv4 | fl
            Get-NetIPConfiguration -InterfaceIndex $index | fl
                
            }
        Default { Write-Host "Opción incorrecta!" }
    }

} until ($opcion -eq 0)