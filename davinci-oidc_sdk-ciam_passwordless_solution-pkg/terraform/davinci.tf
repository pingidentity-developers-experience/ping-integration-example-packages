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
  depends_on      = [pingone_environment.my_environment]
}

data "davinci_connections" "read_all" {
  environment_id = pingone_environment.my_environment.id
  depends_on     = [ time_sleep.davinci ]
}

#########################################################################
# PingOne DaVinci - Create and deploy a flow
#########################################################################
# {@link https://registry.terraform.io/providers/pingidentity/davinci/latest/docs/resources/flow}

resource "davinci_flow" "passwordless_main_flow" {
  depends_on     = [data.davinci_connections.read_all]
  flow_json      = file("davinci-flows/davinci-oidc-passwordless-flow.json")
  environment_id = pingone_environment.my_environment.id

  connection_link {
    id   = data.davinci_connection.http_connector.id
    name = data.davinci_connection.http_connector.name
  }

  connection_link {
    id   = data.davinci_connection.variables.id
    name = data.davinci_connection.variables.name
  }

  connection_link {
    id   = data.davinci_connection.annotation.id
    name = data.davinci_connection.annotation.name
  }

  connection_link {
    id   = data.davinci_connection.error_message.id
    name = data.davinci_connection.error_message.name
  }

  connection_link {
    id   = data.davinci_connection.flow_connector.id
    name = data.davinci_connection.flow_connector.name
  }

  connection_link {
    id   = data.davinci_connection.functions.id
    name = data.davinci_connection.functions.name
  }

  connection_link {
    id   = data.davinci_connection.ping_sso.id
    name = data.davinci_connection.ping_sso.name
  }

  connection_link {
    id   = data.davinci_connection.authentication_connector.id
    name = data.davinci_connection.authentication_connector.name
  }

  connection_link {
    id   = data.davinci_connection.pingone_mfa.id
    name = data.davinci_connection.pingone_mfa.name
  }

  connection_link {
    id   = data.davinci_connection.pingone_notifications.id
    name = data.davinci_connection.pingone_notifications.name
  }

  connection_link {
    id   = data.davinci_connection.protect_connector.id
    name = data.davinci_connection.protect_connector.name
  }

  connection_link {
    id   = data.davinci_connection.node_connector.id
    name = data.davinci_connection.node_connector.name
  }

  subflow_link {
    id   = resource.davinci_flow.device_authentication_subflow.id
    name = resource.davinci_flow.device_authentication_subflow.name

    replace_import_subflow_id       = "6fc11379c939d1f89efb42105dcd4295"
  }

  subflow_link {
    id   = resource.davinci_flow.account_recovery_subflow.id
    name = resource.davinci_flow.account_recovery_subflow.name

    replace_import_subflow_id       = "364df5f173b46e296fdd0a128de61ee8"
  }

  subflow_link {
    id   = resource.davinci_flow.agreement_subflow.id
    name = resource.davinci_flow.agreement_subflow.name

    replace_import_subflow_id       = "02ef9161e97275f09faf2925b4173d77"
  }

  subflow_link {
    id   = resource.davinci_flow.account_registration_subflow.id
    name = resource.davinci_flow.account_registration_subflow.name

    replace_import_subflow_id       = "ed7202d8251c0980d41119b324980c91"
  }

  subflow_link {
    id   = resource.davinci_flow.verify_email_subflow.id
    name = resource.davinci_flow.verify_email_subflow.name

    replace_import_subflow_id       = "0ca2d9bf2d20379a006aff1ef4f17e0f"
  }

  subflow_link {
    id   = resource.davinci_flow.change_password_subflow.id
    name = resource.davinci_flow.change_password_subflow.name

    replace_import_subflow_id       = "f33a958f628aa8368027ca75240103c6"
  }

  subflow_link {
    id   = resource.davinci_flow.threat_detection_subflow.id
    name = resource.davinci_flow.threat_detection_subflow.name

    replace_import_subflow_id       = "d76548b32520975dfb808ab5a2bf4d25"
  }
  
}

