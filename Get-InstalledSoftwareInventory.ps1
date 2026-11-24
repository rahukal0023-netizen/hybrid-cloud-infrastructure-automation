[CmdletBinding()]
param(
    [Parameter()]
    [string]$OutputPath = ".\software-inventory.csv"
)

$ErrorActionPreference = "Stop"

# Reads the standard uninstall registry locations; does not modify the server.
$registryPaths = @(
    "HKLM:\Software\Microsoft\Windows\CurrentVersion\Uninstall\*",
    "HKLM:\Software\Wow6432Node\Microsoft\Windows\CurrentVersion\Uninstall\*"
)

$inventory = foreach ($path in $registryPaths) {
    Get-ItemProperty -Path $path -ErrorAction SilentlyContinue |
        Where-Object { $_.DisplayName } |
        Select-Object @{Name="ComputerName";Expression={$env:COMPUTERNAME}},
                      DisplayName, DisplayVersion, Publisher, InstallDate
}

$inventory |
    Sort-Object DisplayName -Unique |
    Export-Csv -Path $OutputPath -NoTypeInformation -Encoding UTF8

Write-Host "Inventory exported to: $OutputPath" -ForegroundColor Green
