param (
    [string]$PATH
)

$envPath = [System.Environment]::GetEnvironmentVariable('Path', [System.EnvironmentVariableTarget]::User)

# Ersetze alle Schrägstriche durch Rückwärtsschrägstriche
$PATH = $PATH.Replace("/", "\")

if ($envPath -notcontains $PATH) {
    Write-Output "Adding to the PATH environment variable: $PATH"
    $env:Path = "$envPath;$PATH"
    [System.Environment]::SetEnvironmentVariable("Path", "$env:Path", [System.EnvironmentVariableTarget]::User)
} else {
    Write-Output "PATH value already exists in the environment variable, ignoring: $PATH"
}
