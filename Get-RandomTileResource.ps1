Function Get-RandomTileResource {
    [cmdletBinding()]
    param(
        [Parameter(Mandatory=$False)]
        [ValidateSet("*","?","marine west coast","humid continental","humid subtropical","mediterranean","tropical humid","highland","semiarid","subarctic","tundra","arid")]
        [string]
        $Type
    )
    
    Function Get-TileResource {
        param($TileType,$DiceRoll)

        # Select a resource based on the type and random number, 
        $Resource = switch ($TileType) {
            { "marine west coast","humid continental" -contains $_ } {
                switch ($DiceRoll) {
                    1 { "Oil" }
                    { 2..4 -contains $_ } { "Coal" }
                    { 5..9 -contains $_ } { "Iron" }
                    { 10..11 -contains $_ } { "Rubber" }
                    12 { "Helium" }
                    { 13..22 -contains $_ } { "Crops" }
                    { 23..24 -contains $_ } { "Aluminum Components" }
                    25 { "Opium" }
                    default { "nothing" }
                }
            }
            "humid subtropical" {
                switch ($DiceRoll) {
                    1 { "Oil" }
                    { 2..4 -contains $_ } { "Coal" }
                    { 5..9 -contains $_ } { "Iron" }
                    { 10..12 -contains $_ } { "Rubber" }
                    13 { "Helium" }
                    { 14..23 -contains $_ } { "Crops" }
                    { 24..25 -contains $_ } { "Aluminum Components" }
                    { 26..27 -contains $_ } { "Opium" }
                    default { "nothing" }
                }
            }
            "mediterranean" {
                switch ($DiceRoll) {
                    1 { "Oil" }
                    { 2..4 -contains $_ } { "Coal" }
                    { 5..9 -contains $_ } { "Iron" }
                    10 { "Rubber" }
                    11 { "Helium" }
                    { 12..21 -contains $_ } { "Crops" }
                    { 22..24 -contains $_ } { "Aluminum Components" }
                    default { "nothing" }
                }
            }
            "tropical humid" {
                switch ($DiceRoll) {
                    1 { "Oil" }
                    { 2..3 -contains $_ } { "Coal" }
                    { 4..5 -contains $_ } { "Iron" }
                    { 6..15 -contains $_ } { "Rubber" }
                    16 { "Helium" }
                    17 { "Crops" }
                    { 18..22 -contains $_ } { "Aluminum Components" }
                    { 23..32 -contains $_ } { "Opium" }
                    default { "nothing" }
                }
            }
            "highland" {
                switch ($DiceRoll) {
                    1 { "Oil" }
                    { 2..6 -contains $_ } { "Coal" }
                    { 7..11 -contains $_ } { "Iron" }
                    12 { "Helium" }
                    13 { "Crops" }
                    default { "nothing" }    
                }
            }
            { "arid","semiarid" -contains $_ } {
               switch ($DiceRoll) {
                    { 1..2 -contains $_ } { "Oil" }
                    { 3..4 -contains $_ } { "Coal" }
                    5 { "Iron" }
                    6 { "Helium" }
                    7 { "Aluminum Components" }
                    default { "nothing" }   
                }
            }
            { "subarctic","tundra" -contains $_ } {
                switch ($DiceRoll) {
                    { 1..2 -contains $_ } { "Oil" }
                    3 { "Coal" }
                    4 { "Iron" }
                    5 { "Helium" }
                    default { "nothing" }
                }
            }
        }
        Write-Host ("  {0,-17} Found {1}" -f $TileType,$Resource) -ForegroundColor Green # return Found $Resource
    }

    Function Get-TileResourceHelper {
        param($TileType)

        # Select a random number between 1 and 100
        $diceroll = Get-Random -Minimum 1 -Maximum 101
        
        Write-Host "Dice roll: $diceroll" -ForegroundColor Green
        switch ($TileType) {
            "*" {
                # Display result for every valid tile type based on a single roll
                foreach ($t in $validtypes) {
                    Get-TileResource -TileType $t -DiceRoll $diceroll
                }
            }
            "?" {
                # Display result for a single random tile type
                $t = $validtypes[$(Get-Random -Maximum ($validtypes.Count))]
                Get-TileResource -TileType $t -DiceRoll $diceroll
            }
            default {
                # Display result for the type requested
                Get-TileResource -TileType $TileType -DiceRoll $diceroll
            }
        }
    }

    # Randomly select a valid tile type if none is specified
    $validtypes = "marine west coast","humid continental","humid subtropical","mediterranean","tropical humid","highland","semiarid","subarctic","tundra","arid"
    $validtypes = $validtypes | sort
    if ($Type) {
        Get-TileResourceHelper -TileType $Type
    } else {
        do {
            for ($i=0; $i -lt $validtypes.Length; $i++) {
                Write-Host "[$i] $($validtypes[$i])"
            }
            Write-Host "[*] (All - Select resource for every tile based on a single roll)"
            Write-Host "[?] (Any - Select resource for a single random tile type)"
            Write-Host "[q] Quit"
            Write-Host
            $selection = do {
                $input = Read-Host -Prompt "For which tile would you like to select a resource? [*]" 
                if (-not $input) { $input = "*" }
                if (0..($validtypes.Count-1) -contains $input) { 
                        $Type = $validtypes[$input]
                } else {
                    if ($validtypes+"*","?" -contains $input) {
                        $Type = $input
                    }
                }
                $input
            } until (0..($validtypes.Count-1) -contains $input -or "*","?","q" -contains $input)
            if ($selection -ne "q") {
                Write-Host
                Get-TileResourceHelper -TileType $Type
                Write-Host
            }
        } until ($selection -eq "q")
    }
    
<#
.SYNOPSIS 
    Gets a weighted random resource for a given (or random) tile type.

.DESCRIPTION
   Gets a weighted random resource for a given (or random) tile type.
    
.PARAMETER Type
    A valid tile type.  For example: "marine west coast","humid continental","humid subtropical","mediterranean","tropical humid","highland","semiarid","subarctic","tundra","arid"
    
    If not specified, a random tile type is chosen.

.OUTPUTS 
    string
              
    Resource found
    
.EXAMPLE
    Get-RandomTileResource -Type "marine west coast"
    
    Dice roll: 100
      marine west coast Found nothing

    Gets a random resource for "marine west coast" tile type.

.EXAMPLE
    Get-RandomTileResource
    
    [0] arid
    [1] highland
    [2] humid continental
    [3] humid subtropical
    [4] marine west coast
    [5] mediterranean
    [6] semiarid
    [7] subarctic
    [8] tropical humid
    [9] tundra
    [*] (All - Select resource for every tile based on a single roll)
    [?] (Any single random tile)
    
    Dice roll: 1
          highland          Found Oil

    Prompts for tile type.

.EXAMPLE
    Get-RandomTileResource -Type "*"
    
    Dice roll: 18
      arid              Found nothing
      highland          Found nothing
      humid continental Found Crops
      humid subtropical Found Crops
      marine west coast Found Crops
      mediterranean     Found Crops
      semiarid          Found nothing
      subarctic         Found nothing
      tropical humid    Found Aluminum Components
      tundra            Found nothing

    Select resource for every tile based on a single roll.

.EXAMPLE
    Get-RandomTileResource -Type "?"
    
    Dice roll: 65
      tundra            Found nothing

    Select resource for a single random tile type.

.NOTES
    Change Log:
	Jason Vercellone	July 2, 2015		Created
        Matt Repsher		September 1, 2015	Sentence Case corrections; Updated various selections/probabilities

.LINK
    https://gist.github.com/vercellone/bdf13d74caded715afaa
.LINK
    http://pastebin.com/h53kWqHB
#>
}
Get-RandomTileResource