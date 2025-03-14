# Remember to set the execution policy using the following:
#
# Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser
#

# Set ErrorAction preference
$ErrorActionPreference = 'SilentlyContinue'

# Install and import Powershell module
Install-Module -Name PSWindowsUpdate
Import-Module PSWindowsUpdate
