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
    0.1.0

.NOTES
    Remember to set the execution policy to allow the script to run.
    Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser
#>

Stop-Service -Name wuauserv -Force
Stop-Service -Name bits -Force
Stop-Service -Name cryptsvc -Force
Stop-Service -Name msiserver -Force
Remove-Item -Path "C:\Windows\SoftwareDistribution\*" -Recurse -Force
Set-Service -Name wuauserv -StartupType Automatic
Start-Service -Name wuauserv
Start-Service -Name bits
Start-Service -Name cryptsvc
Start-Service -Name msiserver
