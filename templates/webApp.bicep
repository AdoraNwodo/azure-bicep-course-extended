@description('Specifies the location for resources.')
param location string = 'westus2'

// Create app service
resource appServicePlan 'Microsoft.Web/serverfarms@2020-06-01' = {
  name: 'adora-app-plan'
  location: location
  properties: {
    reserved: true
  }
  sku: {
    name: 'S1'
  }
  tags: {
    createdWith: 'azureBicep'
  }
}

// Create storage account
resource storageAccount 'Microsoft.Storage/storageAccounts@2021-01-01' = {
  name: 'adoraappstore'
  location: location
  sku: {
    name: 'Standard_LRS'
  }
  kind: 'StorageV2'
  tags: {
    createdWith: 'azureBicep'
  }
}

// Create web app
resource appService 'Microsoft.Web/sites@2020-06-01' = {
  name: 'adorabicepapp'
  location: location
  identity: {
    type: 'SystemAssigned'
  }
  tags: {
    createdWith: 'azureBicep'
  }
  properties: {
    serverFarmId: appServicePlan.id
    httpsOnly: true
    siteConfig: {
      minTlsVersion: '1.2'
    }
  }
}
