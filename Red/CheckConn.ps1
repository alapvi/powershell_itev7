$servidores = Import-Csv -Path .\Red\servidores.csv  -Delimiter ","
$resultado = "`nListado de máquinas `n"
$resultado += "--------------------------- `n"
foreach ($maquina in $servidores) {
    if (Test-Connection $maquina.ip -Count 1 -Quiet) {
	    $resultado += "Máquina "+$maquina.nombre+" accesible! `n"  
    } else {
	    $resultado += "Máquina "+$maquina.nombre +" ERROR! `n"
    }
}
$resultado 
