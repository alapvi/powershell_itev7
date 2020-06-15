<#
    Comprobar servicios en ejecución y enviar notificación por email
#>

#Obtenemos del fichero los servidores, los servicios y sus puertos
$servidores = Import-Csv -Path .\Sistema\servidores.csv -Delimiter ","
$hayerror = $false
$errormensaje = ""
foreach ($i in $servidores) {
    $port = $i.puerto
    $servicio = $i.servicio
    $ip = $i.maquina
    $connection = New-Object System.Net.Sockets.TcpClient($ip, $port) 

    if ($connection.Connected) {
        $connection.Close()
    } else {
        $hayerror = $true
        $stamp = (Get-Date).toString("yyyy/MM/dd HH:mm:ss")
        $errormensaje += "$stamp $ip $servicio $port DOWN! `n" 
    }
}


if ($hayerror -eq $true) {
    $email = "ciscoiteservice@gmail.com"
    $smtpServer = "smtp.gmail.com"

    $SecurePassword = (Read-Host "Introduce la password:" -AsSecureString)
    $BSTR = [System.Runtime.InteropServices.Marshal]::SecureStringToBSTR($SecurePassword)
    $pass = [System.Runtime.InteropServices.Marshal]::PtrToStringAuto($BSTR)

    $msg = new-object Net.Mail.MailMessage
    $smtp = new-object Net.Mail.SmtpClient($smtpServer)
    $smtp.EnableSsl = $true
    $msg.From = "ciscoiteservice@gmail.com" 
    $msg.To.Add("$email")
    $msg.BodyEncoding = [system.Text.Encoding]::Unicode
    $msg.SubjectEncoding = [system.Text.Encoding]::Unicode
    $msg.Subject = "[WARNING] Evento"
    $msg.Body = $errormensaje 
    $smtp.Credentials = New-Object System.Net.NetworkCredential("$email", "$pass");
    $smtp.Send($msg)
}



