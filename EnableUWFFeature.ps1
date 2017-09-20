<#	
	===========================================================================
	 Created on:   	9/5/2017 1:47 PM
	 Created by:   	Ray Dennis
	 Filename:     	EnableUWFFeature.ps1
	 Purpose:		This script will install the windows unified write filter feature
	-------------------------------------------------------------------------
	===========================================================================
#>



# Import-Module C:\Users\raditsvc\OneDrive\PowerShell\SCCM\Logging\SCCM-Logging\CMInstallerLogging.psm1

Start-Log

if(Get-WindowsOptionalFeature -online -FeatureName Client-UnifiedWriteFilter | Select -ExpandProperty State)
{
    # Write-Log -Message "Feature has already been enabled"
}
else
{
    # Write-Log -Message "Enabling Feature"
    Dism /online /Enable-Feature /FeatureName:Client-UnifiedWriteFilter /all /quiet
}