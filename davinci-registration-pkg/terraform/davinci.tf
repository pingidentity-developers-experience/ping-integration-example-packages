##########################################################################
# davinci.tf - Declarations to create DaVinci assets
# @see https://registry.terraform.io/providers/pingidentity/davinci/latest
##########################################################################

#########################################################################
# PineOne DaVinci - Read all connections
#########################################################################
# @see https://registry.terraform.io/providers/pingidentity/davinci/latest/docs/data-sources/connections

# // Assign the "Identity Data Admin" role to the DV admin user
# resource "pingone_role_assignment_user" "admin_sso_identity_admin" {
#   environment_id       = var.admin_env_id
#   user_id              = data.pingone_user.dv_admin_user.id
#   role_id              = data.pingone_role.identity_data_admin.id
#   scope_environment_id = module.environment.environment_id
# }

# // Assign the "Environment Admin" role to the DV admin user
# resource "pingone_role_assignment_user" "admin_sso_environment_admin" {
#   environment_id       = var.admin_env_id
#   user_id              = data.pingone_user.dv_admin_user.id
#   role_id              = data.pingone_role.environment_admin.id
#   scope_environment_id = module.environment.environment_id
# }

// This simple read action is used to as a precursor to all other data/resources
// Every other data/resource should have a `depends_on` pointing to this read action
data "davinci_connections" "read_all" {
  // NOTICE: This read action has a dependency on the role assignment, not environment.
  // Assigning this correctly ensures the role is not destroyed before DaVinci resources during `terraform destroy`.
  depends_on = [
    # pingone_role_assignment_user.admin_sso_identity_admin,
    # pingone_role_assignment_user.admin_sso_environment_admin
  ]
  environment_id = module.environment.environment_id
}

resource "davinci_flow" "registration_flow" {
  depends_on = [ 
    data.davinci_connections.read_all
  ]

  flow_json = file("davinci-registration-flow.json")
  deploy    = true

  environment_id = module.environment.environment_id

  connection_link {
    id   = element([for s in data.davinci_connections.read_all.connections : s.id if s.name == "Http"],0)
    name = "Http"
  }

  connection_link {
    id   = data.davinci_connection.ping_sso.id
    name = "PingOne"
  }
}

resource "davinci_application" "registration_flow_app" {
  name           = "DaVinci Registration Sample Application"
  environment_id = module.environment.environment_id
  depends_on     = [ data.davinci_connections.read_all ]
  oauth {
    enabled = true
        values {
      allowed_grants                = ["authorizationCode"]
      allowed_scopes                = ["openid", "profile"]
      enabled                       = true
      enforce_signed_request_openid = false
      redirect_uris                 = ["https://auth.pingone.com/${module.environment.environment_id}/rp/callback/openid_connect"]
    }
  }
  policy {
    name   = "DaVinci Registration Sample Policy"
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
