#powershell.exe


# Written by: Aaron Wurthmann
#
# You the executor, runner, user accept all liability.
# This code comes with ABSOLUTELY NO WARRANTY.
# You may redistribute copies of the code under the terms of the GPL v3.
#
# --------------------------------------------------------------------------------------------
# Name: Scan-Hardware.ps1
# Version: 2021.05.22.150101
# Description: Scans system for hardware changes
# 
# Instructions: Run from use account that has Admin permissions 
#				Does not need to be run from an Admin shell.
#
# Tested with: Microsoft Windows [Version 10.0.19042.804], PowerShell [Version 5.1.19041.610]
#
# Arguments: None
#
# Output: None
#
# Notes:  
# --------------------------------------------------------------------------------------------

##Admin Check##
if (-NOT ([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] "Administrator"))  {  
  $arguments = "& '" +$myinvocation.mycommand.definition + "'"
  Start-Process powershell -Verb runAs -ArgumentList $arguments
  Break
}
##End Admin Check##

##Main##
pnputil.exe /scan-devices
##End Main##