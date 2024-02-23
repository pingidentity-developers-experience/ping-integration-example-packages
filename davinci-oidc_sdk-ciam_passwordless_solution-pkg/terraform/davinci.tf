##########################################################################
# davinci.tf - Declarations to create DaVinci assets
# {@link https://registry.terraform.io/providers/pingidentity/davinci/latest}
##########################################################################

#########################################################################
# PingOne DaVinci - Read all connections
#########################################################################
# {@link https://registry.terraform.io/providers/pingidentity/davinci/latest/docs/data-sources/connections}

data "davinci_connections" "read_all" {
  environment_id = pingone_environment.my_environment.id
  depends_on     = [pingone_role_assignment_user.admin_sso_davinci_admin]
}

#########################################################################
# PingOne DaVinci - Create and deploy a flow
#########################################################################
# {@link https://registry.terraform.io/providers/pingidentity/davinci/latest/docs/resources/flow}

resource "davinci_flow" "registration_flow" {
  depends_on = [
    data.davinci_connections.read_all
  ]

  flow_json = file("davinci-flows/davinci-oidc-passwordless-flow.json")

  deploy = true

  environment_id = pingone_environment.my_environment.id

  subflow_link {
    id   = davinci_flow.device_authn_subflow.id
    name = davinci_flow.device_authn_subflow.name
  }

  subflow_link {
    id   = davinci_flow.account_recovery_subflow.id
    name = davinci_flow.account_recovery_subflow.name
  }

  subflow_link {
    id   = davinci_flow.account_reg_subflow.id
    name = davinci_flow.account_reg_subflow.name
  }

  subflow_link {
    id   = davinci_flow.change_password_subflow.id
    name = davinci_flow.change_password_subflow.name
  }

  subflow_link {
    id   = davinci_flow.agreement_subflow.id
    name = davinci_flow.agreement_subflow.name
  }

  subflow_link {
    id   = davinci_flow.verify_email_subflow.id
    name = davinci_flow.verify_email_subflow.name
  }

  connection_link {
    id   = element([for s in data.davinci_connections.read_all.connections : s.id if s.name == "Http"], 0)
    name = "Http"
  }

  connection_link {
    id   = data.davinci_connection.ping_sso.id
    name = "PingOne"
  }

  connection_link {
    id   = element([for s in data.davinci_connections.read_all.connections : s.id if s.name == "PingOne Authentication"], 0)
    name = "PingOne Authentication"
  }

  connection_link {
    id   = element([for s in data.davinci_connections.read_all.connections : s.id if s.name == "Variables"], 0)
    name = "Variables"
  }

  connection_link {
    id   = element([for s in data.davinci_connections.read_all.connections : s.id if s.name == "Annotation"], 0)
    name = "Annotation"
  }

  connection_link {
    id   = element([for s in data.davinci_connections.read_all.connections : s.id if s.name == "Flow Connector"], 0)
    name = "Flow Connector"
  }

  connection_link {
    id   = element([for s in data.davinci_connections.read_all.connections : s.id if s.name == "Node"], 0)
    name = "Node"
  }

  connection_link {
    id   = element([for s in data.davinci_connections.read_all.connections : s.id if s.name == "Error Message"], 0)
    name = "Error Message"
  }

  connection_link {
    id   = element([for s in data.davinci_connections.read_all.connections : s.id if s.name == "Functions"], 0)
    name = "Functions"
  }

}

resource "davinci_flow" "device_authn_subflow" {
  depends_on     = [data.davinci_connections.read_all]
  environment_id = pingone_environment.my_environment.id
  flow_json      = file("davinci-flows/device-authn-subflow.json")
  deploy         = true

  subflow_link {
    id   = davinci_flow.magiclink_authn_subflow.id
    name = davinci_flow.magiclink_authn_subflow.name
  }

  connection_link {
    id   = element([for s in data.davinci_connections.read_all.connections : s.id if s.name == "Http"], 0)
    name = "Http"
  }
  connection_link {
    id   = element([for s in data.davinci_connections.read_all.connections : s.id if s.name == "PingOne MFA"], 0)
    name = "PingOne MFA"
  }

  connection_link {
    id   = element([for s in data.davinci_connections.read_all.connections : s.id if s.name == "Annotation"], 0)
    name = "Annotation"
  }

  connection_link {
    id   = element([for s in data.davinci_connections.read_all.connections : s.id if s.name == "Error Message"], 0)
    name = "Error Message"
  }

  connection_link {
    id   = element([for s in data.davinci_connections.read_all.connections : s.id if s.name == "Functions"], 0)
    name = "Functions"
  }

  connection_link {
    id   = element([for s in data.davinci_connections.read_all.connections : s.id if s.name == "Node"], 0)
    name = "Node"
  }

  connection_link {
    id   = element([for s in data.davinci_connections.read_all.connections : s.id if s.name == "Flow Connector"], 0)
    name = "Flow Connector"
  }

}

