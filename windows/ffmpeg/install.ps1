$FFMPEG_PATH = "C:/_dev/extract/ffmpeg"
$currentDrive = (Get-Location).Drive.Name
$SOURCE_PATH = "$($currentDrive):/Lumidora/resources/ffmpeg"
Expand-Archive -Path "$SOURCE_PATH/ffmpeg-6.1.zip" -DestinationPath $FFMPEG_PATH
Invoke-Expression ".\..\envPath.ps1 -PATH '$FFMPEG_PATH\bin'"