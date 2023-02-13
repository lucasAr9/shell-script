param (
    [string]$path,
    [string]$initialExtension,
    [string]$targetExtension,
    [datetime]$startDate,
    [datetime]$endDate
)

Get-ChildItem -Path $path -Filter "*$initialExtension" -Recurse |
Where-Object { $_.Length -gt 0 -or $_.Length -eq 0 } |
ForEach-Object {
    if ($_.CreationTime -gt (Get-Date -Date $startDate) -and $_.CreationTime -lt (Get-Date -Date $endDate)) {
        Write-Output "$($_.FullName) has creation time between 05/02/2023 and 06/02/2023: True"
        $newName = $_.FullName -replace [regex]::Escape("$initialExtension"), $targetExtension
        Rename-Item $_.FullName -NewName $newName
    }
    else {
        Write-Output "$($_.FullName) has creation time between 05/02/2023 and 06/02/2023: False ($($_.CreationTime))"
    }
}

# ./renombrar_en_PowerShell.ps1 -path "directorio a escanear" -initialExtension "extension a buscar" -targetExtension "extension final"
# por ejemplo, para eliminar la extension .old3 tendria que ponerse asi:
#   ./renombrar_en_PowerShell.ps1 -path "directorio a escanear" -initialExtension ".old3" -targetExtension ""
# y para cambiar la .oldws2 a .old:
#   ./renombrar_en_PowerShell.ps1 -path "directorio a escanear" -initialExtension ".oldws2" -targetExtension ".old"
