#Creamos un fichero de log
$logfile = ".\Log\powershell.log"
if (-not (Test-Path  $logfile) ) {
    New-Item -Path $logfile -Force
}

#Definimos el tiempo
$Stamp = (Get-Date).toString("yyyy/MM/dd HH:mm:ss")

#Ejecutamos la acción 
$maxIdCPUProcess = (Get-Process | Sort-Object CPU -Descending |Select-Object -First 1).Id
$ProcessName = (Get-Process -Id $maxIdCPUProcess).Name
$ProcessCPU = (Get-Process -Id $maxIdCPUProcess).CPU

#Añadimos al fichero log
$Line = "$Stamp $maxIdCPUProcess $ProcessName $ProcessCPU"
Add-Content -Path $logfile -Value $line

#Consultamos fichero
Get-Content -Path $logfile