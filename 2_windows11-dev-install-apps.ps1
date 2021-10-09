

winget install --id Microsoft.PowerShell
winget install JanDeDobbeleer.OhMyPosh

# Languages
winget install --id EclipseAdoptium.Temurin.17
winget install --id Python.Python.3
winget install --id GoLang.Go
winget install --id RubyInstallerTeam.Ruby
winget install --id OpenJS.NodeJS
winget install --id Yarn.Yarn
#Install NVM
$nvmTempDirectory = [System.IO.Path]::GetTempPath() + "$(Get-Date -Format 'MMddyyyyHHmm')"
New-Item $nvmTempDirectory -itemtype directory
$nvmZipFile = "$nvmTempDirectory" + "nvm-setup.zip"
Invoke-WebRequest -Uri 'https://github.com/coreybutler/nvm-windows/releases/download/1.1.8/nvm-setup.zip' -OutFile $nvmZipFile
Expand-Archive -Path $nvmZipFile -DestinationPath "$nvmTempDirectory"
& "$nvmTempDirectory\nvm-setup.exe" /S

# Tools
winget install -i --id Git.Git
winget install -i --id Docker.DockerDesktop
winget install --id Amazon.AWSCLI
winget install --id Heroku.HerokuCLI

# IDE's
winget install --id Typora.Typora
winget install --id JetBrains.Toolbox
winget install -i --id Microsoft.VisualStudioCode

# Virtualization
winget install --id Oracle.VirtualBox
winget install --id Hashicorp.Vagrant

# Other apps
winget install --id Discord.Discord
winget install --id Google.Chrome
winget install --id 7zip.7zip
winget install --id VideoLAN.VLC
winget install --id GIMP.GIMP

# Games & hardware
Write-Output "Games & hardware apps? "
$a = new-object -comobject wscript.shell
$intAnswer = $a.popup("Install games & hardware apps?", `
        0, "Install", 4)
If ($intAnswer -eq 6) {
    winget install --id Valve.Steam
    winget install --id CPUID.CPU-Z
    winget install --id TechPowerUp.GPU-Z
    winget install --id REALiX.HWiNFO
}

Write-Output "Nvidia Broadcast app? "
$a = new-object -comobject wscript.shell
$intAnswer = $a.popup("Install Nvidia Broadcast?", `
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

