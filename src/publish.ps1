$isAdmin = [bool](([System.Security.Principal.WindowsIdentity]::GetCurrent()).groups -match "S-1-5-32-544")

if($isAdmin -eq $false){
    throw "This script but be run with Administrator privileges"
}

$targetPath = "C:\Program Files (x86)\Steam\SteamApps\Common\Kerbal Space Program\GameData\MyKSPProjectPlugins"
$sourcePath = join-path $PSScriptRoot "MyKSPProject\bin\Debug"

$sourceLibrary = join-path $sourcePath "MyKSPProject.dll"

if ((Test-Path $targetPath) -eq $false){
    mkdir $targetPath
} 

Write-Host "Copying $sourceLibrary to $targetPath ..."
Copy-Item -Path $sourceLibrary -Destination $targetPath -Force
Write-Host "  Done"