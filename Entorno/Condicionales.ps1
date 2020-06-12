[Int]$num1 = Read-Host "Introduce el número 1"
[Int]$num2 = Read-Host "Introduce el número 2"

if ($num1 -gt $num2) {
    Write-Host "$num1 es mayor que $num2"
} else {
    if ($num1 -eq $num2) {
        Write-Host "$num1 es igual que $num2"
    } else {
        Write-Host "$num2 es mayor que $num1"
    }
}
