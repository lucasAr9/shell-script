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
