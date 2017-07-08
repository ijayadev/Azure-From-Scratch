
Login-AzureRmAccount

// Create Resource Group
New-AzureRmResourceGroup -Name "TheAzureGuyRG" -Location "Central India"

New-AzureRmResourceGroupDeployment -Name ExampleDeployment -ResourceGroupName TheAzureGuyRG
  -TemplateFile c:\MyTemplates\storage.json -storageAccountType Standard_GRS