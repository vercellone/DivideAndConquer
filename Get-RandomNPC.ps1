Function Get-RandomNPC {
    [cmdletBinding()]
    param()
    $IsNPC = 0..80 | Get-Random
    Write-Verbose "NPC roll: $IsNPC"
    if ($IsNPC -eq 0) {
        New-Object PSObject -Property @{
            Mood='Hostile','Indifferent','Friendly' | Get-Random
            Size=3..6 | Get-Random
            Resource='Oil','N.Gas','Coal','Iron','REE','Al','92U' | Get-Random
        }
    }
}