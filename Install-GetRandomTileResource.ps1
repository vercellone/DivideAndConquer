$WindowsPowerShellPath = Join-Path -Path $home -ChildPath "documents\WindowsPowerShell"
if (!(Test-Path -Path $WindowsPowerShellPath)) {
    New-Item -ItemType Directory -Path $WindowsPowerShellPath
}
Set-Content -Path (Join-Path -Path $WindowsPowerShellPath -ChildPath "Import-GetRandomTileResource.ps1") -Value ((New-Object System.Net.WebClient).DownloadString("https://raw.githubusercontent.com/vercellone/DivideAndConquer/master/Import-GetRandomTileResource.ps1")) -Force
Write-Host "Downloaded Import-GetRandomTileResource.ps1"

$batchfilepath = Join-Path -Path $home -ChildPath "Desktop\Get-RandomTileResource.bat"
Set-Content -Path $batchfilepath -Value "start powershell.exe -ExecutionPolicy Bypass -NoExit -File $(Join-Path -Path $WindowsPowerShellPath -ChildPath 'Get-RandomTileResource.ps1')" -Force
Write-Host "Created $batchfilepath.  Simply double click it on your desktop to start generating random tile resources." -ForegroundColor Green