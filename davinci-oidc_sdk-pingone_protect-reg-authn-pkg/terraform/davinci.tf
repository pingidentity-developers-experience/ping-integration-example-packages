##########################################################################
# davinci.tf - Declarations to create DaVinci assets
# {@link https://registry.terraform.io/providers/pingidentity/davinci/latest}
##########################################################################

#########################################################################
# PingOne DaVinci - Read all connections
#########################################################################
# {@link https://registry.terraform.io/providers/pingidentity/davinci/latest/docs/data-sources/connections}

data "davinci_connections" "read_all" {
  environment_id = module.environment.environment_id
}

#########################################################################
# PingOne DaVinci - Create and deploy a flow
#########################################################################
# {@link https://registry.terraform.io/providers/pingidentity/davinci/latest/docs/resources/flow}

resource "davinci_flow" "registration_flow" {
  depends_on = [
    data.davinci_connections.read_all
  ]

  flow_json = file("davinci-oidc-protect-reg-authn-flow.json")
  deploy    = true

  environment_id = module.environment.environment_id

  connection_link {
    id   = element([for s in data.davinci_connections.read_all.connections : s.id if s.name == "Http"], 0)
    name = "Http"
  }

  connection_link {
    id   = data.davinci_connection.ping_sso.id
    name = "PingOne"
  }

  connection_link {
    id   = data.davinci_connection.pingone_protect.id
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
  name           = "DaVinci SSO Protect Sample Application"
  environment_id = module.environment.environment_id
  depends_on     = [data.davinci_connections.read_all]
  oauth {
    enabled = true
    values {
      allowed_grants                = ["authorizationCode"]
      allowed_scopes                = ["openid", "profile"]
      enabled                       = true
      enforce_signed_request_openid = false
      redirect_uris                 = ["https://auth.pingone.${local.pingone_domain}/${module.environment.environment_id}/rp/callback/openid_connect"]
    }
  }
  policy {
    name   = "DaVinci SSO Protect Sample Policy"
    status = "enabled"
    policy_flow {
      flow_id    = davinci_flow.registration_flow.id
      version_id = -1
      weight     = 100
    }
  }
  saml {
    values {
      enabled                = false
      enforce_signed_request = false
    }
  }
}
