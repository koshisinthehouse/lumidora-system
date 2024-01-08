$VERSION = "3.11"
$VERSION_WITHOUT_DOTS = $VERSION.Replace(".", "")
$PYTHON_PATH = "C:/_dev/extract/python"

$currentDrive = (Get-Location).Drive.Name
$SOURCE_PATH = "D:/Lumidora/resources/python"

# Deaktivieren der App-Ausführungs-Aliase für Python (Windows 11)
$registryPath = "HKCU:\Software\Microsoft\Windows\CurrentVersion\App Paths"
$pythonExePath = "$registryPath\python.exe"
$python3ExePath = "$registryPath\python3.exe"

if (Test-Path -Path $pythonExePath) {
    Set-ItemProperty -Path $pythonExePath -Name "DelegateExecute" -Value ""
    Write-Host "Python-Alias wurde deaktiviert."
}

if (Test-Path -Path $python3ExePath) {
    Set-ItemProperty -Path $python3ExePath -Name "DelegateExecute" -Value ""
    Write-Host "Python3-Alias wurde deaktiviert."
}

if (Test-Path -Path $PYTHON_PATH) {
    try {
        Write-Host "Lösche $PYTHON_PATH"
        Remove-Item -Recurse -Force -ErrorAction Stop $PYTHON_PATH
    }
    catch {
        Write-Host "Fehler beim Löschen von $PYTHON_PATH. Das Skript wird beendet."
        exit
    }
}

New-Item -ItemType Directory -Path $PYTHON_PATH

Expand-Archive -Path "$SOURCE_PATH/python-$VERSION-embed-amd64.zip" -DestinationPath $PYTHON_PATH

Add-Content -Path "$PYTHON_PATH/python$VERSION_WITHOUT_DOTS._pth" -Value ".\lib\site-packages"

Invoke-Expression ".\..\envPath.ps1 -PATH '$PYTHON_PATH'"

Invoke-Expression "python --version"

$PYTHON_SCRIPT_PATH = "$PYTHON_PATH\Scripts"
Invoke-Expression ".\..\envPath.ps1 -PATH '$PYTHON_SCRIPT_PATH'"

Invoke-WebRequest "https://bootstrap.pypa.io/get-pip.py" -OutFile "$PYTHON_PATH/get-pip.py"
Invoke-Expression "$PYTHON_PATH/python $PYTHON_PATH/get-pip.py"

Invoke-Expression "pip -V"

pip install virtualenv
#Invoke-Expression "$PYTHON_PATH\python.exe -m pip install virtualenv"
