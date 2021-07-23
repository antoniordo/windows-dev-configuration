
$wingetUrl = 'https://github-releases.githubusercontent.com/197275130/dd04bc80-d294-11eb-921d-e0f9a5ebe452?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Credential=AKIAIWNJYAX4CSVEH53A%2F20210720%2Fus-east-1%2Fs3%2Faws4_request&X-Amz-Date=20210720T134556Z&X-Amz-Expires=300&X-Amz-Signature=d9a32aaa5a8e0fe3251ee2d270ea95269841eaec0eccdef3cd7b92472a66e59c&X-Amz-SignedHeaders=host&actor_id=0&key_id=0&repo_id=197275130&response-content-disposition=attachment%3B%20filename%3DMicrosoft.DesktopAppInstaller_8wekyb3d8bbwe.msixbundle&response-content-type=application%2Foctet-stream'
$tempFile = New-TemporaryFile
Invoke-WebRequest -Uri $wingetUrl -OutFile $tempFile
Add-AppxPackage -Path $tempFile

winget install PowerShell
winget install Microsoft.WindowsTerminal
winget install Git.Git
winget install JanDeDobbeleer.OhMyPosh
winget install AdoptOpenJDK.OpenJDK.11
winget install Yarn.Yarn
winget install Docker.DockerDesktop
winget install JetBrains.Toolbox
winget install Microsoft.VisualStudioCode
winget install Amazon.AWSCLI
winget install Heroku.HerokuCLI
winget install Discord.Discord
winget install Google.Chrome
winget install 7zip.7zip
winget install VideoLAN.VLC
winget install Typora.Typora
winget install GIMP.GIMP

#  NVM Windows install (not existis in winget)
$nvmTempDirectory = [System.IO.Path]::GetTempPath() + "$(Get-Date -Format 'MMddyyyyHHmm')"
New-Item $nvmTempDirectory -itemtype directory
$nvmZipFile = "$nvmTempDirectory" + "nvm-setup.zip"
Invoke-WebRequest -Uri 'https://github.com/coreybutler/nvm-windows/releases/download/1.1.7/nvm-setup.zip' -OutFile $nvmZipFile
Expand-Archive -Path $nvmZipFile -DestinationPath "$nvmTempDirectory"
& "$nvmTempDirectory\nvm-setup.exe" /SILENT /NORESTART

# Games & hardware
Write-Output "Games & hardware apps? "
$a = new-object -comobject wscript.shell
$intAnswer = $a.popup("Install games & hardware apps?", `
        0, "Install", 4)
If ($intAnswer -eq 6) {
    winget install Valve.Steam
    winget install CPUID.CPU-Z
    winget install TechPowerUp.GPU-Z
    winget install REALiX.HWiNFO
}

Write-Output "Nvidia Broadcast app? "
$a = new-object -comobject wscript.shell
$intAnswer = $a.popup("Install games & hardware apps?", `
        0, "Install", 4)
If ($intAnswer -eq 6) {
    winget install Nvidia.Broadcast
}

Write-Output "Please restart "
$a = new-object -comobject wscript.shell
$intAnswer = $a.popup("Restart system to complete instalation?", `
        0, "Restart", 4)
If ($intAnswer -eq 6) {
    Restart-Computer
} else {
    Write-Output "Restart system manually to complete installation"
}

