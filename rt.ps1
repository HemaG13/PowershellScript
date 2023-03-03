# Creation of Route table
$Route = New-AzRouteConfig 
-Name "Route07" 
-AddressPrefix 10.1.0.0/16 
-NextHopType "VnetLocal"


New-AzRouteTable 
-Name "RouteTable01" 
-ResourceGroupName "ResourceGroup11" 
-Location "EASTUS" 
-Route $Route

# Update route method
Get-AzRouteTable `
  -ResourceGroupName "myResourceGroup" `
  -Name "myRouteTablePublic" `
  | Add-AzRouteConfig `
  -Name "ToPrivateSubnet" `
  -AddressPrefix 10.0.1.0/24 `
  -NextHopType "VirtualAppliance" `
  -NextHopIpAddress 10.0.2.4 `
 | Set-AzRouteTable

# Get Route details
Get-AzRouteTable 
-ResourceGroupName "ResourceGroup11" 
-Name "RouteTable01"


# Remove a route table
Remove-AzRouteTable 
-ResourceGroupName "ResourceGroup11" 
-Name "RouteTable01"