$servidores = Import-Csv -Path "C:\Users\aaparicio\Documents\Cursos\ITE60\EOI_Barna\Secuencia\Semana6\scripts\servidores.csv" -Delimiter ","

foreach ($maquina in $servidores) {
    if (Test-Connection $maquina.ip -Count 1 -Quiet) {
	    Write-Host "Máquina "$maquina.nombre"accesible!"
    } else {
	    Write-Host "Máquina "$maquina.nombre" ERROR!"
    }
}

