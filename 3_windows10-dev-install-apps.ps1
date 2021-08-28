
$vclibsUrl='https://aka.ms/Microsoft.VCLibs.x64.14.00.Desktop.appx'
Invoke-WebRequest -Uri $vclibsUrl -OutFile $HOME\Downloads\Microsoft.VCLibs.x64.14.00.Desktop.appx
Add-AppxPackage -Path $HOME\Downloads\Microsoft.VCLibs.x64.14.00.Desktop.appx

$wingetUrl = 'https://github.com/microsoft/winget-cli/releases/download/v1.0.11692/Microsoft.DesktopAppInstaller_8wekyb3d8bbwe.msixbundle'
Invoke-WebRequest -Uri $wingetUrl -OutFile $HOME\Downloads\Microsoft.DesktopAppInstaller_8wekyb3d8bbwe.msixbundle
Add-AppxPackage -Path $HOME\Downloads\Microsoft.DesktopAppInstaller_8wekyb3d8bbwe.msixbundle


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

