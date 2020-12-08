
powershell.exe -NoLogo -NoProfile -Command 'Install-Module -Name PackageManagement -Force -MinimumVersion 1.4.6 -Scope CurrentUser -AllowClobber -Confirm:$False'

mkdir "$HOME\.ssh"
ssh-keygen -C "$env:USERNAME@$(HOSTNAME)-$(Get-Date -Format 'yyyy-MM-dd')" -t rsa -f "$HOME\.ssh\id_rsa" -q

mkdir "$HOME\dev"
mkdir "$HOME\dev\projects"
mkdir "$HOME\.aws"
mkdir "$HOME\.m2"
mkdir "$HOME\.docker"
Out-File -FilePath $HOME\.npmrc
Out-File -FilePath $HOME\.yarnrc

# Install and enable oh-my-posh
Install-Module posh-git -Scope CurrentUser -Confirm:$False -Force
Install-Module oh-my-posh -Scope CurrentUser -Confirm:$False -Force
Install-Module -Name PSReadLine -Scope CurrentUser -Force -SkipPublisherCheck
if (!(Test-Path -Path $PROFILE )) { New-Item -Type File -Path $PROFILE -Force }
Add-Content $PROFILE "Import-Module posh-git"
Add-Content $PROFILE "Import-Module oh-my-posh"
Add-Content $PROFILE "Set-Theme Paradox"
