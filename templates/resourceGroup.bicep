param resourceGroupName string = 'test-resource-group'
param location string = 'westus'

targetScope='subscription'

// Create resource group
resource myResourceGroup 'Microsoft.Resources/resourceGroups@2021-01-01' = {
  name: resourceGroupName
  location: location
  tags: {
    createdWith: 'azureBicep'
  }
}
