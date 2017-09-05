<#	
	===========================================================================
	 Created on:   	9/5/2017 1:47 PM
	 Created by:   	Ray Dennis
	 Filename:     	EnableUWF.ps1
	 Purpose:		This script will enable unified write filtering and reboot the machine
	-------------------------------------------------------------------------
	 Script Name: Download Latest Java
	===========================================================================
#>

#region DownloadLatestJava
<#
.SYNOPSIS
	This function returns true if any version of java is istalled

.EXAMPLE
	PS C:\> Get-Java

.NOTES

#>
#region Function CheckHistory
<#
.SYNOPSIS
	Function to check script history

.EXAMPLE
	PS C:\> CheckHistory $fileurl

.NOTES

#>

Import-Module $PSScriptRoot..\..\..\Logging\SCCM-Logging\CMInstallerLogging.psm1

Start-Log

if(Get-WindowsOptionalFeature -online -FeatureName Client-UnifiedWriteFilter | Select -ExpandProperty State)
{
    uwfmgr.exe filter enable
    uwfmgr.exe volume protect C:
    $results = uwfmgr.exe Get-Config
    Write-Log -Message $results


}
else
{
    Write-Log -Message "Unified Write Filtering has not been enabled in windows features" -errorlevel 3
    Write-Log -Message "Run 'Dism /online /Enable-Feature /FeatureName:Client-UnifiedWriteFilter', reboot, then rerun this script" -errorlevel 3
}