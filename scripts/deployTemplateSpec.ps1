$templateFile = '../modules/webApp.bicep'
$today = Get-Date -Format 'MM-dd-yyyy'
$deploymentName = "webapp-template-spec-$today"
$displayName = 'Web app started park'
$description = 'Web app starter park with App Service plan, App Service and CosmosDB'
$version = '1.0'

New-AzTemplateSpec `
  -Name $deploymentName `
  -Location westus2 `
  -DisplayName $displayName `
  -Description $description `
  -Version $version `
  -TemplateFile $templateFile