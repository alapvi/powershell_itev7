<#
    Script para crear un usuario. Comprueba que el usuario no exista.
    Permite añadirlo al grupo de Administradores o de Usuarios     
#>
$user = Read-Host "Introduce Usuario"
$res = ((Get-LocalUser).Name | Select-String -Pattern $user).Count 
if ($res -eq 1) {
    Write-Host "Usuario Existe"
} else {
    $pass = Read-Host "Introduce Password"
    New-LocalUser -Name $user -Password (ConvertTo-SecureString -String $pass -AsPlainText -Force)
    $adm = [Boolean](Read-Host "Añadir como administrador (1/0)?")[0]
     if ($adm -eq $true) {
        Add-LocalGroupMember -Group Administradores -Member $user
        Write-Host "Añadido como administrador"
     } else {
        Add-LocalGroupMember -Group Usuarios -Member $user
        Write-Host "Añadido como usuario"
     }
     Write-Host "Usuario añadido!"
}
Get-LocalUser $user | fl *

