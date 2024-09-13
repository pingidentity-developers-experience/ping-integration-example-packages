##########################################################################
# davinci.tf - Declarations to create DaVinci assets
# {@link https://registry.terraform.io/providers/pingidentity/davinci/latest}
##########################################################################

#########################################################################
# PingOne DaVinci - Create and deploy a flow
#########################################################################
# {@link https://registry.terraform.io/providers/pingidentity/davinci/latest/docs/resources/flow}

// Flow Name: PingOne DaVinci API Protect Example
resource "davinci_flow" "pingone_davinci_api_protect_example" {

  environment_id = pingone_environment.my_environment.id

  name        = "PingOne DaVinci API Protect Example"
  description = "Imported on Tue May 16 2023 19:35:07 GMT+0000 (Coordinated Universal Time)"

  flow_json = file("./davinci-api-protect-reg-authn-flow.json")


  // Connector link: httpConnector
  connection_link {
    id                           = davinci_connection.httpconnector__867ed4363b2bc21c860085ad2baa817d.id
    name                         = davinci_connection.httpconnector__867ed4363b2bc21c860085ad2baa817d.name
    replace_import_connection_id = "867ed4363b2bc21c860085ad2baa817d"
  }

  // Connector link: pingOneRiskConnector
  connection_link {
    id                           = davinci_connection.pingoneriskconnector__292873d5ceea806d81373ed0341b5c88.id
    name                         = davinci_connection.pingoneriskconnector__292873d5ceea806d81373ed0341b5c88.name
    replace_import_connection_id = "292873d5ceea806d81373ed0341b5c88"
  }

  // Connector link: pingOneSSOConnector
  connection_link {
    id                           = davinci_connection.pingonessoconnector__94141bf2f1b9b59a5f5365ff135e02bb.id
    name                         = davinci_connection.pingonessoconnector__94141bf2f1b9b59a5f5365ff135e02bb.name
    replace_import_connection_id = "94141bf2f1b9b59a5f5365ff135e02bb"
  }

  // Connector link: variablesConnector
  connection_link {
    id                           = davinci_connection.variablesconnector__06922a684039827499bdbdd97f49827b.id
    name                         = davinci_connection.variablesconnector__06922a684039827499bdbdd97f49827b.name
    replace_import_connection_id = "06922a684039827499bdbdd97f49827b"
  }
}

#########################################################################
# PingOne DaVinci - Create an application and flow policy for the flow above
#########################################################################
# {@link https://registry.terraform.io/providers/pingidentity/davinci/latest/docs/resources/application}

resource "davinci_application" "registration_flow_app" {
  name           = "DaVinci API Protect Sample Application"
  environment_id = pingone_environment.my_environment.id
  
  oauth {
    enabled = true
    values {
      allowed_grants                = ["authorizationCode"]
      allowed_scopes                = ["openid", "profile"]
      enabled                       = true
      enforce_signed_request_openid = false
      redirect_uris                 = ["${module.pingone_utils.pingone_url_auth_path_full}/rp/callback/openid_connect"]
    }
  }
}

resource "davinci_application_flow_policy" "registration_flow_app_policy" {
  environment_id = pingone_environment.my_environment.id
  application_id = davinci_application.registration_flow_app.id
  name           = "DaVinci API Protect Sample Policy"
  status         = "enabled"
  policy_flow {
    flow_id    = davinci_flow.pingone_davinci_api_protect_example.id
    version_id = -1
    weight     = 100
  }
}

// Flow Name: PingOne DaVinci API Protect Example
resource "davinci_connection" "httpconnector__867ed4363b2bc21c860085ad2baa817d" {
  environment_id = pingone_environment.my_environment.id

  connector_id = "httpConnector"
  name         = "Http"
}

// Flow Name: PingOne DaVinci API Protect Example
resource "davinci_connection" "pingoneriskconnector__292873d5ceea806d81373ed0341b5c88" {
  environment_id = pingone_environment.my_environment.id

  connector_id = "pingOneRiskConnector"
  name         = "PingOne Protect"

  property {
    name  = "clientId"
    type  = "string"
    value = pingone_application.worker_app.oidc_options.client_id
  }

  property {
    name  = "clientSecret"
    type  = "string"
    value = pingone_application_secret.worker_app_secret.secret
  }

  property {
    name  = "envId"
    type  = "string"
    value = pingone_environment.my_environment.id
  }
  
  property {
    name  = "region"
    type  = "string"
    value = var.region_code
  }
}

// Flow Name: PingOne DaVinci API Protect Example
resource "davinci_connection" "pingonessoconnector__94141bf2f1b9b59a5f5365ff135e02bb" {
  environment_id = pingone_environment.my_environment.id

  connector_id = "pingOneSSOConnector"
  name         = "PingOne"

  property {
    name  = "clientId"
    type  = "string"
    value = pingone_application.worker_app.oidc_options.client_id
  }

  property {
    name  = "clientSecret"
    type  = "string"
    value = pingone_application_secret.worker_app_secret.secret
  }

  property {
    name  = "envId"
    type  = "string"
    value = pingone_environment.my_environment.id
  }

  property {
    name  = "region"
    type  = "string"
    value = var.region_code
  }
}

// Flow Name: PingOne DaVinci API Protect Example
resource "davinci_connection" "variablesconnector__06922a684039827499bdbdd97f49827b" {
  environment_id = pingone_environment.my_environment.id

  connector_id = "variablesConnector"
  name         = "Variables"
}