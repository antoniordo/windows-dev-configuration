
Write-Output "Enabling WSL..."
wsl --install

Write-Output "Please restart "
$a = new-object -comobject wscript.shell
$intAnswer = $a.popup("Restart system to complete instalation?", `
0,"Restart",4)
If ($intAnswer -eq 6) {
    Restart-Computer
} else {
    Write-Output "Restart system manually to complete installation"
}
