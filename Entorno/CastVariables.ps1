#Conversión de variables
Clear-Host
[Int]$var_int = Read-Host "Introduce un número"
[Double]$var_dou = Read-Host "Introduce un número con decimales"
[Char]$var_ch = Read-Host "Introduce un carácter"
[Boolean]$var_bool = $var_int

Write-Host $var_int
Write-Host $var_dou
Write-Host $var_ch
Write-Host $var_bool
