<#
.SYNOPSIS
    Create a random generated password.

.DESCRIPTION
    Script will create a random generated password following the criteria:

        1. At least (1) uppercase character.
        2. At least (1) lowercase character.
        3. At least (1) number character.
        4. Randomize to 12 characters for strength.

    Used a function to handle parameters and return value of password.

.AUTHOR
    Kevin Wilkins
    kwilkinsrd@gmail.com

.CREATED
    08/05/2025

.VERSION
    0.1.0

.NOTES
    Remember to set the execution policy to allow the script to run.
    Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser
#>

function RandomPassword {
    $uppercase = 65..90 | ForEach-Object { [char]$_ }
    $lowercase = 97..122 | ForEach-Object { [char]$_ }
    $number    = 48..57 | ForEach-Object { [char]$_ }

    $requiredChars = @(
        $uppercase | Get-Random
        $lowercase | Get-Random
        $number | Get-Random
    )

    $allChars = $uppercase + $lowercase + $number
    $randomChars = 1..9 | ForEach-Object { $allChars | Get-Random }

    return -join ($requiredChars + $randomChars | Get-Random -Count 12)
}

$password = RandomPassword
Write-Output $password
