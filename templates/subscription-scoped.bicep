targetScope = 'subscription'

@description('Specifies the location for the resource group.')
param location string = 'westus'

@description('Specifies the name of the resource group.')
param name string = 'adora-rg-bicep'

resource resourceGroup 'Microsoft.Resources/resourceGroups@2021-01-01' = {
  name: name
  location: location
}
