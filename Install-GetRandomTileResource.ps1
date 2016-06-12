$WindowsPowerShellPath = Join-Path -Path $home -ChildPath "documents\WindowsPowerShell"
if (!(Test-Path -Path $WindowsPowerShellPath)) {
    New-Item -ItemType Directory -Path $WindowsPowerShellPath
}
Set-Content -Path (Join-Path -Path $WindowsPowerShellPath -ChildPath "Import-GetRandomTileResource.ps1") -Value ((New-Object System.Net.WebClient).DownloadString("https://raw.githubusercontent.com/vercellone/DivideAndConquer/V/Import-GetRandomTileResource.ps1")) -Force
Write-Host "Downloaded Import-GetRandomTileResource.ps1"

$profilepath = Join-Path -Path $WindowsPowerShellPath -ChildPath "Profile.ps1"
if (Test-Path -Path $profilepath) {
    Add-Content -Path $profilepath -Value ("`n. " + (Join-Path -Path $home -ChildPath "documents\windowsPowerShell\Import-GetRandomTileResource.ps1"))
    Write-Host "Added a call to Import-GetRandomTileResource.ps1 to your profile script at $profilepath"
    Write-Warning "If this script is executed more than once you could end up with multiple calls to Import-GetRandomTileResource in your profile script.  You should manually delete any duplicate lines from $profilepath."
} else {
    Set-Content -Path $profilepath -Value ("`n. " + (Join-Path -Path $home -ChildPath "documents\windowsPowerShell\Import-GetRandomTileResource.ps1")) -Force
    Write-Host "Created $profilepath with a call to Import-GetRandomTileResource.ps1"
}

$batchfilepath = Join-Path -Path $home -ChildPath "Desktop\Get-RandomTileResource.bat"
Set-Content -Path $batchfilepath -Value 'start powershell.exe -ExecutionPolicy Bypass -NoExit -Command "Get-RandomTileResource"' -Force
Write-Host "Created $batchfilepath.  Simply double click it on your desktop to start generating random tile resources." -ForegroundColor Green