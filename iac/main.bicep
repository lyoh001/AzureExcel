targetScope = 'subscription'
@secure()
param token string
@secure()
param password string

resource rg 'Microsoft.Resources/resourceGroups@2021-04-01' = {
  name: '${deployment().name}rg'
  location: deployment().location
}

module logicapps 'logicapps.bicep' = {
  name: 'logicapps'
  scope: rg
}

module webapp 'webapp.bicep' = {
  name: 'webapp'
  scope: rg
}
