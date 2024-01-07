$VERSION = "3.8"
$VERSION_WITHOUT_DOTS = $VERSION.Replace(".", "")
$PYTHON_PATH = "C:/_dev/extract/python"

$currentDrive = (Get-Location).Drive.Name
$SOURCE_PATH = "D:/Lumidora/resources/python"

# Deaktivieren der App-Ausführungs-Aliase für Python (Windows 11)
$registryPath = "HKCU:\Software\Microsoft\Windows\CurrentVersion\App Paths"
Set-ItemProperty -Path "$registryPath\python.exe" -Name "DelegateExecute" -Value ""
Set-ItemProperty -Path "$registryPath\python3.exe" -Name "DelegateExecute" -Value ""
Write-Host "Python-Aliase wurden deaktiviert."

Remove-Item -Recurse -Force -ErrorAction SilentlyContinue $PYTHON_PATH
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
#Invoke-Expression "$PYTHON_PATH\python -m pip install virtualenv"
