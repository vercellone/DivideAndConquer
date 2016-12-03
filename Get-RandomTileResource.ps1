Function Get-RandomNPC {
    [cmdletBinding()]
    param()
    $IsNPC = 1..125 | Get-Random
    Write-Verbose "NPC roll: $IsNPC"
    if ($IsNPC -eq 1) {
        New-Object PSObject -Property @{
            Mood='Hostile','Indifferent','Friendly' | Get-Random
            Size=3..6 | Get-Random
            Resource='Oil','Natural Gas','Coal','Iron','Rare Earth Elements','Aluminum','Uranium' | Get-Random
            Luck='Lucky!','Not Lucky.','Not Lucky.','Not Lucky.','Not Lucky.','Not Lucky.','Not Lucky.','Not Lucky.','Not Lucky.','Not Lucky.' | Get-Random
			Govt='Communist','Democratic','Autocratic Right','Monarchist','Crazy' | Get-Random
        }
    }
}
Function Get-RandomTileResource {
    [cmdletBinding()]
    param(
        [Parameter(Mandatory=$False)]
        [ValidateSet("?","[NPC Expansion]","[NUCLEAR TEST]","Desert","Highland","Hot","Ice Cap","Marsh","Sea/Lake","Semiarid","Steppe","Subarctic","Temperate","Tundra")]
        [string]
        $Type
    )
	
	Function Get-TileResource {
		param($TileType,$diceroll)

	    # Select a tile based on the climate to roll for a resource, 
	    $Resource = switch ($TileType) {
	        { "Tundra" -contains $_ } {
	            switch ($diceroll) {
	                { 1..2 -contains $_ } { "Oil" } # 2%
	                { 3..4 -contains $_ } { "Natural Gas" } # 2%
					{ 5..9 -contains $_ } { "Coal" } # 5%
					{ 10..14 -contains $_ } { "Iron" } # 5%
					{ 15..19 -contains $_ } { "Rare Earth Elements" } # 5%
					20 { "Uranium 92" } # 1%
					{ 21..25 -contains $_ } { "Luxury Minerals" } # 5%
	                default { "nothing" } # 
	            }
            }
	        { "Subarctic" -contains $_ } {
	            switch ($diceroll) {
	                { 1..2 -contains $_ } { "Oil" } # 2%
	                { 3..4 -contains $_ } { "Natural Gas" } # 2%
					{ 5..9 -contains $_ } { "Coal" } # 5%
					{ 10..14 -contains $_ } { "Iron" } # 5%
					{ 15..19 -contains $_ } { "Rare Earth Elements" } # 5%
					20 { "Uranium 92" } # 1%
					{ 21..25 -contains $_ } { "Food Crops" } # 5%
					{ 26..30 -contains $_ } { "Luxury Minerals" } # 5%
	                default { "nothing" }
	            }
            }
	        { "Temperate" -contains $_ } {
	            switch ($diceroll) {
	                { 1..2 -contains $_ } { "Natural Gas" } # 2%
					{ 3..6 -contains $_ } { "Coal" } # 4%
					{ 7..10 -contains $_ } { "Iron" } # 4%
					{ 11..17 -contains $_ } { "Aluminum" } # 7%
					18 { "Uranium 92" } # 1%
					{ 19..33 -contains $_ } { "Food Crops" } # 15%
					{ 34..40 -contains $_ } { "Cash Crops" } # 7%
					{ 41..47 -contains $_ } { "Luxury Minerals" } # 7%
	                default { "nothing" }
	            }
            }
	        { "Hot" -contains $_ } {
	            switch ($diceroll) {
	                { 1..2 -contains $_ } { "Oil" } # 2%
	                { 3..4 -contains $_ } { "Natural Gas" } # 2%
					{ 5..7 -contains $_ } { "Coal" } # 3%
					{ 8..10 -contains $_ } { "Iron" } # 3%
					{ 11..15 -contains $_ } { "Aluminum" } # 5%
					16 { "Uranium 92" } # 1%
					{ 17..31 -contains $_ } { "Food Crops" } # 15%
					{ 32..41 -contains $_ } { "Cash Crops" } # 10%
					{ 42..46 -contains $_ } { "Luxury Minerals" } # 5%
	                default { "nothing" }
	            }
            }
	        { "Steppe" -contains $_ } {
	            switch ($diceroll) {
	                { 1..2 -contains $_ } { "Natural Gas" } # 2%
					{ 3..4 -contains $_ } { "Coal" } # 2%
					{ 5..7 -contains $_ } { "Iron" } # 3%
					8 { "Uranium 92" } # 1%
					{ 9..23 -contains $_ } { "Food Crops" } # 15%
					{ 24..30 -contains $_ } { "Phosphorus" } # 7%
					{ 31..40 -contains $_ } { "Cash Crops" } # 10%
					{ 41..47 -contains $_ } { "Luxury Minerals" } # 7%
	                default { "nothing" }
	            }
            }
	        { "Semiarid" -contains $_ } {
	            switch ($diceroll) {
	                { 1..2 -contains $_ } { "Oil" } # 2%
	                { 3..4 -contains $_ } { "Natural Gas" } # 2%
					{ 5..9 -contains $_ } { "Coal" } # 5%
					{ 10..14 -contains $_ } { "Iron" } # 5%
					15 { "Uranium 92" } # 1%
					{ 16..20 -contains $_ } { "Food Crops" } # 5%
					{ 21..25 -contains $_ } { "Phosphorus" } # 5%
					{ 26..35 -contains $_ } { "Cash Crops" } # 10%
					{ 36..40 -contains $_ } { "Luxury Minerals" } # 5%
	                default { "nothing" }
	            }
            }
	        { "Desert" -contains $_ } {
	            switch ($diceroll) {
	                { 1..2 -contains $_ } { "Oil" } # 2%
	                { 3..4 -contains $_ } { "Natural Gas" } # 2%
					{ 5..6 -contains $_ } { "Coal" } # 2%
					{ 7..8 -contains $_ } { "Iron" } # 2%
					{ 9..13 -contains $_ } { "Rare Earth Elements" } # 5%
					{ 14..15 -contains $_ } { "Aluminum" } # 2%
					16 { "Uranium 92" } # 1%
					{ 17..21 -contains $_ } { "Phosphorus" } # 5%
					{ 22..26 -contains $_ } { "Luxury Minerals" } # 5%
	                default { "nothing" }
	            }
            }
	        { "Highland" -contains $_ } {
	            switch ($diceroll) {
					{ 1..5 -contains $_ } { "Coal" } # 5%
					{ 6..10 -contains $_ } { "Iron" } # 5%
					{ 11..15 -contains $_ } { "Rare Earth Elements" } # 5%
					16 { "Uranium 92" } # 1%
					{ 17..21 -contains $_ } { "Phosphorus" } # 5%
					{ 22..31 -contains $_ } { "Cash Crops" } # 10%
					{ 32..36 -contains $_ } { "Luxury Minerals" } # 5%
	                default { "nothing" }
	            }
            }
	        { "Marsh" -contains $_ } {
	            switch ($diceroll) {
	                { 1..2 -contains $_ } { "Oil" } # 2%
	                { 3..9 -contains $_ } { "Natural Gas" } # 7%
					{ 10..24 -contains $_ } { "Fish" } # 15%
					{ 25..34 -contains $_ } { "Cash Crops" } # 10%
	                default { "nothing" }
	            }
            }
	        { "Ice Cap" -contains $_ } {
	            switch ($diceroll) {
	                { 1..11 -contains $_ } { "Oil" } # 11%
	                { 12..21 -contains $_ } { "Natural Gas" } # 9%
	                default { "nothing" }
	            }
            }
	        { "Sea/Lake" -contains $_ } {
	            switch ($diceroll) {
	                { 1..8 -contains $_ } { "Oil" } # 8%
	                { 9..14 -contains $_ } { "Natural Gas" } # 6%
					{ 15..38 -contains $_ } { "Fish" } # 24%
                    { 39..44 -contains $_ } { "Luxury Minerals" } # 6%
	                default { "nothing" }
	            }
	        }
            { "[NUCLEAR TEST]" -contains $_ } {
	            switch ($diceroll) {
	                { 1..8 -contains $_ } { "a horrible Mistake! MELTDOWN" } # 8%
	                { 9..25 -contains $_ } { "a Setback! -1" } # 17
					{ 26..50 -contains $_ } { "an Obstacle! +0" } # 25
                    { 51..85 -contains $_ } { "a Discovery! +1" } # 35
                    { 86..100 -contains $_ } { "a Breakthrough! +2" } # 15
	                default { "nothing" }
	            }
	        }
            { "[NPC Expansion]" -contains $_ } {
	            switch ($diceroll) {
	                { 1..30 -contains $_ } { "+4ep" } # 30%
	                { 31..45 -contains $_ } { "+3ep" } # 15%
					{ 46..55 -contains $_ } { "+2ep" } # 10%
					{ 56..60 -contains $_ } { "+1ep" } # 5%
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
    $validtypes = "[NPC Expansion]","[NUCLEAR TEST]","Desert","Highland","Hot","Ice Cap","Marsh","Sea/Lake","Semiarid","Steppe","Subarctic","Temperate","Tundra"
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
                    Write-Host ('It has a {0} govt & is {1}' -f $npc.Govt,$npc.Luck) -ForegroundColor Red
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
	Jason Vercellone	July 2, 2015	Created
        Matt Repsher	September 1, 2015	Sentence Case corrections; Updated various selections/probabilities
	Matt Repsher	May 23, 2016		Remade to accommodate D&CVI mechanics
        Matt Repsher	June 26, 2016		changed NPC chance to 1/100; buffed sea/lake; removed food from highland
        Matt Repsher	August 7, 2016		Rebalanced chances for nuclear test option, added NPC Expansion option
        Matt Repsher	September 10, 2016	Added government types to NPCs, changed the roll chances for NPC expansion, & added resource chances as comments off to the side.
	Matt Repsher	December 2. 2016	Buffed Sea/Lake chances by 1.2; buffed Ice Cap chances by 1.5

.LINK
    https://gist.github.com/vercellone/bdf13d74caded715afaa
.LINK
    http://pastebin.com/h53kWqHB
#>
}
Get-RandomTileResource
