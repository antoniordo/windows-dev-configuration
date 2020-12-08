
function wslpath(
    [Parameter(Mandatory)]
    [string]
    $path,
    
    [ValidateSet('-u', '-w', '-m')]
    $conversion = '-u'
) {
    wsl 'wslpath' $conversion $path.Replace('\', '\\');
}

$windowsScriptPath=Get-Location
$ubuntuScriptPath=(wslpath $windowsScriptPath)
wsl 'bash' "$ubuntuScriptPath/configure-ubuntu-wsl.sh"