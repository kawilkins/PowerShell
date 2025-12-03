<#
.SYNOPSIS
    Fix Windows Update failures on Windows 11

.DESCRIPTION
    This script runs a fix on Windows 11 device by

        1. Stopping and disabling the Windows Update Service
        2. Removing all items in the C:\Windows\SoftwareDistribution directory
        3. Restarting the Windows Update Service.

.AUTHOR
    Kevin Wilkins
    kwilkinsrd@gmail.com

.CREATED
    12/02/2025

.VERSION
    0.2.1

.NOTES
    Remember to set the execution policy to allow the script to run.
    Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser
#>

# Set wuauserv and cryptsvc to disabled so it does not auto restart
Set-Service -Name wuauserv -StartupType Disabled -Verbose
Set-Service -Name cryptsvc -StartupType Disabled -Verbose

# Stop Windows Update and related services
$winUpdServs = "wuauserv","bits","cryptsvc","msiserver"
foreach ($service in $winUpdServs) {
    Stop-Service -Name $service -Force -Verbose
}

# Recursively remove all items in SoftwareDistribution directory.
Get-ChildItem -Path "C:\Windows\SoftwareDistribution\" -Recurse -Verbose -ErrorAction SilentlyContinue | Remove-Item -Recurse -Force -Verbose -ErrorAction SilentlyContinue

# Set wuauserv and cryptsvc to start automatically
Set-Service -Name wuauserv -StartupType Automatic -Verbose
Set-Service -Name cryptsvc -StartupType Automatic -Verbose

# Start Windows Update and related services
foreach ($service in $winUpdServs) {
    Start-Service -Name $service -Verbose
}
