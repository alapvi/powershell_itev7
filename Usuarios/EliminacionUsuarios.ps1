#Eliminación de usuarios de forma masiva
Clear-Host
Write-Host "-------Eliminación de usuarios-------"
$usuarios= Import-Csv -Path .\Usuarios\usuarios.csv
foreach ($usu in $usuarios){
    Remove-LocalUser $usu.nombre
}
Get-LocalUser