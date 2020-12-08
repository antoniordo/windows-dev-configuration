
Write-Output "Enabling WSL..."
dism.exe /online /enable-feature /featurename:Microsoft-Windows-Subsystem-Linux /all /norestart
dism.exe /online /enable-feature /featurename:VirtualMachinePlatform /all /norestart

Write-Output "Please restart "
$a = new-object -comobject wscript.shell
$intAnswer = $a.popup("Restart system to complete instalation?", `
0,"Restart",4)
If ($intAnswer -eq 6) {
    Restart-Computer
} else {
    Write-Output "Restart system manually to complete installation"
}
