
#Números del 1 al 100 con bucle while
$x=1
while ($x -le 100)
{
    Write-Host $x
    $x++ #incrementa en uno la variable $x
}


#Números del 1 al 100 con bucle do-until
$x=1
do
{
    Write-Host $x 
    $x++ #incrementa en uno la variable $x
}
until ($x -gt 100)

#Números del 1 al 100 con bucle do-while
$x=0
do
{
    $x++
    Write-Host $x
} while ($x -lt 100)

#Números del 1 al 100 con bucle for
for ($x = 1; $x -le 100; $x++)
{ 
    Write-Host $x
}


#Números del 1 al 100 con bucle foreach
$numeros= 1..100 #variable de tipo colección
foreach ($x in $numeros)
{ 
    Write-Host $x
}
