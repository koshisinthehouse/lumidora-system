param(
    [string]$image = "."
)

# Überprüfe, ob der angegebene Pfad existiert
if (-not ($image)) {
    throw "Der angegebene Pfad '$image' existiert nicht."
}

Import-Module ../load_env.psm1

# Docker login
$dockerUsername = $envVariables["DOCKER_USERNAME"]
$dockerPassword = $envVariables["DOCKER_PASSWORD"]

# Führe den Login-Befehl aus
docker login -u $dockerUsername -p $dockerPassword

# Führe die restlichen Docker-Befehle aus

docker tag "$($image):latest" "$($dockerUsername)/$($image):latest"
docker push "$($dockerUsername)/$($image):latest"
