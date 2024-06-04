cls
#During initilization, ensure folders exist for PowerShell Game Engine
$LaunchLocation = Split-Path ($MyInvocation.MyCommand.Path)
$ExpectedFolders = @(
    "Modules",
    "Modules\EngineModules",
    "Modules\GamePlayModules",
    "Projects"
    "Engine",
    "Engine\Templates"
)
#Loop through expected folders and ensure they exist
Write-Host "-- Preforming Initilization Checks --"
Foreach ($Item in $ExpectedFolders) {
    If (!(Test-Path "$LaunchLocation\$Item")) {
        Write-Host "Missing directory - $LaunchLocation\$Item"
        $FileName = "$Item"
        If ($Item -like "*\*") {
            $SplitItem = $Item -split "\"
            $FileName = $SplitItem[$SplitItem.Count - 1]
        }
        Write-Host "Creating directory - $Item"
        New-Item -Path $LaunchLocation -Name $FileName -ItemType Directory
    }
}
#Launch GUI
Start-Process "$LaunchLocation\EngineGUI.ps1"