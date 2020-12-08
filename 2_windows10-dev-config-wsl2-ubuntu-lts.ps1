
Write-Output "Installing WSL 2 update..."
Invoke-WebRequest -Uri https://wslstorestorage.blob.core.windows.net/wslblob/wsl_update_x64.msi -OutFile $HOME/Downloads/wsl_update_x64.msi
& $HOME\Downloads\wsl_update_x64.msi /quiet /passive

Write-Output "Setting WSL 2 as default..."
wsl --set-default-version 2

Write-Output "Installing Ubuntu LTS distro..."
Invoke-WebRequest -Uri https://aka.ms/wslubuntu2004 -OutFile $HOME/Downloads/Ubuntu.appx
Add-AppxPackage -Path $HOME\Downloads\Ubuntu.appx
ubuntu2004

Write-Output "Please restart "
$a = new-object -comobject wscript.shell
$intAnswer = $a.popup("Restart system to complete instalation?", `
0,"Restart",4)
If ($intAnswer -eq 6) {
    Restart-Computer
} else {
    Write-Output "Restart system manually to complete installation"
}