resource "davinci_flow" "account_recovery_subflow" {
  depends_on     = [data.davinci_connections.read_all]
  environment_id = pingone_environment.my_environment.id
  flow_json      = file("davinci-flows/account-recovery-subflow.json")

  connection_link {
    id   = data.davinci_connection.http_connector.id
    name = data.davinci_connection.http_connector.name
  }

  connection_link {
    id   = data.davinci_connection.variables.id
    name = data.davinci_connection.variables.name
  }

  connection_link {
    id   = data.davinci_connection.annotation.id
    name = data.davinci_connection.annotation.name
  }

  connection_link {
    id   = data.davinci_connection.error_message.id
    name = data.davinci_connection.error_message.name
  }

  connection_link {
    id   = data.davinci_connection.flow_connector.id
    name = data.davinci_connection.flow_connector.name
  }

  connection_link {
    id   = data.davinci_connection.functions.id
    name = data.davinci_connection.functions.name
  }

  connection_link {
    id   = data.davinci_connection.ping_sso.id
    name = data.davinci_connection.ping_sso.name
  }

  connection_link {
    id   = data.davinci_connection.pingone_notifications.id
    name = data.davinci_connection.pingone_notifications.name
  }

  connection_link {
    id   = data.davinci_connection.protect_connector.id
    name = data.davinci_connection.protect_connector.name
  }

  connection_link {
    id   = data.davinci_connection.node_connector.id
    name = data.davinci_connection.node_connector.name
  }

  subflow_link {
    id   = resource.davinci_flow.threat_detection_subflow.id
    name = resource.davinci_flow.threat_detection_subflow.name

    replace_import_subflow_id       = "fa75459607692f70b795bacd0a37b878"
  }

}

resource "davinci_flow" "account_registration_subflow" {
  depends_on     = [data.davinci_connections.read_all]
  environment_id = pingone_environment.my_environment.id
  flow_json      = file("davinci-flows/account-reg-subflow.json")

  connection_link {
    id   = data.davinci_connection.http_connector.id
    name = data.davinci_connection.http_connector.name
  }

  connection_link {
    id   = data.davinci_connection.variables.id
    name = data.davinci_connection.variables.name
  }

  connection_link {
    id   = data.davinci_connection.annotation.id
    name = data.davinci_connection.annotation.name
  }

  connection_link {
    id   = data.davinci_connection.error_message.id
    name = data.davinci_connection.error_message.name
  }

  connection_link {
    id   = data.davinci_connection.flow_connector.id
    name = data.davinci_connection.flow_connector.name

    replace_import_connection_id = "2581eb287bb1d9bd29ae9886d675f89f"
  }

  connection_link {
    id   = data.davinci_connection.functions.id
    name = data.davinci_connection.functions.name
  }

  connection_link {
    id   = data.davinci_connection.ping_sso.id
    name = data.davinci_connection.ping_sso.name
  }

  connection_link {
    id   = data.davinci_connection.protect_connector.id
    name = data.davinci_connection.protect_connector.name
  }

  connection_link {
    id   = data.davinci_connection.node_connector.id
    name = data.davinci_connection.node_connector.name
  }

  subflow_link {
    id   = resource.davinci_flow.device_registration_subflow.id
    name = resource.davinci_flow.device_registration_subflow.name

    replace_import_subflow_id       = "647c3646a11f5fbba68d405eecf52a65"
  }

  subflow_link {
    id   = resource.davinci_flow.agreement_subflow.id
    name = resource.davinci_flow.agreement_subflow.name

    replace_import_subflow_id       = "4c2ca3a441a1d24d84e75a6e35470b87"
  }

  subflow_link {
    id   = resource.davinci_flow.verify_email_subflow.id
    name = resource.davinci_flow.verify_email_subflow.name

    replace_import_subflow_id       = "475be3d3d0ed42ace01503e8e95d6e8f"
  }

  subflow_link {
    id   = resource.davinci_flow.threat_detection_subflow.id
    name = resource.davinci_flow.threat_detection_subflow.name

    replace_import_subflow_id       = "fa75459607692f70b795bacd0a37b878"
  }

}

