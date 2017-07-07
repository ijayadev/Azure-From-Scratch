Get-Module -ListAvailable -Name AzureRm.Resources | Select Version

Login-AzureRmAccount

Get-AzureRmSubscription

Set-AzureRmContext -SubscriptionName "Visual Studio Dev Essentials"

// Gives out the Detailed Usages or actions or resources consumed in Your Azure Account
Get-UsageAggregates -ReportedStartTime "5/7/2017" -ReportedEndTime "7/7/2017"




Get-ModuleList