@description('Specifies the location for resources.')
param location string = 'westus'

resource storageAccount 'Microsoft.Storage/storageAccounts@2021-01-01' = {
  name: 'adorastore'
  location: location
  tags: {
    createdWith: 'azureBicep'
  }
  sku: {
    name: 'Standard_LRS'
  }
  kind: 'StorageV2'
}

resource symbolicname 'Microsoft.Cdn/profiles@2021-06-01' = {
  name: 'adoracdn'
  location: location
  tags: {
    createdWith: 'azureBicep'
  }
  sku: {
    name: 'Standard_Microsoft'
  }
  properties: {
    originResponseTimeoutSeconds: 50
  }
}
