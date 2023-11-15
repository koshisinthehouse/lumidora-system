param(
    [string]$path = "."
)

# Git-Repository initialisieren, falls es noch nicht existiert
if (-not (Test-Path "$path\.git" -PathType Container)) {
    git init $path
}git

# In das Git-Verzeichnis wechseln
cd $path

# Git-Befehle ausführen
git add .
git commit -a -m "modified"
git push
