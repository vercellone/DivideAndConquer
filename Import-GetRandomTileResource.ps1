$GRTRPath = Join-Path -Path $home -ChildPath "documents\windowsPowerShell\Get-RandomTileResource.ps1"

## Function to download the latest direct from github
Function Get-GetRandomTileResource {
	# Download the latest Get-RandomTileResource gist from github
	$GRTRScript = (New-Object System.Net.WebClient).DownloadString("https://gist.githubusercontent.com/vercellone/bdf13d74caded715afaa/raw")
	if ($GRTRScript) {
		# Save a local copy of the latest for later use
		$GRTRScript | Set-Content -Path $GRTRPath
		
		# Force the functions in the script to be declared with Global scope
	    $GRTRScript = $GRTRScript -replace '\s*Function\s(\w+)','Function Global:$1'
		
		# Execute the modified script import the functions for immediate use
		$GRTRScript | Invoke-Expression

		Write-Host "Get-RandomTileResource.ps1 successfully updated from github"
	}
}

# Import the function locally, if available, else download it first
if (Test-Path -Path $GRTRPath) { 
	# Import the function globally using the local copy
   	Get-Content -Path $GRTRPath | ForEach-Object { $_ -replace '\s*Function\s(\w+)','Function Global:$1' } | Out-String | Invoke-Expression
} else { 
	# Get it from github
    Get-GetRandomTileResource
}

# Set Aliases for convenience
Set-Alias -Name grtr -Value Get-RandomTileResource
Set-Alias -Name ugrtr -Value Get-GetRandomTileResource  