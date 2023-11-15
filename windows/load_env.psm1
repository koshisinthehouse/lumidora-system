$envFile = Get-Content ".env" -Raw
$envVariables = ConvertFrom-StringData $envFile
$envVariables.GetEnumerator() | ForEach-Object {
    [System.Environment]::SetEnvironmentVariable($_.Key, $_.Value, [System.EnvironmentVariableTarget]::Process)
    Write-Host "$($_.Key)=$($_.Value)"
}

Export-ModuleMember -Variable envVariables