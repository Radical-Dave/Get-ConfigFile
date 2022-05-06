#Set-StrictMode -Version Latest
#####################################################
# Get-ConfigFile
#####################################################
<#PSScriptInfo

.VERSION 0.2

.GUID 01002a90-c61d-4475-ad98-7369907e54e3

.AUTHOR David Walker, Sitecore Dave, Radical Dave

.COMPANYNAME David Walker, Sitecore Dave, Radical Dave

.COPYRIGHT David Walker, Sitecore Dave, Radical Dave

.TAGS powershell sitecore package

.LICENSEURI https://github.com/SharedSitecore/Get-ConfigFile/blob/main/LICENSE

.PROJECTURI https://github.com/SharedSitecore/Get-ConfigFile

.ICONURI 

.EXTERNALMODULEDEPENDENCIES 

.REQUIREDSCRIPTS 

.EXTERNALSCRIPTDEPENDENCIES 

.RELEASENOTES
- 0.1 init
- 0.2 cleanup
#>

<# 

.DESCRIPTION 
 PowerShell Script to Get-ConfigFile

.PARAMETER name
Path of package

#> 
#####################################################
# Get-ConfigFile
#####################################################

[CmdletBinding(SupportsShouldProcess)]
Param(
	[Parameter(Mandatory=$true)]
	[string] $name
)
begin {
	$ProgressPreference = "SilentlyContinue"		
	$ErrorActionPreference = 'Stop'
	$PSScriptName = ($MyInvocation.MyCommand.Name.Replace(".ps1",""))
	$PSCallingScript = if ($MyInvocation.PSCommandPath) { $MyInvocation.PSCommandPath | Split-Path -Parent } else { $null }
	Write-Verbose "$PSScriptRoot\$PSScriptName $name called by:$PSCallingScript"
}
process {
	$results = ''
	if (Test-Path "*.$name*")
	{
		if (Test-Path "*.$name.user") { $results = ".$name.user" } 
		elseif (Test-Path ".$name") { $results = ".$name"}
	}
	return $results
}
end {
	Write-Verbose "$PSScriptName $name end"
}