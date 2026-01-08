# Windows 10 Search Repair Tool - PowerShell Edition
# ====================================================
# 
# Alternative PowerShell implementation of the search repair tool
# for users who prefer native PowerShell over Python.
#
# Author: @danysers
# Version: 1.0.0
# License: MIT
# ====================================================

param(
    [switch]$Silent = $false,
    [switch]$NoPrompt = $false
)

# Set execution policy for current session if needed
Set-ExecutionPolicy -ExecutionPolicy Bypass -Scope Process -Force

# Function to display formatted messages
function Write-FormattedMessage {
    param(
        [string]$Message,
        [string]$Type = "Info"
    )
    
    $timestamp = Get-Date -Format "HH:mm:ss"
    
    switch ($Type) {
        "Success" { 
            Write-Host "[$timestamp] ✅ $Message" -ForegroundColor Green
        }
        "Warning" { 
            Write-Host "[$timestamp] ⚠️  $Message" -ForegroundColor Yellow
        }
        "Error" { 
            Write-Host "[$timestamp] ❌ $Message" -ForegroundColor Red
        }
        "Progress" { 
            Write-Host "[$timestamp] 🔧 $Message" -ForegroundColor Cyan
        }
        default { 
            Write-Host "[$timestamp] ℹ️  $Message" -ForegroundColor White
        }
    }
}

# Function to execute repair commands with error handling
function Invoke-RepairCommand {
    param(
        [string]$Command,
        [string]$Description,
        [scriptblock]$ScriptBlock
    )
    
    Write-FormattedMessage -Message $Description -Type "Progress"
    
    try {
        if ($ScriptBlock) {
            & $ScriptBlock
        } else {
            Invoke-Expression $Command
        }
        
        Write-FormattedMessage -Message "$Description - Completed successfully" -Type "Success"
        return $true
    }
    catch {
        Write-FormattedMessage -Message "$Description - Warning: $($_.Exception.Message)" -Type "Warning"
        return $false
    }
}

