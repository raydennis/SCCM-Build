<#	
	===========================================================================
	 Created on:   	9/5/2017 1:47 PM
	 Created by:   	Ray Dennis
	 Filename:     	DisableUnifiedWriteFiltering.ps1
	 Purpose:		This script will disable unified write filtering and reboot the machine
	-------------------------------------------------------------------------
	===========================================================================
#>


#Import-Module CMInstallerLogging.psm1


#Start-Log

if(Get-WindowsOptionalFeature -online -FeatureName Client-UnifiedWriteFilter | Select -ExpandProperty State)
{
    uwfmgr.exe filter disable
    shutdown /r /t 0
}