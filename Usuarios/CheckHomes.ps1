#Comprobación de carpetas personales de usuarios
$usuarios = Get-LocalUser | Select-Object Name
foreach ($i in $usuarios) {
    If ( Test-Path "C:\Users\$($i.Name)" ) {
        Write-Host "Usuario $($i.Name) Tiene home"
    } else {
        Write-Host "Usuario $($i.Name) NO tiene home"
    }
} 
