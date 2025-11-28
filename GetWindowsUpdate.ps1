<#
.SYNOPSIS
    Download and install Windows updates.

.DESCRIPTION
    Script will download and install Windows updates.
    Additionally will also perform maintenance on the hard drive by

        1) Analyzing drive C
        2) Performing a defrag on drive C

.AUTHOR
    Kevin Wilkins
    kwilkinsrd@gmail.com

.CREATED
    02/08/2019

.VERSION
    0.1.0

.NOTES
    Remember to set the execution policy to allow the script to run:
    Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser
#>

# Set ErrorAction preference
$ErrorActionPreference = 'SilentlyContinue'

# Analyze and defrag HDD
Optimize-Volume -DriveLetter C -Analyze -Defrag

# Get and install windows updates
Get-WindowsUpdate -ForceDownload
Install-WindowsUpdate -ForceInstall -AcceptAll -AutoReboot