resource "davinci_flow" "account_recovery_subflow" {
  depends_on     = [data.davinci_connections.read_all]
  environment_id = pingone_environment.my_environment.id
  flow_json      = file("davinci-flows/account-recovery-subflow.json")
  deploy         = true

  connection_link {
    id   = element([for s in data.davinci_connections.read_all.connections : s.id if s.name == "Http"], 0)
    name = "Http"
  }

  connection_link {
    id   = data.davinci_connection.ping_sso.id
    name = "PingOne"
  }

  connection_link {
    id   = element([for s in data.davinci_connections.read_all.connections : s.id if s.name == "Variables"], 0)
    name = "Variables"
  }

  connection_link {
    id   = element([for s in data.davinci_connections.read_all.connections : s.id if s.name == "Annotation"], 0)
    name = "Annotation"
  }

  connection_link {
    id   = element([for s in data.davinci_connections.read_all.connections : s.id if s.name == "Error Message"], 0)
    name = "Error Message"
  }

  connection_link {
    id   = element([for s in data.davinci_connections.read_all.connections : s.id if s.name == "Functions"], 0)
    name = "Functions"
  }

  connection_link {
    id   = element([for s in data.davinci_connections.read_all.connections : s.id if s.name == "Node"], 0)
    name = "Node"
  }
}

resource "davinci_flow" "account_reg_subflow" {
  depends_on     = [data.davinci_connections.read_all]
  environment_id = pingone_environment.my_environment.id
  flow_json      = file("davinci-flows/account-reg-subflow.json")
  deploy         = true

  subflow_link {
    id   = davinci_flow.device_registration_subflow.id
    name = davinci_flow.device_registration_subflow.name
  }

  subflow_link {
    id   = davinci_flow.verify_email_subflow.id
    name = davinci_flow.verify_email_subflow.name
  }

  subflow_link {
    id   = davinci_flow.agreement_subflow.id
    name = davinci_flow.agreement_subflow.name
  }

  connection_link {
    id   = element([for s in data.davinci_connections.read_all.connections : s.id if s.name == "Http"], 0)
    name = "Http"
  }

  connection_link {
    id   = element([for s in data.davinci_connections.read_all.connections : s.id if s.name == "Functions"], 0)
    name = "Functions"
  }

  connection_link {
    id   = element([for s in data.davinci_connections.read_all.connections : s.id if s.name == "Node"], 0)
    name = "Node"
  }

  connection_link {
    id   = data.davinci_connection.ping_sso.id
    name = "PingOne"
  }

  connection_link {
    id   = element([for s in data.davinci_connections.read_all.connections : s.id if s.name == "Variables"], 0)
    name = "Variables"
  }

  connection_link {
    id   = element([for s in data.davinci_connections.read_all.connections : s.id if s.name == "Annotation"], 0)
    name = "Annotation"
  }

  connection_link {
    id   = element([for s in data.davinci_connections.read_all.connections : s.id if s.name == "Error Message"], 0)
    name = "Error Message"
  }

  connection_link {
    id   = element([for s in data.davinci_connections.read_all.connections : s.id if s.name == "Flow Connector"], 0)
    name = "Flow Connector"
  }
}

