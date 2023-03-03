#  Create a new network security group
New-AzNetworkSecurityGroup 
-Name "nsg1" 
-ResourceGroupName "rg1"  
-Location  "westus"

# Nsg Rules 

# Step:1 Create a security rule allowing access from the Internet to port 3389.
# Step:2 Create a security rule allowing access from the Internet to port 80.
# Step:3 Add the rules created above to a new NSG named NSG-FrontEnd.

$rule1 = New-AzNetworkSecurityRuleConfig 
-Name rdp
-rule 
-Description "Allow RDP" `
-Access Allow 
-Protocol Tcp 
-Direction Inbound 
-Priority 100 
-SourceAddressPrefix Internet 
-SourcePortRange * 
-DestinationAddressPrefix * 
-DestinationPortRange 3389

$rule2 = New-AzNetworkSecurityRuleConfig 
    -Name web-rule 
    -Description "Allow HTTP" `
    -Access Allow 
    -Protocol Tcp 
    -Direction Inbound 
    -Priority 101 
    -SourceAddressPrefix Internet 
    -SourcePortRange * 
    -DestinationAddressPrefix * 
    -DestinationPortRange 80

$nsg = New-AzNetworkSecurityGroup 
-ResourceGroupName TestRG 
-Location westus 
-Name "NSG-FrontEnd" 
-SecurityRules $rule1,$rule2

# Remove NSG
Remove-AzNetworkSecurityGroup 
-Name dfgfd 
-ResourceGroupName dfgfdgf 
-Force
