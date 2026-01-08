#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Windows 10 Search Repair Tool
============================
Automated utility to fix common Windows 10 search functionality issues.

This tool addresses several common problems:
- Start Menu search not responding
- Unable to type in Start Menu or File Explorer
- Search appearing frozen or unresponsive

Author: @danysers
License: MIT
Version: 1.0.0
"""

import subprocess
import sys
import time
import os

def ejecutar_comando(comando, descripcion):
    """
    Execute a system command and display the result with proper error handling.
    
    Args:
        comando (str): The command to execute (PowerShell or CMD)
        descripcion (str): User-friendly description of what the command does
    
    Returns:
        bool: True if command executed successfully, False otherwise
    """
    print(f"🔧 {descripcion}...")
    try:
        if comando.startswith('Start-Process'):
            # Execute PowerShell commands for Microsoft Store operations
            resultado = subprocess.run([
                'powershell', '-Command', comando
            ], capture_output=True, text=True, timeout=30)
        else:
            # Execute standard CMD commands for process management
            resultado = subprocess.run(comando, shell=True, capture_output=True, text=True, timeout=30)
        
        # Check if command executed successfully
        if resultado.returncode == 0:
            print(f"✅ {descripcion} - Completado exitosamente")
            return True
        else:
            print(f"⚠️  {descripcion} - Advertencia (código: {resultado.returncode})")
            if resultado.stderr:
                print(f"   Error: {resultado.stderr.strip()}")
            return False
    except subprocess.TimeoutExpired:
        # Handle commands that take too long to execute
        print(f"⏱️  {descripcion} - Tiempo agotado")
        return False
    except Exception as e:
        # Handle any unexpected errors during command execution
        print(f"❌ {descripcion} - Error: {str(e)}")
        return False

def main():
    """
    Main function that orchestrates the Windows 10 search repair process.
    
    This function executes a series of commands in sequence to restore
    Windows search functionality. Each command targets a specific component
    of the Windows search system.
    """
    print("=" * 60)
    print("🔍 WINDOWS 10 SEARCH REPAIR TOOL")
    print("=" * 60)
    print("This tool executes proven commands to restore Windows 10")
    print("Start Menu and File Explorer search functionality\n")
    
    # Define the repair command sequence
    # Each command targets a specific aspect of Windows search functionality
    comandos = [
        {
            # Opens Microsoft Store to trigger search component refresh
            'comando': 'Start-Process "ms-windows-store://pdp/?productid=9nblggh4tlx0"',
            'descripcion': 'Opening Microsoft Store to refresh search components'
        },
        {
            # Terminate and restart Text Input Services (ctfmon.exe)
            # This process handles text input and search functionality
            'comando': 'taskkill /f /im ctfmon.exe',
            'descripcion': 'Stopping Text Input Services (ctfmon.exe)'
        },
        {
            # Restart ctfmon.exe to restore text input functionality
            'comando': 'start ctfmon.exe',
            'descripcion': 'Restarting Text Input Services'
        },
        {
            # Force restart Windows Explorer to refresh shell components
            'comando': 'taskkill /f /im explorer.exe',
            'descripcion': 'Restarting Windows Explorer'
        },
        {
            # Start Explorer again to restore desktop and taskbar functionality
            'comando': 'start explorer.exe',
            'descripcion': 'Starting Windows Explorer'
        }
    ]
    
    # Execute the repair sequence
    print("🚀 Starting Windows 10 search repair sequence...\n")
    exitos = 0
    
    for cmd in comandos:
        if ejecutar_comando(cmd['comando'], cmd['descripcion']):
            exitos += 1
        # Brief pause between commands to allow system processes to stabilize
        time.sleep(1)
    
    # Display repair results summary
    print(f"\n📊 REPAIR SUMMARY:")
    print(f"   ✅ Successful commands: {exitos}/{len(comandos)}")
    
    # Determine repair success based on command execution rate
    if exitos >= 3:  # If at least 3 out of 5 commands succeeded
        print("\n🎉 REPAIR PROCESS COMPLETED!")
        print("   Windows search should now be functional.")
        print("   If issues persist, please restart your computer.")
    else:
        print("\n⚠️  REPAIR PROCESS INCOMPLETE")
        print("   Some commands failed to execute. Please try:")
        print("   1. Run this tool as Administrator")
        print("   2. Restart your computer")
        print("   3. Execute commands manually if needed")
    
    print("\n📝 COMMANDS EXECUTED:")
    for cmd in comandos:
        print(f"   • {cmd['comando']}")
    
    # Wait for user input before closing console
    print(f"\nPress Enter to close this window...")
    input()

if __name__ == "__main__":
    """
    Entry point for the Windows 10 Search Repair Tool.
    
    Handles graceful shutdown on user interruption and provides
    error information for unexpected exceptions.
    """
    try:
        main()
    except KeyboardInterrupt:
        print("\n\n🛑 Repair process cancelled by user")
        print("Press Enter to close...")
        input()
    except Exception as e:
        print(f"\n\n❌ Unexpected error occurred: {str(e)}")
        print("Press Enter to close...")
        input()