resource "davinci_flow" "agreement_subflow" {
  depends_on     = [data.davinci_connections.read_all]
  environment_id = pingone_environment.my_environment.id
  flow_json      = file("davinci-flows/agreement-subflow.json")
  deploy         = true

  connection_link {
    id   = element([for s in data.davinci_connections.read_all.connections : s.id if s.name == "Http"], 0)
    name = "Http"
  }

  connection_link {
    id   = data.davinci_connection.ping_sso.id
    name = "PingOne"
  }

  connection_link {
    id   = element([for s in data.davinci_connections.read_all.connections : s.id if s.name == "Annotation"], 0)
    name = "Annotation"
  }

  connection_link {
    id   = element([for s in data.davinci_connections.read_all.connections : s.id if s.name == "Error Message"], 0)
    name = "Error Message"
  }

  connection_link {
    id   = element([for s in data.davinci_connections.read_all.connections : s.id if s.name == "Functions"], 0)
    name = "Functions"
  }

  connection_link {
    id   = element([for s in data.davinci_connections.read_all.connections : s.id if s.name == "Node"], 0)
    name = "Node"
  }
}

resource "davinci_flow" "change_password_subflow" {
  depends_on     = [data.davinci_connections.read_all]
  environment_id = pingone_environment.my_environment.id
  flow_json      = file("davinci-flows/change-password-subflow.json")
  deploy         = true

  connection_link {
    id   = element([for s in data.davinci_connections.read_all.connections : s.id if s.name == "Http"], 0)
    name = "Http"
  }

  connection_link {
    id   = data.davinci_connection.ping_sso.id
    name = "PingOne"
  }

  connection_link {
    id   = element([for s in data.davinci_connections.read_all.connections : s.id if s.name == "Annotation"], 0)
    name = "Annotation"
  }

  connection_link {
    id   = element([for s in data.davinci_connections.read_all.connections : s.id if s.name == "Error Message"], 0)
    name = "Error Message"
  }

  connection_link {
    id   = element([for s in data.davinci_connections.read_all.connections : s.id if s.name == "Functions"], 0)
    name = "Functions"
  }

  connection_link {
    id   = element([for s in data.davinci_connections.read_all.connections : s.id if s.name == "Node"], 0)
    name = "Node"
  }
}

resource "davinci_flow" "device_registration_subflow" {
  depends_on     = [data.davinci_connections.read_all]
  environment_id = pingone_environment.my_environment.id
  flow_json      = file("davinci-flows/device-registration-subflow.json")
  deploy         = true

  connection_link {
    id   = element([for s in data.davinci_connections.read_all.connections : s.id if s.name == "Http"], 0)
    name = "Http"
  }

  connection_link {
    id   = element([for s in data.davinci_connections.read_all.connections : s.id if s.name == "PingOne MFA"], 0)
    name = "PingOne MFA"
  }

  connection_link {
    id   = element([for s in data.davinci_connections.read_all.connections : s.id if s.name == "Functions"], 0)
    name = "Functions"
  }

  connection_link {
    id   = element([for s in data.davinci_connections.read_all.connections : s.id if s.name == "Node"], 0)
    name = "Node"
  }

  connection_link {
    id   = element([for s in data.davinci_connections.read_all.connections : s.id if s.name == "Variables"], 0)
    name = "Variables"
  }

  connection_link {
    id   = element([for s in data.davinci_connections.read_all.connections : s.id if s.name == "Annotation"], 0)
    name = "Annotation"
  }

  connection_link {
    id   = element([for s in data.davinci_connections.read_all.connections : s.id if s.name == "Error Message"], 0)
    name = "Error Message"
  }

  connection_link {
    id   = davinci_connection.strings.id
    name = "String Manipulation"
  }

}

resource "davinci_flow" "magiclink_authn_subflow" {
  depends_on     = [data.davinci_connections.read_all]
  environment_id = pingone_environment.my_environment.id
  flow_json      = file("davinci-flows/magiclink-authn-subflow.json")
  deploy         = true

  connection_link {
    id   = element([for s in data.davinci_connections.read_all.connections : s.id if s.name == "Http"], 0)
    name = "Http"
  }

  connection_link {
    id   = data.davinci_connection.ping_sso.id
    name = "PingOne"
  }

  connection_link {
    id   = element([for s in data.davinci_connections.read_all.connections : s.id if s.name == "Annotation"], 0)
    name = "Annotation"
  }

  connection_link {
    id   = element([for s in data.davinci_connections.read_all.connections : s.id if s.name == "Flow Connector"], 0)
    name = "Flow Connector"
  }

  connection_link {
    id   = element([for s in data.davinci_connections.read_all.connections : s.id if s.name == "Functions"], 0)
    name = "Functions"
  }

  connection_link {
    id   = element([for s in data.davinci_connections.read_all.connections : s.id if s.name == "Node"], 0)
    name = "Node"
  }

  connection_link {
    id   = element([for s in data.davinci_connections.read_all.connections : s.id if s.name == "PingOne Notifications"], 0)
    name = "PingOne Notifications"
  }

  connection_link {
    id   = davinci_connection.challenge.id
    name = "Challenge"
  }
}