# Main repair function
function Start-WindowsSearchRepair {
    if (-not $Silent) {
        Clear-Host
        Write-Host "=" * 60
        Write-Host "🔍 WINDOWS 10 SEARCH REPAIR TOOL - PowerShell Edition"
        Write-Host "=" * 60
        Write-Host "This tool will execute proven commands to restore Windows 10"
        Write-Host "Start Menu and File Explorer search functionality"
        Write-Host ""
        
        if (-not $NoPrompt) {
            $continue = Read-Host "Do you want to continue? (Y/N)"
            if ($continue -notmatch '^[Yy]') {
                Write-FormattedMessage -Message "Operation cancelled by user" -Type "Warning"
                return
            }
        }
    }
    
    Write-FormattedMessage -Message "Starting Windows 10 search repair sequence..." -Type "Info"
    Write-Host ""
    
    $successCount = 0
    $totalCommands = 5
    
    # Command 1: Open Microsoft Store to refresh search components
    $success1 = Invoke-RepairCommand -Description "Opening Microsoft Store to refresh search components" -ScriptBlock {
        Start-Process "ms-windows-store://pdp/?productid=9nblggh4tlx0" -ErrorAction Stop
        Start-Sleep -Seconds 2
    }
    if ($success1) { $successCount++ }
    
    Start-Sleep -Seconds 1
    
    # Command 2: Stop Text Input Services (ctfmon.exe)
    $success2 = Invoke-RepairCommand -Description "Stopping Text Input Services (ctfmon.exe)" -ScriptBlock {
        $processes = Get-Process -Name "ctfmon" -ErrorAction SilentlyContinue
        if ($processes) {
            $processes | Stop-Process -Force -ErrorAction Stop
            Write-FormattedMessage -Message "Text Input Services stopped" -Type "Info"
        } else {
            Write-FormattedMessage -Message "Text Input Services not running" -Type "Info"
        }
    }
    if ($success2) { $successCount++ }
    
    Start-Sleep -Seconds 1
    
    # Command 3: Restart Text Input Services
    $success3 = Invoke-RepairCommand -Description "Restarting Text Input Services" -ScriptBlock {
        Start-Process "ctfmon.exe" -ErrorAction Stop
        Start-Sleep -Seconds 1
    }
    if ($success3) { $successCount++ }
    
    Start-Sleep -Seconds 1
    
    # Command 4: Restart Windows Explorer (this will temporarily hide desktop)
    $success4 = Invoke-RepairCommand -Description "Restarting Windows Explorer" -ScriptBlock {
        Write-FormattedMessage -Message "Desktop will disappear temporarily - this is normal" -Type "Info"
        $explorerProcesses = Get-Process -Name "explorer" -ErrorAction SilentlyContinue
        if ($explorerProcesses) {
            $explorerProcesses | Stop-Process -Force -ErrorAction Stop
            Start-Sleep -Seconds 2
        }
    }
    if ($success4) { $successCount++ }
    
    Start-Sleep -Seconds 1
    
    # Command 5: Start Windows Explorer
    $success5 = Invoke-RepairCommand -Description "Starting Windows Explorer" -ScriptBlock {
        Start-Process "explorer.exe" -ErrorAction Stop
        Start-Sleep -Seconds 2
    }
    if ($success5) { $successCount++ }
    
    # Display repair summary
    Write-Host ""
    Write-Host "📊 REPAIR SUMMARY:"
    Write-Host "   ✅ Successful commands: $successCount/$totalCommands"
    Write-Host ""
    
    if ($successCount -ge 3) {
        Write-FormattedMessage -Message "REPAIR PROCESS COMPLETED!" -Type "Success"
        Write-Host "   Windows search should now be functional."
        Write-Host "   If issues persist, please restart your computer."
    } else {
        Write-FormattedMessage -Message "REPAIR PROCESS INCOMPLETE" -Type "Warning"
        Write-Host "   Some commands failed to execute. Please try:"
        Write-Host "   1. Run PowerShell as Administrator"
        Write-Host "   2. Restart your computer"
        Write-Host "   3. Check Windows Updates"
    }
    
    # Display executed commands summary
    Write-Host ""
    Write-Host "📝 COMMANDS EXECUTED:"
    Write-Host "   • Start-Process 'ms-windows-store://pdp/?productid=9nblggh4tlx0'"
    Write-Host "   • Stop-Process -Name 'ctfmon' -Force"
    Write-Host "   • Start-Process 'ctfmon.exe'"
    Write-Host "   • Stop-Process -Name 'explorer' -Force"
    Write-Host "   • Start-Process 'explorer.exe'"
    
    if (-not $Silent -and -not $NoPrompt) {
        Write-Host ""
        Read-Host "Press Enter to close this window"
    }
}

# Script entry point
try {
    # Check if running on Windows
    if ($PSVersionTable.PSVersion.Major -lt 5 -or -not $IsWindows -and $PSVersionTable.PSVersion.Major -ge 6) {
        Write-FormattedMessage -Message "This script requires Windows PowerShell 5.1 or PowerShell 6+ on Windows" -Type "Error"
        exit 1
    }
    
    # Check Windows version (Windows 10 or later)
    $osVersion = [System.Environment]::OSVersion.Version
    if ($osVersion.Major -lt 10) {
        Write-FormattedMessage -Message "This script is designed for Windows 10 or later" -Type "Warning"
    }
    
    # Start the repair process
    Start-WindowsSearchRepair
}
catch {
    Write-FormattedMessage -Message "Unexpected error occurred: $($_.Exception.Message)" -Type "Error"
    if (-not $Silent) {
        Read-Host "Press Enter to close"
    }
    exit 1
}
finally {
    # Restore execution policy (optional, as we only changed it for current session)
    # Set-ExecutionPolicy -ExecutionPolicy Restricted -Scope Process -Force
}