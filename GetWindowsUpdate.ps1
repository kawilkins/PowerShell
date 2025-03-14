# Remember to set the execution policy using the following:
#
# Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser
#

# Set ErrorAction preference
$ErrorActionPreference = 'SilentlyContinue'

# Defrag HDD
Optimize-Volume -DriveLetter C -Analyze -Defrag

# Get and install windows updates
Get-WindowsUpdate -ForceDownload
Install-WindowsUpdate -ForceInstall -AcceptAll -AutoReboot
