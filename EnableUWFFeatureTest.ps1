<#	
	===========================================================================
	 Created on:   	9/5/2017 1:47 PM
	 Created by:   	Ray Dennis
	 Filename:     	EnableUWFFeature.ps1
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


if(Get-WindowsOptionalFeature -online -FeatureName Client-UnifiedWriteFilter | Select -ExpandProperty State)
{
    Add-Content C:\Windows\Temp\test.txt "Feature has already been enabled"
}
else
{
    Add-Content C:\Windows\Temp\test.txt "Enabling Feature"
    Dism /online /Enable-Feature /FeatureName:Client-UnifiedWriteFilter /all /quiet
}