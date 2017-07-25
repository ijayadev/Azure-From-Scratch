Add-AzureRmAccount

# Create RG
New-AzureRmResourceGroup -Name "myResourceGroup" -Location "EastUS"

#Create Subnet's
$mySubnetFrontEnd = New-AzureRmVirtualNetworkSubnetConfig -Name "mySubnetFrontEnd" -AddressPrefix "192.168.1.0/24"
$mySubnetBackEnd = New-AzureRmVirtualNetworkSubnetConfig -Name "mySubnetBackEnd" -AddressPrefix "192.168.2.0/24"

# Create VNet with the subnets
$myVnet = New-AzureRmVirtualNetwork -ResourceGroupName "myResourceGroup" -Location "EastUs" -Name "myVnet" -AddressPrefix "192.168.0.0/16" -Subnet $mySubnetFrontEnd,$mySubnetBackEnd

# Create 2 Nics

$frontEnd = $myVnet.Subnets|?{$_.Name -eq 'mySubnetFrontEnd'}
$myNic1 = New-AzureRmNetworkInterface -ResourceGroupName "myResourceGroup" -Name "myNic1" -Location "EastUs" -SubnetId $frontEnd.Id

$backEnd = $myVnet.Subnets|?{$_.Name -eq 'mySubnetBackEnd'}
$myNic2 = New-AzureRmNetworkInterface -ResourceGroupName "myResourceGroup" -Name "myNic2" -Location "EastUs" -SubnetId $backEnd.Id


# Create VM
$cred = Get-Credential
$vmConfig = New-AzureRmVMConfig -VMName "myVM" -VMSize "Standard_DS3_v2"
$vmConfig = Set-AzureRmVMOperatingSystem -VM $vmConfig -Windows -ComputerName "myVM" -Credential $cred -ProvisionVMAgent -EnableAutoUpdate 

$vmConfig = Set-AzureRmVMSourceImage -VM $vmConfig -PublisherName "MicrosoftWindowsServer" -Offer "WindowsServer" -Skus "2016-Datacenter" -Version "latest"

$vmConfig = Add-AzureRmVMNetworkInterface -VM $vmConfig -Id $myNic1.Id -Primary
$vmConfig = Add-AzureRmVMNetworkInterface -VM $vmConfig -Id $myNic2.Id

New-AzureRmVM -VM $vmConfig -ResourceGroupName "myResourceGroup" -Location "EastUs"