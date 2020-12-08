Windows dev enviroment config scripts
=================

This scripts configure Windows 10 for development enabling WSL 2 with Ubuntu and installs basic programs using 
Chocolatey as package Manager.

## How to use

**Important!** All scripts should be executed in **Windows Power** Shell in **Adminstrator** mode.

### 1) Open Power Shell in Administrador mode and execute:
``` powershell
Set-ExecutionPolicy Unrestricted -Force
```

### 2) Execute Script
``` powershell
.\1_windows10-dev-config-enable-wsl.ps1
```

### 3) Restart machine
After each script a restart is required.

### Execute next script
Repeat 1, 2 and 3 steps until all scripts have been executed.
