param (
    [string]$PATH
)

$envPath = [System.Environment]::GetEnvironmentVariable('Path', [System.EnvironmentVariableTarget]::User)

$PATH_MODIFIED = $PATH.Replace("/", "").Replace("\", "").Trim().ToLower()

$envPathModified = $envPath.Replace("/", "").Replace("\", "").Trim().ToLower()
$envPathArray = $envPathModified -split ';'

if ($envPathArray -notcontains $PATH_MODIFIED) {
    Write-Output "Adding to the PATH environment variable: $PATH"
    $env:Path = "$envPath;$PATH"
    [System.Environment]::SetEnvironmentVariable("Path", "$env:Path", [System.EnvironmentVariableTarget]::User)
} else {
    Write-Output "PATH value already exists in the environment variable, ignoring: $PATH"
}
