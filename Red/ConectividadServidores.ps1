#Conexión con los servidores
Clear-Host
Write-Host " ----- Conectividad -----"
#Importamos los datos
$datos= Import-Csv -Path .\Red\servidores.csv -Delimiter ","
#Recorremos los datos
foreach ($i in $datos) {
    $respuesta=Test-Connection $i.ip -Count 1 -quiet
    if ($respuesta -eq "True") {
        Write-Host $i.nombre "Conexión establecida"
    }else {
        Write-Host $i.nombre "Error de conexión"
    }
}

