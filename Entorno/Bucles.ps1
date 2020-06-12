
#Números del 1 al 100 con bucle while
Write-Host "Bucle While"
$x=1
while ($x -le 100)
{
    Write-Host $x " " -NoNewline
    $x++ #incrementa en uno la variable $x
}
Write-Host ""


#Números del 1 al 100 con bucle do-until
Write-Host "Bucle Do-Until"
$x=1
do
{
    Write-Host $x " " -NoNewline
    $x++ #incrementa en uno la variable $x
}
until ($x -gt 100)
Write-Host ""

Write-Host "Bucle Do-While"
#Números del 1 al 100 con bucle do-while
$x=0
do
{
    $x++
    Write-Host $x " " -NoNewline
} while ($x -lt 100)
Write-Host ""

Write-Host "Bucle For"
#Números del 1 al 100 con bucle for
for ($x = 1; $x -le 100; $x++)
{ 
    Write-Host $x " " -NoNewline
}
Write-Host ""

Write-Host "Bucle Foreach"
#Números del 1 al 100 con bucle foreach
$numeros= 1..100 #variable de tipo colección
foreach ($x in $numeros)
{ 
    Write-Host $x " " -NoNewline
}
Write-Host ""