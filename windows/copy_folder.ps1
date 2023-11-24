param(
    [string]$sourceFolder = "",
    [string]$destinationFolder = ""
)

# Überprüfe, ob der Quellordner existiert
if (Test-Path $sourceFolder -PathType Container) {
    # Erstelle den Zielordner, wenn er nicht existiert
    if (-not (Test-Path $destinationFolder -PathType Container)) {
        New-Item -ItemType Directory -Force -Path $destinationFolder
    }

    # Kopiere den gesamten Ordner rekursiv zum Zielordner
    Copy-Item -Recurse -Path $sourceFolder -Destination $destinationFolder -Force

    Write-Host "Ordner erfolgreich kopiert."
} else {
    Write-Host "Quellordner existiert nicht."
}
