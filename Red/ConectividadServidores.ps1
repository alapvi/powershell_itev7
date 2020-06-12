#Conexión con los servidores
Clear-Host
Write-Host " ----- Conectividad -----"
#Importamos los datos
$datos= Import-Csv -Path servidores.csv
#Recorremos los datos
foreach ($i in $datos) {
    $respuesta=Test-Connection $i.ip -Count 1 -quiet
    if ($respuesta -eq "True") {
        Write-Host $i.nombre "Conexión establecida"
    }else {
        Write-Host $i.nombre "Error de conexión"
    }
}