resource "davinci_flow" "agreement_subflow" {
  depends_on     = [data.davinci_connections.read_all]
  environment_id = pingone_environment.my_environment.id
  flow_json      = file("davinci-flows/agreement-subflow.json")

  connection_link {
    id   = data.davinci_connection.http_connector.id
    name = data.davinci_connection.http_connector.name
  }

  connection_link {
    id   = data.davinci_connection.annotation.id
    name = data.davinci_connection.annotation.name
  }

  connection_link {
    id   = data.davinci_connection.error_message.id
    name = data.davinci_connection.error_message.name
  }

  connection_link {
    id   = data.davinci_connection.functions.id
    name = data.davinci_connection.functions.name
  }

  connection_link {
    id   = data.davinci_connection.ping_sso.id
    name = data.davinci_connection.ping_sso.name
  }

  connection_link {
    id   = data.davinci_connection.node_connector.id
    name = data.davinci_connection.node_connector.name
  }
}

resource "davinci_flow" "change_password_subflow" {
  depends_on     = [data.davinci_connections.read_all]
  environment_id = pingone_environment.my_environment.id
  flow_json      = file("davinci-flows/change-password-subflow.json")

  connection_link {
    id   = data.davinci_connection.http_connector.id
    name = data.davinci_connection.http_connector.name
  }

  connection_link {
    id   = data.davinci_connection.variables.id
    name = data.davinci_connection.variables.name
  }

  connection_link {
    id   = data.davinci_connection.annotation.id
    name = data.davinci_connection.annotation.name
  }

  connection_link {
    id   = data.davinci_connection.error_message.id
    name = data.davinci_connection.error_message.name
  }

  connection_link {
    id   = data.davinci_connection.functions.id
    name = data.davinci_connection.functions.name
  }

  connection_link {
    id   = data.davinci_connection.ping_sso.id
    name = data.davinci_connection.ping_sso.name
  }

  connection_link {
    id   = data.davinci_connection.node_connector.id
    name = data.davinci_connection.node_connector.name
  }
}

resource "davinci_flow" "device_authentication_subflow" {
  depends_on     = [data.davinci_connections.read_all]
  environment_id = pingone_environment.my_environment.id
  flow_json      = file("davinci-flows/device-authn-subflow.json")

  connection_link {
    id   = data.davinci_connection.http_connector.id
    name = data.davinci_connection.http_connector.name
  }

  connection_link {
    id   = data.davinci_connection.variables.id
    name = data.davinci_connection.variables.name
  }

  connection_link {
    id   = data.davinci_connection.annotation.id
    name = data.davinci_connection.annotation.name
  }

  connection_link {
    id   = data.davinci_connection.error_message.id
    name = data.davinci_connection.error_message.name
  }

  connection_link {
    id   = data.davinci_connection.flow_connector.id
    name = data.davinci_connection.flow_connector.name
  }

  connection_link {
    id   = data.davinci_connection.functions.id
    name = data.davinci_connection.functions.name
  }

  connection_link {
    id   = data.davinci_connection.ping_sso.id
    name = data.davinci_connection.ping_sso.name
  }

  connection_link {
    id   = data.davinci_connection.pingone_mfa.id
    name = data.davinci_connection.pingone_mfa.name
  }

  connection_link {
    id   = data.davinci_connection.pingone_notifications.id
    name = data.davinci_connection.pingone_notifications.name
  }

  connection_link {
    id   = data.davinci_connection.protect_connector.id
    name = data.davinci_connection.protect_connector.name
  }

  connection_link {
    id   = data.davinci_connection.node_connector.id
    name = data.davinci_connection.node_connector.name
  }

  subflow_link {
    id   = resource.davinci_flow.magic_link_subflow.id
    name = resource.davinci_flow.magic_link_subflow.name

    replace_import_subflow_id       = "c990174d6bb04ddf2f712b74eb80fb8b"
  }

  subflow_link {
    id   = resource.davinci_flow.threat_detection_subflow.id
    name = resource.davinci_flow.threat_detection_subflow.name

    replace_import_subflow_id       = "fa75459607692f70b795bacd0a37b878"
  }
}

