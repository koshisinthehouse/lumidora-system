param(
    [string]$lumidoraRootPath,
    [string]$app
)

# Save the current location
$currentLocation = Get-Location

# Set the location to the desired folder
Set-Location -Path "$lumidoraRootPath\$app"

# Execute commands
docker build -t $app .

# Return to the original location
Set-Location -Path $currentLocation



