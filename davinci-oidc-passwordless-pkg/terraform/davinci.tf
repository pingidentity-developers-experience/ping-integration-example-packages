##########################################################################
# davinci.tf - Declarations to create DaVinci assets
# {@link https://registry.terraform.io/providers/pingidentity/davinci/latest}
##########################################################################

#########################################################################
# PineOne DaVinci - Read all connections
#########################################################################
# {@link https://registry.terraform.io/providers/pingidentity/davinci/latest/docs/data-sources/connections}

data "davinci_connections" "read_all" {
  environment_id = module.environment.environment_id
}

#########################################################################
# PineOne DaVinci - Create and deploy a flow
#########################################################################
# {@link https://registry.terraform.io/providers/pingidentity/davinci/latest/docs/resources/flow}

resource "davinci_flow" "registration_flow" {
  depends_on = [ 
    data.davinci_connections.read_all
  ]

  flow_json = file("davinci-flows/davinci-oidc-passwordless-flow.json")

  deploy    = true

  environment_id = module.environment.environment_id

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
    id   = element([for s in data.davinci_connections.read_all.connections : s.id if s.name == "Http"],0)
    name = "Http"
  }

  connection_link {
    id   = data.davinci_connection.ping_sso.id
    name = "PingOne"
  }

  connection_link {
    id   = data.davinci_connection.pingone_authentication.id
    name = "PingOne Authentication"
  }

  connection_link {
    id   = data.davinci_connection.variables.id
    name = "Variables"
  }

  connection_link {
    id   = data.davinci_connection.annotation.id
    name = "Annotation"
  }

  connection_link {
    id   = data.davinci_connection.flow_conductor.id
    name = "Flow Conductor"
  }

  connection_link {
    id   = data.davinci_connection.teleport.id
    name = "Teleport"
  }

  connection_link {
    id   = data.davinci_connection.error_customize.id
    name = "Error Customize"
  }

  connection_link {
    id   = data.davinci_connection.functions.id
    name = "Functions"
  }

}

resource "davinci_flow" "device_authn_subflow" {
  environment_id = module.environment.environment_id
  flow_json      = file("davinci-flows/device-authn-subflow.json")
  deploy         = true

  subflow_link {
    id   = davinci_flow.magiclink_authn_subflow.id
    name = davinci_flow.magiclink_authn_subflow.name
  }
}

resource "davinci_flow" "account_recovery_subflow" {
  environment_id = module.environment.environment_id
  flow_json      = file("davinci-flows/account-recovery-subflow.json")
  deploy         = true
}

resource "davinci_flow" "account_reg_subflow" {
  environment_id = module.environment.environment_id
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
}

resource "davinci_flow" "agreement_subflow" {
  environment_id = module.environment.environment_id
  flow_json      = file("davinci-flows/agreement-subflow.json")
  deploy         = true
}

resource "davinci_flow" "change_password_subflow" {
  environment_id = module.environment.environment_id
  flow_json      = file("davinci-flows/change-password-subflow.json")
  deploy         = true
}

resource "davinci_flow" "device_registration_subflow" {
  environment_id = module.environment.environment_id
  flow_json      = file("davinci-flows/device-registration-subflow.json")
  deploy         = true
}

resource "davinci_flow" "magiclink_authn_subflow" {
  environment_id = module.environment.environment_id
  flow_json      = file("davinci-flows/magiclink-authn-subflow.json")
  deploy         = true
}

resource "davinci_flow" "verify_email_subflow" {
  environment_id = module.environment.environment_id
  flow_json      = file("davinci-flows/verify-email-subflow.json")
  deploy         = true
}

#########################################################################
# PingOne DaVinci - Create an application and flow policy for the flow above
#########################################################################
# {@link https://registry.terraform.io/providers/pingidentity/davinci/latest/docs/resources/application}

