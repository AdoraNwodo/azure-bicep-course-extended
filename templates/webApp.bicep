param location string = 'westus2'
param resourceBaseName string = 'adora-bicep'
param storageAccountName string = 'adorabicepstore'

module storageAccountTemplateSpec 'ts:xxxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxxx/rg/templateName:1.0' = {
  name: 'webAppTemplateSpec'
  params: {
    appServiceAppName: '${resourceBaseName}-app'
    appServicePlanName: '${resourceBaseName}-plan'
    appServicePlanSkuName: 'S1'
    identityType: 'SystemAssigned'
    minTlsVersion: '1.2'
    location: location
    storageAccountKind: 'StorageV2'
    storageAccountName: storageAccountName
    storageAccountSkuName: 'Standard_LRS'
  }
}
