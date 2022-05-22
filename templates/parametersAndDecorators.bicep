@description('Specifies the location for resources.')
param location string = 'westus2'

@description('Specifies the name for the app service plan.')
param appServicePlanName string = 'adora-app-plan'

@description('Specifies the sku for the app service plan.')
param appServiceSkuName string = 'S1'

@description('Specifies the properties for the app service plan.')
param appServicePlanProperties object = {
  reserved: true
}

@description('Tags for our resources')
param tags object = {
  createdWith: 'azureBicep'
}

@minLength(5)
@maxLength(24)
@description('Specifies the name for the storage account.')
param storageAccountName string = 'adoraappstore'

@description('Specifies the sku name for the storage account.')
param storageAccountSkuName string = 'Standard_LRS'

@description('Specifies the storage account kind.')
param storageAccountKind string = 'StorageV2'

@description('Specifies the name of the web app.')
param webAppName string = 'adorabicepapp'

@description('Specifies the identity of the web app.')
param webAppIdentity string = 'SystemAssigned'

// Create app service
resource appServicePlan 'Microsoft.Web/serverfarms@2020-06-01' = {
  name: appServicePlanName
  location: location
  properties: appServicePlanProperties
  sku: {
    name: appServiceSkuName
  }
  tags: tags
}

// Create storage account
resource storageAccount 'Microsoft.Storage/storageAccounts@2021-01-01' = {
  name: storageAccountName
  location: location
  sku: {
    name: storageAccountSkuName
  }
  kind: storageAccountKind
  tags: tags
}

// Create web app
resource appService 'Microsoft.Web/sites@2020-06-01' = {
  name: webAppName
  location: location
  identity: {
    type: webAppIdentity
  }
  tags: tags
  properties: {
    serverFarmId: appServicePlan.id
    httpsOnly: true
    siteConfig: {
      minTlsVersion: '1.2'
    }
  }
}
