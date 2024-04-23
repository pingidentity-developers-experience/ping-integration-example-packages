##########################################################################
# davinci.tf - Declarations to create DaVinci assets
# {@link https://registry.terraform.io/providers/pingidentity/davinci/latest}
##########################################################################

#########################################################################
# PingOne DaVinci - Read all connections
#########################################################################
# {@link https://registry.terraform.io/providers/pingidentity/davinci/latest/docs/data-sources/connections}

resource "time_sleep" "davinci" {
  create_duration = "240s"
  depends_on      = [pingone_environment.my_environment]
}

data "davinci_connections" "read_all" {
  environment_id = pingone_environment.my_environment.id
  depends_on     = [ time_sleep.davinci ]
}

resource "davinci_connection" "pingone_protect" {
  connector_id   = "pingOneRiskConnector"
  environment_id = pingone_environment.my_environment.id
  name           = "PingOne Protect"

  property {
    name  = "envId"
    value = pingone_environment.my_environment.id
  }
  property {
    name  = "clientId"
    value = pingone_application.worker_app.id
  }
  property {
    name  = "clientSecret"
    value = pingone_application.worker_app.oidc_options[0].client_secret
  }

  depends_on = [
    data.davinci_connections.read_all
  ]
}

#########################################################################
# PingOne DaVinci - Create and deploy a flow
#########################################################################
# {@link https://registry.terraform.io/providers/pingidentity/davinci/latest/docs/resources/flow}

resource "davinci_flow" "registration_flow" {
  depends_on = [
    data.davinci_connections.read_all
  ]

  flow_json = file("davinci-api-protect-reg-authn-flow.json")
  deploy    = true

  environment_id = pingone_environment.my_environment.id

  connection_link {
    id   = element([for s in data.davinci_connections.read_all.connections : s.id if s.name == "Http"], 0)
    name = "Http"
  }

  connection_link {
    id   = data.davinci_connection.ping_sso.id
    name = "PingOne"
  }

  connection_link {
    id   = davinci_connection.pingone_protect.id
    name = "PingOne Protect"
  }

  connection_link {
    id   = data.davinci_connection.variables.id
    name = "Variables"
  }
}

#########################################################################
# PingOne DaVinci - Create an application and flow policy for the flow above
#########################################################################
# {@link https://registry.terraform.io/providers/pingidentity/davinci/latest/docs/resources/application}

resource "davinci_application" "registration_flow_app" {
  name           = "DaVinci API Protect Sample Application"
  environment_id = pingone_environment.my_environment.id
  depends_on     = [data.davinci_connections.read_all]
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
  saml {
    values {
      enabled                = false
      enforce_signed_request = false
    }
  }
}

resource "davinci_application_flow_policy" "registration_flow_app_policy" {
  environment_id = pingone_environment.my_environment.id
  application_id = davinci_application.registration_flow_app.id
  name           = "DaVinci API Protect Sample Policy"
  status         = "enabled"
  policy_flow {
    flow_id    = davinci_flow.registration_flow.id
    version_id = -1
    weight     = 100
  }
}
