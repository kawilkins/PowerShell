<#
.SYNOPSIS
    Install PSWindowsUpdate module in PowerShell.

.DESCRIPTION
    Script will install and import the PSWindowsUpdate module in PowerShell.
    PSWindowsUpdate is essential for running Get-WindowsUpdate and Install-WindowsUpdate within PowerShell.

.AUTHOR
    Kevin Wilkins
    kwilkinsrd@gmail.com

.CREATED
    02/08/2019

.VERSION
    0.1.0

.NOTES
    Remember to set the execution policy to allow the script to run.
    Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser
#>

# Set ErrorAction preference
$ErrorActionPreference = 'SilentlyContinue'

# Install and import Powershell module
Install-Module -Name PSWindowsUpdate
Import-Module PSWindowsUpdate