resource "davinci_flow" "magic_link_subflow" {
  depends_on     = [data.davinci_connections.read_all]
  environment_id = pingone_environment.my_environment.id
  flow_json      = file("davinci-flows/magiclink-authn-subflow.json")

  connection_link {
    id   = data.davinci_connection.http_connector.id
    name = data.davinci_connection.http_connector.name
  }

  connection_link {
    id   = data.davinci_connection.annotation.id
    name = data.davinci_connection.annotation.name
  }

  connection_link {
    id   = data.davinci_connection.flow_connector.id
    name = data.davinci_connection.flow_connector.name

    replace_import_connection_id = "2581eb287bb1d9bd29ae9886d675f89f"
  }

  connection_link {
    id   = data.davinci_connection.functions.id
    name = data.davinci_connection.functions.name
  }

  connection_link {
    id   = data.davinci_connection.ping_sso.id
    name = data.davinci_connection.ping_sso.name
  }

  connection_link {
    id   = data.davinci_connection.authentication_connector.id
    name = data.davinci_connection.authentication_connector.name
  }

  connection_link {
    id   = data.davinci_connection.pingone_notifications.id
    name = data.davinci_connection.pingone_notifications.name
  }

  connection_link {
    id   = data.davinci_connection.node_connector.id
    name = data.davinci_connection.node_connector.name
  }

  connection_link {
    id   = davinci_connection.challenge.id
    name = davinci_connection.challenge.name
  }

}

resource "davinci_flow" "device_registration_subflow" {
  depends_on     = [data.davinci_connections.read_all]
  environment_id = pingone_environment.my_environment.id
  flow_json      = file("davinci-flows/device-registration-subflow.json")

  connection_link {
    id   = data.davinci_connection.http_connector.id
    name = data.davinci_connection.http_connector.name
  }

  connection_link {
    id   = data.davinci_connection.variables.id
    name = data.davinci_connection.variables.name
  }

  connection_link {
    id   = data.davinci_connection.annotation.id
    name = data.davinci_connection.annotation.name
  }

  connection_link {
    id   = data.davinci_connection.error_message.id
    name = data.davinci_connection.error_message.name
  }

  connection_link {
    id   = data.davinci_connection.functions.id
    name = data.davinci_connection.functions.name
  }

  connection_link {
    id   = data.davinci_connection.pingone_mfa.id
    name = data.davinci_connection.pingone_mfa.name
  }

  connection_link {
    id   = data.davinci_connection.node_connector.id
    name = data.davinci_connection.node_connector.name
  }

  connection_link {
    id   = davinci_connection.strings.id
    name = davinci_connection.strings.name
  }
}

resource "davinci_flow" "threat_detection_subflow" {
  depends_on     = [data.davinci_connections.read_all]
  environment_id = pingone_environment.my_environment.id
  flow_json      = file("davinci-flows/threat-detection-subflow.json")

  connection_link {
    id   = data.davinci_connection.http_connector.id
    name = data.davinci_connection.http_connector.name
  }

  connection_link {
    id   = data.davinci_connection.annotation.id
    name = data.davinci_connection.annotation.name
  }

  connection_link {
    id   = data.davinci_connection.error_message.id
    name = data.davinci_connection.error_message.name
  }

  connection_link {
    id   = data.davinci_connection.functions.id
    name = data.davinci_connection.functions.name
  }

  connection_link {
    id   = data.davinci_connection.protect_connector.id
    name = data.davinci_connection.protect_connector.name
  }

}

