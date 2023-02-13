$baseDirectory = "/intercambio/DF002"

Get-ChildItem -Path $baseDirectory -Recurse | 
Where-Object { $_.PSIsContainer -and $_.Name -ne "CONTROLM" } | 
ForEach-Object {
    $folder = $_.FullName
    $file = Get-ChildItem -Path $folder | Select-Object -First 1

    if ($file) {
        $numericPart = [regex]::Match($file.Name, "\d+").Value
        $folderName = Split-Path -Leaf $folder
        if ($folderName.Length -lt 4) {
            $folderName = $folderName + " "
        }
        Write-Output "$folderName $numericPart"
    }
}
