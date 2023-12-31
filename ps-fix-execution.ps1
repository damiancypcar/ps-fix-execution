# ----------------------------------------------------------
# Author:          damiancypcar
# Modified:        2023-09-13
# Version:         1.0
# Win Version:     Windows 10
# Desc:            Fix PowerShell execution policy and double-click
# ----------------------------------------------------------
[Diagnostics.CodeAnalysis.SuppressMessageAttribute('PSUseApprovedVerbs', '')]

# Fix PowerShell execution policy and double-click
Param (
    [switch]$help = $false
)

# All error stop the process
$ErrorActionPreference = "Stop"


# get current value
# Get-Item -Path Registry::HKEY_CLASSES_ROOT\Microsoft.PowerShellScript.1\Shell\Open\Command

Write-Output "- Set .ps1 double-click execution"
New-ItemProperty -Path "Registry::HKEY_CLASSES_ROOT\Microsoft.PowerShellScript.1\Shell\Open\Command" `
    -Value "`"C:\Windows\System32\WindowsPowerShell\v1.0\powershell.exe`" -noLogo -ExecutionPolicy unrestricted -file `"%1`"" `
    -Name "(default)" -PropertyType "String"

Write-Output "- Set .ps1 Execution Policy to Unrestricted"
Set-ExecutionPolicy -ExecutionPolicy Unrestricted -Scope LocalMachine -Verbose
