##########################################################################
# davinci.tf - Declarations to create DaVinci assets
# {@link https://registry.terraform.io/providers/pingidentity/davinci/latest}
##########################################################################

#########################################################################
# PingOne DaVinci - Read all connections
#########################################################################
# {@link https://registry.terraform.io/providers/pingidentity/davinci/latest/docs/data-sources/connections}


resource "time_sleep" "davinci" {
  create_duration = "90s"
  depends_on      = [ pingone_environment.my_environment ]
}

data "davinci_connections" "read_all" {
  environment_id = pingone_environment.my_environment.id
  depends_on     = [ time_sleep.davinci ]
}

#########################################################################
# PingOne DaVinci - Create and deploy a flow
#########################################################################
# {@link https://registry.terraform.io/providers/pingidentity/davinci/latest/docs/resources/flow}

resource "davinci_flow" "registration_flow" {
  depends_on = [
    data.davinci_connections.read_all
  ]

  flow_json = file("davinci-api-reg-authn-flow.json")

  environment_id = pingone_environment.my_environment.id

  connection_link {
    id   = data.davinci_connection.http_connector.id
    name = "Http"
  }

  connection_link {
    id   = data.davinci_connection.ping_sso.id
    name = "PingOne"
  }
}

#########################################################################
# PingOne DaVinci - Create an application and flow policy for the flow above
#########################################################################
# {@link https://registry.terraform.io/providers/pingidentity/davinci/latest/docs/resources/application}

resource "davinci_application" "registration_flow_app" {
  name           = "DaVinci API Registration Sample Application"
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
}

resource "davinci_application_flow_policy" "registration_flow_app_policy" {
  environment_id = pingone_environment.my_environment.id
  application_id = davinci_application.registration_flow_app.id
  name           = "DaVinci API Registration Sample Policy"
  status         = "enabled"
  policy_flow {
    flow_id    = davinci_flow.registration_flow.id
    version_id = -1
    weight     = 100
  }
}