resource "davinci_flow" "verify_email_subflow" {
  depends_on     = [data.davinci_connections.read_all]
  environment_id = pingone_environment.my_environment.id
  flow_json      = file("davinci-flows/verify-email-subflow.json")
  deploy         = true

  connection_link {
    id   = element([for s in data.davinci_connections.read_all.connections : s.id if s.name == "Http"], 0)
    name = "Http"
  }

  connection_link {
    id   = data.davinci_connection.ping_sso.id
    name = "PingOne"
  }

  connection_link {
    id   = element([for s in data.davinci_connections.read_all.connections : s.id if s.name == "Variables"], 0)
    name = "Variables"
  }

  connection_link {
    id   = element([for s in data.davinci_connections.read_all.connections : s.id if s.name == "Annotation"], 0)
    name = "Annotation"
  }

  connection_link {
    id   = element([for s in data.davinci_connections.read_all.connections : s.id if s.name == "Error Message"], 0)
    name = "Error Message"
  }

  connection_link {
    id   = element([for s in data.davinci_connections.read_all.connections : s.id if s.name == "Functions"], 0)
    name = "Functions"
  }

  connection_link {
    id   = element([for s in data.davinci_connections.read_all.connections : s.id if s.name == "Node"], 0)
    name = "Node"
  }
}

resource "davinci_flow" "device_management_flow" {
  depends_on = [
    data.davinci_connections.read_all
  ]

  flow_json = file("davinci-flows/device-management-flow/device-management-mainflow.json")

  deploy = true

  environment_id = pingone_environment.my_environment.id

  connection_link {
    id   = element([for s in data.davinci_connections.read_all.connections : s.id if s.name == "Http"], 0)
    name = "Http"
  }
  connection_link {
    id   = element([for s in data.davinci_connections.read_all.connections : s.id if s.name == "Functions"], 0)
    name = "Functions"
  }

  connection_link {
    id   = data.davinci_connection.ping_sso.id
    name = "PingOne"
  }

  connection_link {
    id   = element([for s in data.davinci_connections.read_all.connections : s.id if s.name == "Annotation"], 0)
    name = "Annotation"
  }

  connection_link {
    id   = element([for s in data.davinci_connections.read_all.connections : s.id if s.name == "Flow Connector"], 0)
    name = "Flow Connector"
  }

  connection_link {
    id   = element([for s in data.davinci_connections.read_all.connections : s.id if s.name == "PingOne MFA"], 0)
    name = "PingOne MFA"
  }

  connection_link {
    id   = element([for s in data.davinci_connections.read_all.connections : s.id if s.name == "Node"], 0)
    name = "Node"
  }
  subflow_link {
    id   = davinci_flow.device_management_subflow.id
    name = davinci_flow.device_management_subflow.name
  }

}

resource "davinci_flow" "password_reset_flow" {
  depends_on = [
    data.davinci_connections.read_all
  ]

  flow_json = file("davinci-flows/password-reset-flow/password-reset-mainflow.json")

  deploy = true

  environment_id = pingone_environment.my_environment.id

  connection_link {
    id   = element([for s in data.davinci_connections.read_all.connections : s.id if s.name == "Http"], 0)
    name = "Http"
  }
  connection_link {
    id   = element([for s in data.davinci_connections.read_all.connections : s.id if s.name == "Functions"], 0)
    name = "Functions"
  }

  connection_link {
    id   = data.davinci_connection.ping_sso.id
    name = "PingOne"
  }

  connection_link {
    id   = element([for s in data.davinci_connections.read_all.connections : s.id if s.name == "Annotation"], 0)
    name = "Annotation"
  }

  connection_link {
    id   = element([for s in data.davinci_connections.read_all.connections : s.id if s.name == "Flow Connector"], 0)
    name = "Flow Connector"
  }

  connection_link {
    id   = element([for s in data.davinci_connections.read_all.connections : s.id if s.name == "Node"], 0)
    name = "Node"
  }
  subflow_link {
    id   = davinci_flow.password_reset_subflow.id
    name = davinci_flow.password_reset_subflow.name
  }
}

