$virtualNetwork1 = myVirtualNetwork1
$virtualNetwork2 = myVirtualNetwork2
Add-AzVirtualNetworkPeering `
  -Name myVirtualNetwork1-myVirtualNetwork2 `
  -VirtualNetwork $virtualNetwork1 `
  -RemoteVirtualNetworkId $virtualNetwork2.Id

Add-AzVirtualNetworkPeering `
  -Name myVirtualNetwork2-myVirtualNetwork1 `
  -VirtualNetwork $virtualNetwork2 `
  -RemoteVirtualNetworkId $virtualNetwork1.Id

Get-AzVirtualNetworkPeering `
  -ResourceGroupName myResourceGroup `
  -VirtualNetworkName myVirtualNetwork1 `
  | Select PeeringState

# Remove Vnet peer
  Remove-AzVirtualNetworkPeering 
  -VirtualNetworkName $virtualNetwork1 
  -Name myVirtualNetwork1-myVirtualNetwork2 
  -ResourceGroupName resoucegroup 
  -Force