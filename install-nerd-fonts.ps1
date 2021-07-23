
$timestamp = Get-Date -Format 'MMddyyyyHHmm'
$tempDirectory = [System.IO.Path]::GetTempPath()

$jetBrainsMonoZip = "$tempDirectory" + "fonts-" + $timestamp + ".zip"
Invoke-WebRequest -Uri 'https://github.com/ryanoasis/nerd-fonts/releases/download/v2.1.0/JetBrainsMono.zip' -OutFile $jetBrainsMonoZip

$allFontsDirectory = $tempDirectory + "extracted-fonts-" + $timestamp
New-Item $allFontsDirectory -itemtype directory
Expand-Archive -Path $jetBrainsMonoZip -DestinationPath "$allFontsDirectory"

$compatibleFontsDirectory = $tempDirectory + "compatible-fonts-" + $timestamp
New-Item $compatibleFontsDirectory -itemtype directory
foreach ($fontFile in Get-ChildItem -Path $allFontsDirectory -File) {
    if ($fontFile.Name -like '*Windows*') {
        $fontFile | Copy-Item -Destination "$compatibleFontsDirectory\$fontFile"        
    }
}

#Download and execute install font script from nerd-fonts
Invoke-WebRequest -Uri 'https://raw.githubusercontent.com/ryanoasis/nerd-fonts/master/patched-fonts/install.ps1' -OutFile "$compatibleFontsDirectory/install.ps1"
Set-Location $compatibleFontsDirectory
.\install.ps1

# Configure Windows Terminal Font
$windowsTerminalConfigFile = "$env:LOCALAPPDATA\Packages\Microsoft.WindowsTerminal_8wekyb3d8bbwe\LocalState\settings.json"
$windowsTerminalConfig = Get-Content $windowsTerminalConfigFile -raw | ConvertFrom-Json
$windowsTerminalConfig.profiles.defaults | Add-Member -NotePropertyName fontFace -NotePropertyValue 'JetBrainsMono NF' -Force
Write-Output $windowsTerminalConfig.profiles.defaults.fontFace
$windowsTerminalConfig | ConvertTo-Json -depth 32 | set-content $windowsTerminalConfigFile