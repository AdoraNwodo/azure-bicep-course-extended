$templateFile = '../templates/subscription-scoped.bicep'
$today = Get-Date -Format 'MM-dd-yyyy'
$deploymentName = "adora-sub-scoped-$today"

New-AzSubscriptionDeployment `
  -Name $deploymentName `
  -Location westus `
  -TemplateFile $templateFile