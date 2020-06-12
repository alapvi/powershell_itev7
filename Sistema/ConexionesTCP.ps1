#Obtener aquellos procesos que tienen conexiones TCP abiertas
$conexiones = Get-NetTCPConnection -State Established | Select-Object OwningProcess -Unique 
foreach ($proc in $conexiones) {
    Get-Process -Id $proc.OwningProcess
}