resource "davinci_application" "registration_flow_app" {
  name           = "DaVinci OIDC Passwordless Sample Application"
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
    name   = "DaVinci OIDC Passwordless Sample Policy"
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

#########################################################################
# PingOne DaVinci - Create global company variables
#########################################################################
# {@link https://registry.terraform.io/providers/pingidentity/davinci/latest/docs/resources/variable}

resource "davinci_variable" "ciam_passwordlessRequired" {
    name           = "ciam_passwordlessRequired"
    environment_id = module.environment.environment_id
    context        = "company"
    value          = "false"
    type           = "boolean"
}

resource "davinci_variable" "ciam_authMethod" {
    name           = "ciam_authMethod"
    environment_id = module.environment.environment_id
    context        = "flowInstance"
    type           = "string"
}

resource "davinci_variable" "ciam_agreementEnabled" {
    name           = "ciam_agreementEnabled"
    environment_id = module.environment.environment_id
    context        = "company"
    value          = "false"
    type           = "boolean"
}

resource "davinci_variable" "ciam_appleEnabled" {
    name           = "ciam_appleEnabled"
    environment_id = module.environment.environment_id
    context        = "company"
    value          = "false"
    type           = "boolean"
}

resource "davinci_variable" "ciam_emailOtpEnabled" {
    name           = "ciam_emailOtpEnabled"
    environment_id = module.environment.environment_id
    context        = "company"
    value          = "true"
    type           = "boolean"
}

resource "davinci_variable" "ciam_fidoPasskeyEnabled" {
    name           = "ciam_fidoPasskeyEnabled"
    environment_id = module.environment.environment_id
    context        = "company"
    value          = "false"
    type           = "boolean"
}

resource "davinci_variable" "ciam_googleEnabled" {
    name           = "ciam_googleEnabled"
    environment_id = module.environment.environment_id
    context        = "company"
    value          = "false"
    type           = "boolean"
}

resource "davinci_variable" "ciam_sessionLengthInMinute" {
    name           = "ciam_sessionLengthInMinute"
    environment_id = module.environment.environment_id
    context        = "company"
    value          = "5"
    type           = "number"
}

resource "davinci_variable" "ciam_accountRecoveryEnabled" {
    name           = "ciam_accountRecoveryEnabled"
    environment_id = module.environment.environment_id
    context        = "company"
    value          = "false"
    type           = "boolean"
}

resource "davinci_variable" "ciam_facebookEnabled" {
    name           = "ciam_facebookEnabled"
    environment_id = module.environment.environment_id
    context        = "company"
    value          = "false"
    type           = "boolean"
}

resource "davinci_variable" "ciam_smsOtpEnabled" {
    name           = "ciam_smsOtpEnabled"
    environment_id = module.environment.environment_id
    context        = "company"
    value          = "true"
    type           = "boolean"
}

resource "davinci_variable" "ciam_magicLinkEnabled" {
    name           = "ciam_magicLinkEnabled"
    environment_id = module.environment.environment_id
    context        = "company"
    value          = "false"
    type           = "boolean"
}

resource "davinci_variable" "ciam_verificationLimit" {
    name           = "ciam_verificationLimit"
    environment_id = module.environment.environment_id
    context        = "company"
    value          = "5"
    type           = "number"
}

resource "davinci_variable" "ciam_logoStyle" {
    name           = "ciam_logoStyle"
    environment_id = module.environment.environment_id
    description    = "CSS Style for company logo"
    context        = "company"
    value          = "width: 65px; height: 65px;"
    type           = "string"
}

resource "davinci_variable" "ciam_logoUrl" {
    name           = "ciam_logoUrl"
    environment_id = module.environment.environment_id
    description    = "URL of company logo"
    context        = "company"
    value          = "https://assets.pingone.com/ux/ui-library/5.0.2/images/logo-pingidentity.png"
    type           = "string"
}

resource "davinci_variable" "ciam_companyName" {
    name           = "ciam_companyName"
    environment_id = module.environment.environment_id
    context        = "company"
    value          = "Ping Identity"
    type           = "string"
}

resource "davinci_variable" "ciam_recoveryLimit" {
    name           = "ciam_recoveryLimit"
    environment_id = module.environment.environment_id
    context        = "company"
    value          = "5"
    type           = "number"
}

resource "davinci_variable" "ciam_errorMessage" {
    name           = "ciam_errorMessage"
    environment_id = module.environment.environment_id
    context        = "flowInstance"
    type           = "string"
}

resource "davinci_variable" "ciam_verificationValidationAttempts" {
    name           = "ciam_verificationValidationAttempts"
    environment_id = module.environment.environment_id
    context        = "flowInstance"
    type           = "number"
}

resource "davinci_variable" "ciam_deviceId" {
    name           = "ciam_deviceId"
    environment_id = module.environment.environment_id
    context        = "flowInstance"
    type           = "string"
}

resource "davinci_variable" "ciam_recoveryValidationAttempts" {
    name           = "ciam_recoveryValidationAttempts"
    environment_id = module.environment.environment_id
    context        = "flowInstance"
    type           = "number"
}