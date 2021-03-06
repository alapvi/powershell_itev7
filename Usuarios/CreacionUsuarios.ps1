﻿<#
    Creación de usuarios de forma masiva a partir de un fichero .csv
#>
Clear-Host
Write-Host "-----Creación de usuarios----" 
$usuarios= Import-Csv -Path usuarios.csv
foreach ($usu in $usuarios){
    $clave= ConvertTo-SecureString $usu.contra -AsPlainText -Force
    New-LocalUser $usu.nombre -Password $clave -AccountNeverExpires -PasswordNeverExpires
    Add-LocalGroupMember -Group $usu.grupo -Member $usu.nombre
}
Clear-Host
Get-LocalUser | ft -AutoSize