resource "davinci_flow" "verify_email_subflow" {
  depends_on     = [data.davinci_connections.read_all]
  environment_id = pingone_environment.my_environment.id
  flow_json      = file("davinci-flows/verify-email-subflow.json")

  connection_link {
    id   = data.davinci_connection.http_connector.id
    name = data.davinci_connection.http_connector.name
  }

  connection_link {
    id   = data.davinci_connection.variables.id
    name = data.davinci_connection.variables.name
  }

  connection_link {
    id   = data.davinci_connection.annotation.id
    name = data.davinci_connection.annotation.name
  }

  connection_link {
    id   = data.davinci_connection.error_message.id
    name = data.davinci_connection.error_message.name
  }

  connection_link {
    id   = data.davinci_connection.functions.id
    name = data.davinci_connection.functions.name
  }

  connection_link {
    id   = data.davinci_connection.ping_sso.id
    name = data.davinci_connection.ping_sso.name
  }

  connection_link {
    id   = data.davinci_connection.node_connector.id
    name = data.davinci_connection.node_connector.name
  }
}

resource "davinci_flow" "device_management_flow" {
  depends_on     = [data.davinci_connections.read_all]
  environment_id = pingone_environment.my_environment.id
  flow_json      = file("davinci-flows/device-management-flow/device-management-mainflow.json")

  connection_link {
    id   = data.davinci_connection.http_connector.id
    name = data.davinci_connection.http_connector.name
  }

  connection_link {
    id   = data.davinci_connection.annotation.id
    name = data.davinci_connection.annotation.name
  }

  connection_link {
    id   = data.davinci_connection.flow_connector.id
    name = data.davinci_connection.flow_connector.name

    replace_import_connection_id = "2581eb287bb1d9bd29ae9886d675f89f"
  }

  connection_link {
    id   = data.davinci_connection.functions.id
    name = data.davinci_connection.functions.name
  }

  connection_link {
    id   = data.davinci_connection.ping_sso.id
    name = data.davinci_connection.ping_sso.name
  }

  connection_link {
    id   = data.davinci_connection.pingone_mfa.id
    name = data.davinci_connection.pingone_mfa.name
  }

  connection_link {
    id   = data.davinci_connection.node_connector.id
    name = data.davinci_connection.node_connector.name
  }

  subflow_link {
    id   = resource.davinci_flow.device_management_subflow.id
    name = resource.davinci_flow.device_management_subflow.name

    replace_import_subflow_id       = "67222b80a2c0c6fb387f7b66c35c3dd9"
  }

}

resource "davinci_flow" "device_management_subflow" {
  depends_on     = [data.davinci_connections.read_all]
  flow_json      = file("davinci-flows/device-management-flow/device-management-subflow.json")
  environment_id = pingone_environment.my_environment.id

  connection_link {
    id   = data.davinci_connection.http_connector.id
    name = data.davinci_connection.http_connector.name
  }

  connection_link {
    id   = data.davinci_connection.annotation.id
    name = data.davinci_connection.annotation.name
  }

  connection_link {
    id   = data.davinci_connection.error_message.id
    name = data.davinci_connection.error_message.name
  }

  connection_link {
    id   = data.davinci_connection.functions.id
    name = data.davinci_connection.functions.name
  }

  connection_link {
    id   = data.davinci_connection.node_connector.id
    name = data.davinci_connection.node_connector.name
  }

  connection_link {
    id   = data.davinci_connection.pingone_mfa.id
    name = data.davinci_connection.pingone_mfa.name
  }

   connection_link {
    id   = data.davinci_connection.variables.id
    name = data.davinci_connection.variables.name
  }

  connection_link {
    id   = davinci_connection.strings.id
    name = davinci_connection.strings.name
  } 

}

