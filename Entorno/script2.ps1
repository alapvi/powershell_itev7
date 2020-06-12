#Comprobación de carpetas personales de usuarios
$usuarios = Get-LocalUser | Where-Object Name
foreach ($i in $usuarios) {
    If ( Test-Path "C:\Users\$i" ) {
        Write-Host "Usuario $i Tiene home"
    } else {
        Write-Host "Usuario $i NO tiene home"
    }
}
