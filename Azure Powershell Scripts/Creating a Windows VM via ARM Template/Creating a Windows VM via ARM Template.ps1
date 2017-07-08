// Available Locations
Get-AzureRmLocation | sort DisplayName | Select DisplayName

// Create Resource Group
New-AzureRmResourceGroup -Name "TheAzureGuyRG" -Location "Central India"

// DNS Name should Alpha numeric and lower case
New-AzureRmResourceGroupDeployment -ResourceGroupName "TheAzureGuyRG" -TemplateUri "https://raw.githubusercontent.com/Azure/azure-quickstart-templates/master/101-vm-simple-windows/azuredeploy.json"