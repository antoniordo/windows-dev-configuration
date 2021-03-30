
powershell.exe -NoLogo -NoProfile -Command '[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12; Install-Module -Name PackageManagement -Force -MinimumVersion 1.4.6 -Scope CurrentUser -AllowClobber -Confirm:$False -Repository PSGallery'

mkdir "$HOME\.ssh"
ssh-keygen -C "$env:USERNAME@$(HOSTNAME)-$(Get-Date -Format 'yyyy-MM-dd')" -t rsa -f "$HOME\.ssh\id_rsa" -q

New-Item -Path "$HOME" -Name "dev" -ItemType "directory" -Force
New-Item -Path "$HOME" -Name "dev\projects" -ItemType "directory" -Force
New-Item -Path "$HOME" -Name ".aws" -ItemType "directory" -Force
New-Item -Path "$HOME" -Name ".m2" -ItemType "directory" -Force
New-Item -Path "$HOME" -Name ".docker" -ItemType "directory" -Force

# Install and enable oh-my-posh
Install-Module posh-git -Scope CurrentUser -Confirm:$False -Force
Install-Module oh-my-posh -Scope CurrentUser -Confirm:$False -Force
Install-Module -Name PSReadLine -Scope CurrentUser -Force -SkipPublisherCheck
if (!(Test-Path -Path $PROFILE )) { New-Item -Type File -Path $PROFILE -Force }
Add-Content $PROFILE "Import-Module posh-git"
Add-Content $PROFILE "Import-Module oh-my-posh"
Add-Content $PROFILE "Set-Theme Paradox"
