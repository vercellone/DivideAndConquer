. $PSSCriptRoot\Get-RandomNPC.ps1
Function Get-RandomTileResource {
    [cmdletBinding()]
    param(
        [Parameter(Mandatory=$False)]
        [ValidateSet("?","Z Nuclear Test Z","Desert","Highland","Hot (Jungle, Savannah)","Ice Cap","Marsh","Sea/Lake","Semiarid","Steppe","Subarctic","Temperate (Continental, Marine, Mediterranean, Subtropical)","Tundra")]
        [string]
        $Type
    )
	
	Function Get-TileResource {
		param($TileType,$diceroll)

	    # Select a tile based on the climate to roll for a resource, 
	    $Resource = switch ($TileType) {
	        { "Tundra" -contains $_ } {
	            switch ($diceroll) {
	                { 1..2 -contains $_ } { "Oil" }
	                { 3..4 -contains $_ } { "Natural Gas" }
					{ 5..9 -contains $_ } { "Coal" }
					{ 10..14 -contains $_ } { "Iron" }
					{ 15..19 -contains $_ } { "Rare Earth Elements" }
					20 { "Uranium 92" }
					{ 21..25 -contains $_ } { "Luxury Minerals" }
	                default { "nothing" }
	            }
            }
	        { "Subarctic" -contains $_ } {
	            switch ($diceroll) {
	                { 1..2 -contains $_ } { "Oil" }
	                { 3..4 -contains $_ } { "Natural Gas" }
					{ 5..9 -contains $_ } { "Coal" }
					{ 10..14 -contains $_ } { "Iron" }
					{ 15..19 -contains $_ } { "Rare Earth Elements" }
					20 { "Uranium 92" }
					{ 21..35 -contains $_ } { "Food Crops" }
					{ 36..40 -contains $_ } { "Luxury Minerals" }
	                default { "nothing" }
	            }
            }
	        { "Temperate (Continental, Marine, Mediterranean, Subtropical)" -contains $_ } {
	            switch ($diceroll) {
	                { 1..2 -contains $_ } { "Natural Gas" }
					{ 3..7 -contains $_ } { "Coal" }
					{ 8..12 -contains $_ } { "Iron" }
					{ 13..17 -contains $_ } { "Aluminum" }
					18 { "Uranium 92" }
					{ 19..33 -contains $_ } { "Food Crops" }
					{ 33..42 -contains $_ } { "Cash Crops" }
					{ 43..47 -contains $_ } { "Luxury Minerals" }
	                default { "nothing" }
	            }
            }
	        { "Hot (Jungle, Savannah)" -contains $_ } {
	            switch ($diceroll) {
	                { 1..2 -contains $_ } { "Oil" }
	                { 3..4 -contains $_ } { "Natural Gas" }
					{ 5..7 -contains $_ } { "Coal" }
					{ 8..10 -contains $_ } { "Iron" }
					{ 11..15 -contains $_ } { "Aluminum" }
					16 { "Uranium 92" }
					{ 17..31 -contains $_ } { "Food Crops" }
					{ 32..41 -contains $_ } { "Cash Crops" }
					{ 42..46 -contains $_ } { "Luxury Minerals" }
	                default { "nothing" }
	            }
            }
	        { "Steppe" -contains $_ } {
	            switch ($diceroll) {
	                { 1..2 -contains $_ } { "Natural Gas" }
					{ 3..4 -contains $_ } { "Coal" }
					{ 5..7 -contains $_ } { "Iron" }
					8 { "Uranium 92" }
					{ 9..23 -contains $_ } { "Food Crops" }
					{ 24..28 -contains $_ } { "Phosphorus" }
					{ 29..38 -contains $_ } { "Cash Crops" }
					{ 39..43 -contains $_ } { "Luxury Minerals" }
	                default { "nothing" }
	            }
            }
	        { "Semiarid" -contains $_ } {
	            switch ($diceroll) {
	                { 1..2 -contains $_ } { "Oil" }
	                { 3..4 -contains $_ } { "Natural Gas" }
					{ 5..9 -contains $_ } { "Coal" }
					{ 10..14 -contains $_ } { "Iron" }
					15 { "Uranium 92" }
					{ 16..20 -contains $_ } { "Food Crops" }
					{ 21..25 -contains $_ } { "Phosphorus" }
					{ 26..35 -contains $_ } { "Cash Crops" }
					{ 36..40 -contains $_ } { "Luxury Minerals" }
	                default { "nothing" }
	            }
            }
	        { "Desert" -contains $_ } {
	            switch ($diceroll) {
	                { 1..2 -contains $_ } { "Oil" }
	                { 3..4 -contains $_ } { "Natural Gas" }
					{ 5..6 -contains $_ } { "Coal" }
					{ 7..8 -contains $_ } { "Iron" }
					{ 9..13 -contains $_ } { "Rare Earth Elements" }
					{ 14..15 -contains $_ } { "Aluminum" }
					16 { "Uranium 92" }
					{ 17..21 -contains $_ } { "Phosphorus" }
					{ 22..26 -contains $_ } { "Luxury Minerals" }
	                default { "nothing" }
	            }
            }
	        { "Highland" -contains $_ } {
	            switch ($diceroll) {
					{ 1..5 -contains $_ } { "Coal" }
					{ 6..10 -contains $_ } { "Iron" }
					{ 11..15 -contains $_ } { "Rare Earth Elements" }
					16 { "Uranium 92" }
					{ 17..31 -contains $_ } { "Food Crops" }
					{ 32..36 -contains $_ } { "Phosphorus" }
					{ 37..46 -contains $_ } { "Cash Crops" }
					{ 47..51 -contains $_ } { "Luxury Minerals" }
	                default { "nothing" }
	            }
            }
	        { "Marsh" -contains $_ } {
	            switch ($diceroll) {
	                { 1..2 -contains $_ } { "Oil" }
	                { 3..9 -contains $_ } { "Natural Gas" }
					{ 10..24 -contains $_ } { "Fish" }
					{ 25..34 -contains $_ } { "Cash Crops" }
	                default { "nothing" }
	            }
            }
	        { "Ice Cap" -contains $_ } {
	            switch ($diceroll) {
	                { 1..7 -contains $_ } { "Oil" }
	                { 8..12 -contains $_ } { "Natural Gas" }
	                default { "nothing" }
	            }
            }
	        { "Sea/Lake" -contains $_ } {
	            switch ($diceroll) {
	                { 1..2 -contains $_ } { "Oil" }
	                { 3..7 -contains $_ } { "Natural Gas" }
					{ 8..22 -contains $_ } { "Fish" }
	                default { "nothing" }
	            }
	        }
            { "Z Nuclear Test Z" -contains $_ } {
	            switch ($diceroll) {
	                { 1..11 -contains $_ } { "a horrible Mistake! MELTDOWN" }
	                { 12..46 -contains $_ } { "a Setback! -1" }
					{ 47..66 -contains $_ } { "an Obstacle! +0" }
                    { 67..91 -contains $_ } { "a Discovery! +1" }
                    { 92..101 -contains $_ } { "a Breakthrough! +2" }
	                default { "nothing" }
	            }
	        }
	    }
		Write-Host ("  {0,-17} Found {1}" -f $TileType,$Resource) -ForegroundColor Green # return Found $Resource
	}

	Function Get-TileResourceHelper {
		param($TileType)

        # Select a random number between 1 and 100, for tile resources
        $diceroll = Get-Random -Minimum 1 -Maximum 101
	    
        Write-Host "Dice roll: $diceroll" -ForegroundColor Green
	    switch ($TileType) {
            "?" {
                # Display result for a single random tile type
                $t = $validtypes[$(Get-Random -Maximum ($validtypes.Count))]
                Get-TileResource -TileType $t -DiceRoll $diceroll
            }
		    default {
			    # Display result for the type requested
			    Get-TileResource -TileType $TileType -Diceroll $diceroll
		    }
	    }
	}

	# Randomly select a valid tile type if none is specified
    $validtypes = "Z Nuclear Test Z","Desert","Highland","Hot (Jungle, Savannah)","Ice Cap","Marsh","Sea/Lake","Semiarid","Steppe","Subarctic","Temperate (Continental, Marine, Mediterranean, Subtropical)","Tundra"
	$validtypes = $validtypes | sort
	if ($Type) {
        Get-TileResourceHelper -TileType $Type
    } else {
        do {
		    for ($i=0; $i -lt $validtypes.Length; $i++) {
			    Write-Host "[$i] $($validtypes[$i])"
		    }
		    Write-Host "[?] Random Tile Type"
		    Write-Host "[q] Quit"
		    Write-Host
            $selection = do {
			    $input = Read-Host -Prompt "For which tile would you like to select a resource? [?]" 
			    if (-not $input) { $input = "?" }
                if (0..($validtypes.Count-1) -contains $input) { 
				        $Type = $validtypes[$input]
			    } else {
				    if ($validtypes+"?" -contains $input) {
					    $Type = $input
				    }
			    }
                $input
		    } until (0..($validtypes.Count-1) -contains $input -or "?","q" -contains $input)
            if ($selection -ne "q") {
                Write-Host ('____________________________________________________________________________________________')
		        Write-Host
                Get-TileResourceHelper -TileType $Type
                $npc = Get-RandomNPC
                if ($npc) {
                    Write-Host ('A(n) {0} NPC spawned!' -f $npc.Mood) -ForegroundColor Red
                    Write-Host ('It is {0} tiles big & has {1}' -f $npc.Size,$npc.Resource) -ForegroundColor Red
                }
                Write-Host ('____________________________________________________________________________________________')
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
  		highland          Found oil

	Prompts for tile type.

.EXAMPLE
	Get-RandomTileResource -Type "*"
	
	Dice roll: 18
	  arid              Found nothing
	  highland          Found nothing
	  humid continental Found crops
	  humid subtropical Found crops
	  marine west coast Found crops
	  mediterranean     Found crops
	  semiarid          Found nothing
	  subarctic         Found nothing
	  tropical humid    Found Aluminum components
	  tundra            Found nothing

	Select resource for every tile based on a single roll.

.EXAMPLE
	Get-RandomTileResource -Type "?"
	
	Dice roll: 65
	  Tundra            Found nothing

	Select resource for a single random tile type.

.NOTES
    Change Log:
	Jason Vercellone	July 2, 2015		Created
        Matt Repsher	September 1, 2015	Sentence Case corrections; Updated various selections/probabilities
		Matt Repsher	May 23, 2016		Remade to accommodate D&CVI mechanics

.LINK
    https://gist.github.com/vercellone/bdf13d74caded715afaa
.LINK
    http://pastebin.com/h53kWqHB
#>
}
