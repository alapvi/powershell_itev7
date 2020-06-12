#Creación de una tarea programada
$trigger =New-ScheduledTaskTrigger -At 16:00 -Daily
$accion=New-ScheduledTaskAction -Execute "C:\Windows\System32\shutdown.exe" -Argument "/s /t 300"
Register-ScheduledTask -TaskName "Apagado" -Action $accion -Trigger $trigger -Description "Apagado a las 16:00h"
