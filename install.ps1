$lumidoraRootPath = $PSScriptRoot+"\..\"
echo $lumidoraRootPath

cd windows
./lumidora-copy-resources.ps1 -lumidoraRootPath $lumidoraRootPath


# install
#../lumidora-tg-webui/install.ps1


cd docker
./lumidora-build-docker-images.ps1 -lumidoraRootPath $lumidoraRootPath
cd ..




cd ..