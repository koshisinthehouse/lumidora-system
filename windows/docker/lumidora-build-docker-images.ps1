param(
    [string]$lumidoraRootPath
)


./build-image.ps1 -lumidoraRootPath $lumidoraRootPath -app lumidora-tts
./build-image.ps1 -lumidoraRootPath $lumidoraRootPath -app lumidora-tg-webui
./build-image.ps1 -lumidoraRootPath $lumidoraRootPath -app lumidora-sd-webui

