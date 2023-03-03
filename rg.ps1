# Create resource group
New-AzResourceGroup -ResourceGroupName myResourceGroup -Location EastUS

# Clean up resources
Remove-AzResourceGroup -Name myResourceGroup -Force

# Example 3: Remove all resource groups
Get-AzResourceGroup | Remove-AzResourceGroup