resource "davinci_flow" "device_management_subflow" {
  depends_on     = [data.davinci_connections.read_all]
  environment_id = pingone_environment.my_environment.id
  flow_json      = file("davinci-flows/device-management-flow/device-management-subflow.json")
  deploy         = true

  connection_link {
    id   = element([for s in data.davinci_connections.read_all.connections : s.id if s.name == "Http"], 0)
    name = "Http"
  }

  connection_link {
    id   = element([for s in data.davinci_connections.read_all.connections : s.id if s.name == "PingOne MFA"], 0)
    name = "PingOne MFA"
  }

  connection_link {
    id   = element([for s in data.davinci_connections.read_all.connections : s.id if s.name == "Functions"], 0)
    name = "Functions"
  }

  connection_link {
    id   = element([for s in data.davinci_connections.read_all.connections : s.id if s.name == "Node"], 0)
    name = "Node"
  }

  connection_link {
    id   = element([for s in data.davinci_connections.read_all.connections : s.id if s.name == "Error Message"], 0)
    name = "Error Message"
  }

  connection_link {
    id   = element([for s in data.davinci_connections.read_all.connections : s.id if s.name == "Variables"], 0)
    name = "Variables"
  }

  connection_link {
    id   = element([for s in data.davinci_connections.read_all.connections : s.id if s.name == "Annotation"], 0)
    name = "Annotation"
  }

  connection_link {
    id   = davinci_connection.strings.id
    name = "String Manipulation"
  }
}

resource "davinci_flow" "password_reset_subflow" {
  depends_on     = [data.davinci_connections.read_all]
  environment_id = pingone_environment.my_environment.id
  flow_json      = file("davinci-flows/password-reset-flow/password-reset-subflow.json")
  deploy         = true

  connection_link {
    id   = element([for s in data.davinci_connections.read_all.connections : s.id if s.name == "Http"], 0)
    name = "Http"
  }

  connection_link {
    id   = data.davinci_connection.ping_sso.id
    name = "PingOne"
  }

  connection_link {
    id   = element([for s in data.davinci_connections.read_all.connections : s.id if s.name == "Annotation"], 0)
    name = "Annotation"
  }

  connection_link {
    id   = element([for s in data.davinci_connections.read_all.connections : s.id if s.name == "Error Message"], 0)
    name = "Error Message"
  }

  connection_link {
    id   = element([for s in data.davinci_connections.read_all.connections : s.id if s.name == "Functions"], 0)
    name = "Functions"
  }

  connection_link {
    id   = element([for s in data.davinci_connections.read_all.connections : s.id if s.name == "Node"], 0)
    name = "Node"
  }
}

resource "davinci_flow" "profile_management_flow" {
  depends_on = [
    data.davinci_connections.read_all
  ]

  flow_json = file("davinci-flows/profile-management-flow.json")

  deploy = true

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
    id   = element([for s in data.davinci_connections.read_all.connections : s.id if s.name == "Variables"], 0)
    name = "Variables"
  }

  connection_link {
    id   = element([for s in data.davinci_connections.read_all.connections : s.id if s.name == "Annotation"], 0)
    name = "Annotation"
  }

  connection_link {
    id   = element([for s in data.davinci_connections.read_all.connections : s.id if s.name == "Error Message"], 0)
    name = "Error Message"
  }

  connection_link {
    id   = element([for s in data.davinci_connections.read_all.connections : s.id if s.name == "Functions"], 0)
    name = "Functions"
  }

}

#########################################################################
# PingOne DaVinci - Create connection
#########################################################################
# {@link https://registry.terraform.io/providers/pingidentity/davinci/0.1.9/docs/resources/connection}

resource "davinci_connection" "challenge" {
  connector_id   = "challengeConnector"
  environment_id = pingone_environment.my_environment.id
  name           = "Challenge"

  depends_on = [data.davinci_connections.read_all]
}

