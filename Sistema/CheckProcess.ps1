#Comprobar si un proceso está en ejecución
$proceso = Read-Host "Nombre del proceso a buscar"
$result = Get-Process | Select-String -Pattern $proceso 
if ($result.Count -gt 1) {
    Write-Host "Proceso en ejecución!"
} else {
    Write-Host "Proceso parado!"
}