resource "davinci_flow" "password_reset_flow" {
  depends_on     = [data.davinci_connections.read_all]
  environment_id = pingone_environment.my_environment.id
  flow_json      = file("davinci-flows/password-reset-flow/password-reset-mainflow.json")

  connection_link {
    id   = data.davinci_connection.http_connector.id
    name = data.davinci_connection.http_connector.name
  }

  connection_link {
    id   = data.davinci_connection.annotation.id
    name = data.davinci_connection.annotation.name
  }

  connection_link {
    id   = data.davinci_connection.flow_connector.id
    name = data.davinci_connection.flow_connector.name

    replace_import_connection_id = "2581eb287bb1d9bd29ae9886d675f89f"
  }

  connection_link {
    id   = data.davinci_connection.functions.id
    name = data.davinci_connection.functions.name
  }

  connection_link {
    id   = data.davinci_connection.ping_sso.id
    name = data.davinci_connection.ping_sso.name
  }

  connection_link {
    id   = data.davinci_connection.node_connector.id
    name = data.davinci_connection.node_connector.name
  }

  subflow_link {
    id   = resource.davinci_flow.password_reset_subflow.id
    name = resource.davinci_flow.password_reset_subflow.name

    replace_import_subflow_id       = "d3a8aa9c2469529fc3c7d0a4e9916ed8"
  }

}

resource "davinci_flow" "password_reset_subflow" {
  depends_on     = [data.davinci_connections.read_all]
  flow_json      = file("davinci-flows/password-reset-flow/password-reset-subflow.json")
  environment_id = pingone_environment.my_environment.id

  connection_link {
    id   = data.davinci_connection.http_connector.id
    name = data.davinci_connection.http_connector.name
  }

  connection_link {
    id   = data.davinci_connection.annotation.id
    name = data.davinci_connection.annotation.name
  }

  connection_link {
    id   = data.davinci_connection.error_message.id
    name = data.davinci_connection.error_message.name
  }

  connection_link {
    id   = data.davinci_connection.functions.id
    name = data.davinci_connection.functions.name
  }

  connection_link {
    id   = data.davinci_connection.ping_sso.id
    name = data.davinci_connection.ping_sso.name
  }

  connection_link {
    id   = data.davinci_connection.node_connector.id
    name = data.davinci_connection.node_connector.name
  }

}

resource "davinci_flow" "profile_management_flow" {
  depends_on     = [data.davinci_connections.read_all]
  environment_id = pingone_environment.my_environment.id
  flow_json      = file("davinci-flows/profile-management-flow.json")

  connection_link {
    id   = data.davinci_connection.http_connector.id
    name = data.davinci_connection.http_connector.name
  }

  connection_link {
    id   = data.davinci_connection.variables.id
    name = data.davinci_connection.variables.name
  }

  connection_link {
    id   = data.davinci_connection.annotation.id
    name = data.davinci_connection.annotation.name
  }

  connection_link {
    id   = data.davinci_connection.error_message.id
    name = data.davinci_connection.error_message.name
  }

  connection_link {
    id   = data.davinci_connection.functions.id
    name = data.davinci_connection.functions.name
  }

  connection_link {
    id   = data.davinci_connection.ping_sso.id
    name = data.davinci_connection.ping_sso.name
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

resource "davinci_application" "passwordless_main_flow_app" {
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
}

resource "davinci_application_flow_policy" "registration_flow_policy"  {
  depends_on = [data.davinci_connections.read_all]
  environment_id = pingone_environment.my_environment.id
  application_id = davinci_application.passwordless_main_flow_app.id
  name   = "DaVinci OIDC Passwordless Sample Policy"
  status = "enabled"
  policy_flow {
    flow_id    = resource.davinci_flow.passwordless_main_flow.id
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

resource "davinci_variable" "ciam_protectriskPolicyId" {
  depends_on     = [data.http.get_risk_policy_id,data.davinci_connections.read_all]
  name           = "ciam_protectriskPolicyId"
  environment_id = pingone_environment.my_environment.id
  description    = "Default Risk Policy ID"
  context        = "company"
  value          = "${local.policy_id}"
  type           = "string"
}

resource "davinci_variable" "ciam_protectriskPolicyId_flow" {
  depends_on     = [data.http.get_risk_policy_id,data.davinci_connections.read_all]
  name           = "ciam_protectriskPolicyId"
  environment_id = pingone_environment.my_environment.id
  description    = "Default Risk Policy ID"
  context        = "flowInstance"
  value          = "${local.policy_id}"
  type           = "string"
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