<#	
	===========================================================================
	 Created on:   	9/5/2017 1:47 PM
	 Created by:   	Ray Dennis
	 Filename:     	EnableUnifiedWriteFiltering.ps1
	 Purpose:		This script will enable unified write filtering and reboot the machine
	-------------------------------------------------------------------------
	===========================================================================
#>



if((Get-WindowsOptionalFeature -online -FeatureName Client-UnifiedWriteFilter | Select -ExpandProperty State) -eq 'Enabled')
{
    uwfmgr.exe filter enable
    uwfmgr.exe volume protect C:
    $results = uwfmgr.exe Get-Config
    #Write-Log -Message $results
    shutdown /r /t 0
}
else
{
   # Write-Log -Message "Unified Write Filtering has not been enabled in windows features" -errorlevel 3
   # Write-Log -Message "Run 'Dism /online /Enable-Feature /FeatureName:Client-UnifiedWriteFilter', reboot, then rerun this script" -errorlevel 3
}