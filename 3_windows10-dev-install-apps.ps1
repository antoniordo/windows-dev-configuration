
Invoke-WebRequest -Uri https://chocolatey.org/install.ps1 -OutFile $HOME/Downloads/install-choco.ps1
& $HOME/Downloads/install-choco.ps1

# Prerequisites
choco install -y vcredist2008 vcredist2017 powershell-core

# Development
choco install -y python
choco install -y jdk11 maven gradle
choco install -y nodejs-lts yarn
choco install -y jetbrainsmono firacode hackfont dejavufonts cascadiacodepl
choco install -y jetbrainstoolbox vscode typora microsoft-windows-terminal
choco install -y git --params "/NoShellIntegration /SChannel /NoGuiHereIntegration /NoShellHereIntegration"
choco install -y docker-desktop
choco install -y awscli heroku-cli

# General applications
choco install -y discord vlc cpu-z googlechrome firefox 7zip freefilesync adobereader

# Office
choco install -y gimp

# Windows Additions
choco install -y powertoys

# Games & hardware
Write-Output "Games & hardware apps? "
$a = new-object -comobject wscript.shell
$intAnswer = $a.popup("Install games & hardware apps?", `
0,"Install",4)
If ($intAnswer -eq 6) {
    choco install -y msiafterburner steam hwinfo.install cinebench
}

Write-Output "Please restart "
$a = new-object -comobject wscript.shell
$intAnswer = $a.popup("Restart system to complete instalation?", `
0,"Restart",4)
If ($intAnswer -eq 6) {
    Restart-Computer
} else {
    Write-Output "Restart system manually to complete installation"
}