resource "davinci_connection" "strings" {
  connector_id   = "stringsConnector"
  environment_id = pingone_environment.my_environment.id
  name           = "String Manipulation"

  depends_on = [data.davinci_connections.read_all]
}

#########################################################################
# PingOne DaVinci - Create an application and flow policy for the flow above
#########################################################################
# {@link https://registry.terraform.io/providers/pingidentity/davinci/latest/docs/resources/application}

resource "davinci_application" "registration_flow_app" {
  name           = "DaVinci OIDC Passwordless Sample Application"
  environment_id = pingone_environment.my_environment.id
  depends_on     = [data.davinci_connections.read_all]
  oauth {
    enabled = true
    values {
      allowed_grants                = ["authorizationCode"]
      allowed_scopes                = ["openid", "profile"]
      enabled                       = true
      enforce_signed_request_openid = false
      redirect_uris                 = ["https://auth.pingone.${local.pingone_domain}/${pingone_environment.my_environment.id}/rp/callback/openid_connect"]
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
    name   = "DaVinci OIDC Passwordless Sample Policy"
    environment_id = pingone_environment.my_environment.id
    application_id = davinci_application.registration_flow_app.id
    status = "enabled"
    policy_flow {
      flow_id    = davinci_flow.registration_flow.id
      version_id = -1
      weight     = 100
    }
}
#########################################################################
# PingOne DaVinci - Create global company variables
#########################################################################
# {@link https://registry.terraform.io/providers/pingidentity/davinci/latest/docs/resources/variable}

resource "davinci_variable" "ciam_passwordlessRequired" {
  depends_on     = [data.davinci_connections.read_all]
  name           = "ciam_passwordlessRequired"
  environment_id = pingone_environment.my_environment.id
  description    = "Passwordless required"
  context        = "company"
  value          = "false"
  type           = "boolean"
}

resource "davinci_variable" "ciam_authMethod" {
  depends_on     = [data.davinci_connections.read_all]
  name           = "ciam_authMethod"
  environment_id = pingone_environment.my_environment.id
  description    = "Authentication method"
  context        = "flowInstance"
  type           = "string"
}

resource "davinci_variable" "ciam_agreementEnabled" {
  depends_on     = [data.davinci_connections.read_all]
  name           = "ciam_agreementEnabled"
  environment_id = pingone_environment.my_environment.id
  description    = "Agreement enabled"
  context        = "company"
  value          = "false"
  type           = "boolean"
}

resource "davinci_variable" "ciam_appleEnabled" {
  depends_on     = [data.davinci_connections.read_all]
  name           = "ciam_appleEnabled"
  environment_id = pingone_environment.my_environment.id
  description    = "Apple enabled"
  context        = "company"
  value          = "false"
  type           = "boolean"
}

resource "davinci_variable" "ciam_emailOtpEnabled" {
  depends_on     = [data.davinci_connections.read_all]
  name           = "ciam_emailOtpEnabled"
  environment_id = pingone_environment.my_environment.id
  description    = "Email OTP enabled"
  context        = "company"
  value          = "true"
  type           = "boolean"
}

resource "davinci_variable" "ciam_fidoPasskeyEnabled" {
  depends_on     = [data.davinci_connections.read_all]
  name           = "ciam_fidoPasskeyEnabled"
  environment_id = pingone_environment.my_environment.id
  description    = "FIDO passkey enabled"
  context        = "company"
  value          = "false"
  type           = "boolean"
}

resource "davinci_variable" "ciam_googleEnabled" {
  depends_on     = [data.davinci_connections.read_all]
  name           = "ciam_googleEnabled"
  environment_id = pingone_environment.my_environment.id
  description    = "Google enabled"
  context        = "company"
  value          = "false"
  type           = "boolean"
}

resource "davinci_variable" "ciam_sessionLengthInMinute" {
  depends_on     = [data.davinci_connections.read_all]
  name           = "ciam_sessionLengthInMinute"
  environment_id = pingone_environment.my_environment.id
  description    = "Session length in minutes"
  context        = "company"
  value          = "5"
  type           = "number"
}

resource "davinci_variable" "ciam_accountRecoveryEnabled" {
  depends_on     = [data.davinci_connections.read_all]
  name           = "ciam_accountRecoveryEnabled"
  environment_id = pingone_environment.my_environment.id
  description    = "Account recovery enabled"
  context        = "company"
  value          = "false"
  type           = "boolean"
}

resource "davinci_variable" "ciam_facebookEnabled" {
  depends_on     = [data.davinci_connections.read_all]
  name           = "ciam_facebookEnabled"
  environment_id = pingone_environment.my_environment.id
  description    = "Facebook enabled"
  context        = "company"
  value          = "false"
  type           = "boolean"
}

resource "davinci_variable" "ciam_smsOtpEnabled" {
  depends_on     = [data.davinci_connections.read_all]
  name           = "ciam_smsOtpEnabled"
  environment_id = pingone_environment.my_environment.id
  description    = "SMS OTP enabled"
  context        = "company"
  value          = "true"
  type           = "boolean"
}

resource "davinci_variable" "ciam_magicLinkEnabled" {
  depends_on     = [data.davinci_connections.read_all]
  name           = "ciam_magicLinkEnabled"
  environment_id = pingone_environment.my_environment.id
  description    = "Magic link enabled"
  context        = "company"
  value          = "false"
  type           = "boolean"
}

resource "davinci_variable" "ciam_verificationLimit" {
  depends_on     = [data.davinci_connections.read_all]
  name           = "ciam_verificationLimit"
  environment_id = pingone_environment.my_environment.id
  description    = "Verification limit"
  context        = "company"
  value          = "5"
  type           = "number"
}

resource "davinci_variable" "ciam_logoStyle" {
  depends_on     = [data.davinci_connections.read_all]
  name           = "ciam_logoStyle"
  environment_id = pingone_environment.my_environment.id
  description    = "CSS Style for company logo"
  context        = "company"
  value          = "width: 65px; height: 65px;"
  type           = "string"
}

resource "davinci_variable" "ciam_logoUrl" {
  depends_on     = [data.davinci_connections.read_all]
  name           = "ciam_logoUrl"
  environment_id = pingone_environment.my_environment.id
  description    = "URL of company logo"
  context        = "company"
  value          = "https://assets.pingone.com/ux/ui-library/5.0.2/images/logo-pingidentity.png"
  type           = "string"
}

resource "davinci_variable" "ciam_companyName" {
  depends_on     = [data.davinci_connections.read_all]
  name           = "ciam_companyName"
  environment_id = pingone_environment.my_environment.id
  description    = "Company name"
  context        = "company"
  value          = "Ping Identity"
  type           = "string"
}

resource "davinci_variable" "ciam_recoveryLimit" {
  depends_on     = [data.davinci_connections.read_all]
  name           = "ciam_recoveryLimit"
  environment_id = pingone_environment.my_environment.id
  description    = "Recovery limit"
  context        = "company"
  value          = "5"
  type           = "number"
}

resource "davinci_variable" "ciam_errorMessage" {
  depends_on     = [data.davinci_connections.read_all]
  name           = "ciam_errorMessage"
  environment_id = pingone_environment.my_environment.id
  description    = "Error message"
  context        = "flowInstance"
  type           = "string"
}

resource "davinci_variable" "ciam_verificationValidationAttempts" {
  depends_on     = [data.davinci_connections.read_all]
  name           = "ciam_verificationValidationAttempts"
  environment_id = pingone_environment.my_environment.id
  description    = "Verification validation attempts"
  context        = "flowInstance"
  type           = "number"
}

resource "davinci_variable" "ciam_deviceId" {
  depends_on     = [data.davinci_connections.read_all]
  name           = "ciam_deviceId"
  environment_id = pingone_environment.my_environment.id
  description    = "Device id"
  context        = "flowInstance"
  type           = "string"
}

resource "davinci_variable" "ciam_recoveryValidationAttempts" {
  depends_on     = [data.davinci_connections.read_all]
  name           = "ciam_recoveryValidationAttempts"
  environment_id = pingone_environment.my_environment.id
  description    = "Recovery validation attempts"
  context        = "flowInstance"
  type           = "number"
}

resource "davinci_variable" "agreementId" {
  depends_on     = [data.davinci_connections.read_all]
  name           = "agreementId"
  environment_id = pingone_environment.my_environment.id
  description    = "Agreement id"
  context        = "flowInstance"
  type           = "string"
  value          = pingone_agreement.agreement.id
}