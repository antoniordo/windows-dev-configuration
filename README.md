Windows dev enviroment config scripts
=================

This scripts configure Windows 11 for development enabling WSL with Ubuntu and installs basic development tools

## How to use

**Important!** All scripts should be executed in **Windows Power** Shell in **Adminstrator** mode.

### 1) Open Power Shell in Administrador mode and execute:
``` powershell
Set-ExecutionPolicy -ExecutionPolicy Unrestricted -Scope Process
```

### 2) Execute Script
``` powershell
.\1_windows11-dev-config-enable-wsl.ps1
```

### 3) Restart machine
After each script a restart is required.

### Execute next script
Repeat 1, 2 and 3 steps until all scripts have been executed.
