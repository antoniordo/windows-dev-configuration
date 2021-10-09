
New-Item -Path "$HOME" -Name ".ssh" -ItemType "directory" -Force
ssh-keygen -C "$env:USERNAME@$(HOSTNAME)-$(Get-Date -Format 'yyyy-MM-dd')" -t rsa -f "$HOME\.ssh\id_rsa" -q

git config --global http.sslBackend schannel

New-Item -Path "$HOME" -Name "dev" -ItemType "directory" -Force
New-Item -Path "$HOME" -Name "dev\projects" -ItemType "directory" -Force
New-Item -Path "$HOME" -Name ".aws" -ItemType "directory" -Force
New-Item -Path "$HOME" -Name ".m2" -ItemType "directory" -Force
New-Item -Path "$HOME" -Name ".gradle" -ItemType "directory" -Force
New-Item -Path "$HOME" -Name ".docker" -ItemType "directory" -Force

function crlfToLf(
      [Parameter(Mandatory)]
      [string]
      $path) {
      (Get-Content $path -Raw).Replace("`r`n", "`n") | Set-Content $path -Force
}

# Initialize files
"" | Out-File $HOME/.npmrc -Append -Encoding utf8
crlfToLf("$HOME/.npmrc")
"" | Out-File $HOME/.yarnrc -Append -Encoding utf8
crlfToLf("$HOME/.yarnrc")
"" | Out-File $HOME/.gradle/gradle.properties -Append -Encoding utf8
crlfToLf("$HOME/.gradle/gradle.properties")
@"
<settings xmlns="http://maven.apache.org/SETTINGS/1.0.0" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
      xsi:schemaLocation="http://maven.apache.org/SETTINGS/1.0.0 https://maven.apache.org/xsd/settings-1.0.0.xsd">

</settings>
"@ | Out-File $HOME/.m2/settings.xml -Encoding utf8
crlfToLf("$HOME/.yarnrc")

# Install and enable oh-my-posh
pwsh -Command { Install-Module oh-my-posh -Scope CurrentUser -Confirm:$False -Force }
pwsh -Command { Add-Content $PROFILE "Set-PoshPrompt -Theme paradox" }

#Configure Ubuntu WSL
function wslpath(
      [Parameter(Mandatory)]
      [string]
      $path,
    
      [ValidateSet('-u', '-w', '-m')]
      $conversion = '-u'
) {
      wsl 'wslpath' $conversion $path.Replace('\', '\\');
}

$windowsScriptPath = Get-Location
$ubuntuScriptPath = (wslpath $windowsScriptPath)
wsl 'bash' "$ubuntuScriptPath/ubuntu-dev-configure.sh"

