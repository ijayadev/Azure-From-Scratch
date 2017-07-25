Add-AzureRmAccount

New-AzureRmResourceGroup -Name TestRG -Location centralus
New-AzureRmVirtualNetwork -ResourceGroupName TestRG -Name TestVNet -AddressPrefix 192.168.0.0/16 -Location centralus
$vnet = Get-AzureRmVirtualNetwork -ResourceGroupName TestRG -Name TestVNet
Add-AzureRmVirtualNetworkSubnetConfig -Name FrontEnd -VirtualNetwork $vnet -AddressPrefix 192.168.1.0/24
Add-AzureRmVirtualNetworkSubnetConfig -Name BackEnd -VirtualNetwork $vnet -AddressPrefix 192.168.2.0/24