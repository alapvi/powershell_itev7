#Cuenta el número de usuarios que hay en nuestro sistema mediante estructuras repetitivas
$total = 0
$usuarios = Get-LocalUser | Select-Object Name
foreach ($usu in $usuarios) {
    Write-Host "Usuario encontrado $($usu.Name)"
    $total++
}
Write-Host "El total de usuarios es $total"

