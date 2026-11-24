[CmdletBinding()]
param(
    [Parameter()]
    [string]$OutputPath = ".\server-health-report.txt"
)

$ErrorActionPreference = "Stop"

try {
    $os = Get-CimInstance -ClassName Win32_OperatingSystem
    $computer = Get-CimInstance -ClassName Win32_ComputerSystem
    $cpu = Get-CimInstance -ClassName Win32_Processor |
        Measure-Object -Property LoadPercentage -Average
    $disks = Get-CimInstance -ClassName Win32_LogicalDisk -Filter "DriveType=3"
    $services = Get-Service -Name "WinRM", "W32Time", "Dnscache" -ErrorAction SilentlyContinue

    $lastBoot = $os.LastBootUpTime
    $uptime = (Get-Date) - $lastBoot
    $totalMemoryGB = [math]::Round($computer.TotalPhysicalMemory / 1GB, 2)
    $freeMemoryGB = [math]::Round(($os.FreePhysicalMemory * 1KB) / 1GB, 2)

    $lines = @(
        "SERVER HEALTH REPORT"
        "Generated: $(Get-Date -Format 'yyyy-MM-dd HH:mm:ss')"
        "Computer: $($computer.Name)"
        "Domain: $($computer.Domain)"
        "OS: $($os.Caption) - Build $($os.BuildNumber)"
        "Last boot: $lastBoot"
        "Uptime: $($uptime.Days) days, $($uptime.Hours) hours"
        "CPU average load snapshot: $([math]::Round($cpu.Average, 1))%"
        "Memory: $freeMemoryGB GB free / $totalMemoryGB GB total"
        ""
        "FIXED DISKS"
    )

    foreach ($disk in $disks) {
        $sizeGB = [math]::Round($disk.Size / 1GB, 2)
        $freeGB = [math]::Round($disk.FreeSpace / 1GB, 2)
        $freePct = if ($disk.Size -gt 0) {
            [math]::Round(($disk.FreeSpace / $disk.Size) * 100, 1)
        } else { 0 }
        $lines += "$($disk.DeviceID)  Free: $freeGB GB / $sizeGB GB ($freePct%)"
    }

    $lines += ""
    $lines += "SELECTED SERVICES"
    foreach ($service in $services) {
        $lines += "$($service.Name): $($service.Status)"
    }

    $lines | Set-Content -Path $OutputPath -Encoding UTF8
    Write-Host "Health report saved to: $OutputPath" -ForegroundColor Green
}
catch {
    Write-Error "Health report failed: $($_.Exception.Message)"
    exit 1
}
