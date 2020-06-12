$jugadores = New-Object System.Collections.Hashtable
do {
    [Int]$num = Read-Host "Introduce Numero dorsal"
    if ($num -eq 0) { break }
    $nombre = Read-Host "Introduce Nombre"
    $jugadores.Add($num,$nombre)
} while ($num -ne 0)

$jugadores.Item(1)