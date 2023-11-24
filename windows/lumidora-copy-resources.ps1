param(
    [string]$lumidoraRootPath
)

.\copy_folder.ps1 -sourceFolder "$lumidoraRootPath\resources\lumidora-sd-webui\resources" -destinationFolder "$lumidoraRootPath\lumidora-sd-webui"
.\copy_folder.ps1 -sourceFolder "$lumidoraRootPath\resources\lumidora-tts\resources" -destinationFolder "$lumidoraRootPath\lumidora-tts"
