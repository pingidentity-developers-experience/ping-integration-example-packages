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

// Flow Name: CIAM-Passwordless-Protect-Account-Recovery-Subflow
resource "davinci_flow" "ciam_passwordless_protect_account_recovery_subflow" {
  depends_on = [
    davinci_variable.ciam_errorconnector,
    davinci_variable.ciam_protectdevicestatus,
    davinci_variable.ciam_protectpredictor,
    davinci_variable.ciam_protectriskid,
    davinci_variable.ciam_protectrisklevel,
    davinci_variable.ciam_protectriskpolicyid,
    davinci_variable.ciam_recoverylimit,
    davinci_variable.ciam_recoveryvalidationattempts,
  ]

  environment_id = pingone_environment.my_environment.id

  name        = "CIAM-Passwordless-Protect-Account-Recovery-Subflow"
  description = "Imported on Tue May 14 2024 18:46:55 GMT+0000 (Coordinated Universal Time)"

  flow_json = file("./davinci-flows/account-recovery-subflow.json")


  // Connector link: annotationConnector
  connection_link {
    id                           = data.davinci_connection.annotation.id
    name                         = data.davinci_connection.annotation.name
    replace_import_connection_id = "921bfae85c38ed45045e07be703d86b8"
  }

  // Connector link: errorConnector
  connection_link {
    id                           = data.davinci_connection.error_message.id
    name                         = data.davinci_connection.error_message.name
    replace_import_connection_id = "53ab83a4a4ab919d9f2cb02d9e111ac8"
  }

  // Connector link: flowConnector
  connection_link {
    id                           = data.davinci_connection.flow_connector.id
    name                         = data.davinci_connection.flow_connector.name
    replace_import_connection_id = "2581eb287bb1d9bd29ae9886d675f89f"
  }

  // Connector link: functionsConnector
  connection_link {
    id                           = data.davinci_connection.functions.id
    name                         = data.davinci_connection.functions.name
    replace_import_connection_id = "de650ca45593b82c49064ead10b9fe17"
  }

  // Connector link: httpConnector
  connection_link {
    id                           = data.davinci_connection.http_connector.id
    name                         = data.davinci_connection.http_connector.name
    replace_import_connection_id = "867ed4363b2bc21c860085ad2baa817d"
  }

  // Connector link: nodeConnector
  connection_link {
    id                           = data.davinci_connection.node_connector.id
    name                         = data.davinci_connection.node_connector.name
    replace_import_connection_id = "e7eae662d2ca276e4c6f097fc36a3bb1"
  }

  // Connector link: notificationsConnector
  connection_link {
    id                           = data.davinci_connection.pingone_notifications.id
    name                         = data.davinci_connection.pingone_notifications.name
    replace_import_connection_id = "cacf3d2861657174d93cbf445d55797a"
  }

  // Connector link: pingOneRiskConnector
  connection_link {
    id                           = data.davinci_connection.protect_connector.id
    name                         = data.davinci_connection.protect_connector.name
    replace_import_connection_id = "292873d5ceea806d81373ed0341b5c88"
  }

  // Connector link: pingOneSSOConnector
  connection_link {
    id                           = data.davinci_connection.ping_sso.id
    name                         = data.davinci_connection.ping_sso.name
    replace_import_connection_id = "94141bf2f1b9b59a5f5365ff135e02bb"
  }

  // Connector link: variablesConnector
  connection_link {
    id                           = data.davinci_connection.variables.id
    name                         = data.davinci_connection.variables.name
    replace_import_connection_id = "06922a684039827499bdbdd97f49827b"
  }


  // Subflow link: CIAM-Passwordless-Protect-Threat-Detection-Subflow
  subflow_link {
    id                        = davinci_flow.ciam_passwordless_protect_threat_detection_subflow.id
    name                      = davinci_flow.ciam_passwordless_protect_threat_detection_subflow.name
    replace_import_subflow_id = "fa75459607692f70b795bacd0a37b878"
  }
}

// Flow Name: CIAM-Passwordless-Protect-Account-Registration-Subflow
resource "davinci_flow" "ciam_passwordless_protect_account_registration_subflow" {
  depends_on = [
    davinci_variable.ciam_errorconnector,
    davinci_variable.ciam_protectdevicestatus,
    davinci_variable.ciam_protectpredictor,
    davinci_variable.ciam_protectriskid,
    davinci_variable.ciam_protectrisklevel,
    davinci_variable.ciam_protectriskpolicyid,
  ]

  environment_id = pingone_environment.my_environment.id

  name        = "CIAM-Passwordless-Protect-Account-Registration-Subflow"
  description = "Imported on Tue May 14 2024 18:46:55 GMT+0000 (Coordinated Universal Time)"

  flow_json = file("./davinci-flows/account-reg-subflow.json")


  // Connector link: annotationConnector
  connection_link {
    id                           = data.davinci_connection.annotation.id
    name                         = data.davinci_connection.annotation.name
    replace_import_connection_id = "921bfae85c38ed45045e07be703d86b8"
  }

  // Connector link: errorConnector
  connection_link {
    id                           = data.davinci_connection.error_message.id
    name                         = data.davinci_connection.error_message.name
    replace_import_connection_id = "53ab83a4a4ab919d9f2cb02d9e111ac8"
  }

  // Connector link: flowConnector
  connection_link {
    id                           = data.davinci_connection.flow_connector.id
    name                         = data.davinci_connection.flow_connector.name
    replace_import_connection_id = "2581eb287bb1d9bd29ae9886d675f89f"
  }

  // Connector link: functionsConnector
  connection_link {
    id                           = data.davinci_connection.functions.id
    name                         = data.davinci_connection.functions.name
    replace_import_connection_id = "de650ca45593b82c49064ead10b9fe17"
  }

  // Connector link: httpConnector
  connection_link {
    id                           = data.davinci_connection.http_connector.id
    name                         = data.davinci_connection.http_connector.name
    replace_import_connection_id = "867ed4363b2bc21c860085ad2baa817d"
  }

  // Connector link: nodeConnector
  connection_link {
    id                           = data.davinci_connection.node_connector.id
    name                         = data.davinci_connection.node_connector.name
    replace_import_connection_id = "e7eae662d2ca276e4c6f097fc36a3bb1"
  }

  // Connector link: pingOneRiskConnector
  connection_link {
    id                           = data.davinci_connection.protect_connector.id
    name                         = data.davinci_connection.protect_connector.name
    replace_import_connection_id = "292873d5ceea806d81373ed0341b5c88"
  }

  // Connector link: pingOneSSOConnector
  connection_link {
    id                           = data.davinci_connection.ping_sso.id
    name                         = data.davinci_connection.ping_sso.name
    replace_import_connection_id = "94141bf2f1b9b59a5f5365ff135e02bb"
  }

  // Connector link: variablesConnector
  connection_link {
    id                           = data.davinci_connection.variables.id
    name                         = data.davinci_connection.variables.name
    replace_import_connection_id = "06922a684039827499bdbdd97f49827b"
  }


  // Subflow link: CIAM-Passwordless-Protect-Agreement(ToS)-Subflow
  subflow_link {
    id                        = davinci_flow.ciam_passwordless_protect_agreement_tos_subflow.id
    name                      = davinci_flow.ciam_passwordless_protect_agreement_tos_subflow.name
    replace_import_subflow_id = "4c2ca3a441a1d24d84e75a6e35470b87"
  }

  // Subflow link: CIAM-Passwordless-Protect-Device-Registration-Subflow
  subflow_link {
    id                        = davinci_flow.ciam_passwordless_protect_device_registration_subflow.id
    name                      = davinci_flow.ciam_passwordless_protect_device_registration_subflow.name
    replace_import_subflow_id = "647c3646a11f5fbba68d405eecf52a65"
  }

  // Subflow link: CIAM-Passwordless-Protect-Threat-Detection-Subflow
  subflow_link {
    id                        = davinci_flow.ciam_passwordless_protect_threat_detection_subflow.id
    name                      = davinci_flow.ciam_passwordless_protect_threat_detection_subflow.name
    replace_import_subflow_id = "fa75459607692f70b795bacd0a37b878"
  }

  // Subflow link: CIAM-Passwordless-Protect-Verify-Email-Subflow
  subflow_link {
    id                        = davinci_flow.ciam_passwordless_protect_verify_email_subflow.id
    name                      = davinci_flow.ciam_passwordless_protect_verify_email_subflow.name
    replace_import_subflow_id = "475be3d3d0ed42ace01503e8e95d6e8f"
  }
}

// Flow Name: CIAM-Passwordless-Protect-Agreement(ToS)-Subflow
resource "davinci_flow" "ciam_passwordless_protect_agreement_tos_subflow" {

  environment_id = pingone_environment.my_environment.id

  name        = "CIAM-Passwordless-Protect-Agreement(ToS)-Subflow"
  description = "Imported on Tue May 14 2024 18:46:54 GMT+0000 (Coordinated Universal Time)"

  flow_json = file("./davinci-flows/agreement-subflow.json")


  // Connector link: annotationConnector
  connection_link {
    id                           = data.davinci_connection.annotation.id
    name                         = data.davinci_connection.annotation.name
    replace_import_connection_id = "921bfae85c38ed45045e07be703d86b8"
  }

  // Connector link: errorConnector
  connection_link {
    id                           = data.davinci_connection.error_message.id
    name                         = data.davinci_connection.error_message.name
    replace_import_connection_id = "53ab83a4a4ab919d9f2cb02d9e111ac8"
  }

  // Connector link: functionsConnector
  connection_link {
    id                           = data.davinci_connection.functions.id
    name                         = data.davinci_connection.functions.name
    replace_import_connection_id = "de650ca45593b82c49064ead10b9fe17"
  }

  // Connector link: httpConnector
  connection_link {
    id                           = data.davinci_connection.http_connector.id
    name                         = data.davinci_connection.http_connector.name
    replace_import_connection_id = "867ed4363b2bc21c860085ad2baa817d"
  }

  // Connector link: nodeConnector
  connection_link {
    id                           = data.davinci_connection.node_connector.id
    name                         = data.davinci_connection.node_connector.name
    replace_import_connection_id = "e7eae662d2ca276e4c6f097fc36a3bb1"
  }

  // Connector link: pingOneSSOConnector
  connection_link {
    id                           = data.davinci_connection.ping_sso.id
    name                         = data.davinci_connection.ping_sso.name
    replace_import_connection_id = "94141bf2f1b9b59a5f5365ff135e02bb"
  }
}

// Flow Name: CIAM-Passwordless-Protect-Change-Password-Subflow
resource "davinci_flow" "ciam_passwordless_protect_change_password_subflow" {
  depends_on = [
    davinci_variable.ciam_errorconnector,
  ]

  environment_id = pingone_environment.my_environment.id

  name        = "CIAM-Passwordless-Protect-Change-Password-Subflow"
  description = "Imported on Tue May 14 2024 18:46:54 GMT+0000 (Coordinated Universal Time)"

  flow_json = file("./davinci-flows/change-password-subflow.json")


  // Connector link: annotationConnector
  connection_link {
    id                           = data.davinci_connection.annotation.id
    name                         = data.davinci_connection.annotation.name
    replace_import_connection_id = "921bfae85c38ed45045e07be703d86b8"
  }

  // Connector link: errorConnector
  connection_link {
    id                           = data.davinci_connection.error_message.id
    name                         = data.davinci_connection.error_message.name
    replace_import_connection_id = "53ab83a4a4ab919d9f2cb02d9e111ac8"
  }

  // Connector link: functionsConnector
  connection_link {
    id                           = data.davinci_connection.functions.id
    name                         = data.davinci_connection.functions.name
    replace_import_connection_id = "de650ca45593b82c49064ead10b9fe17"
  }

  // Connector link: httpConnector
  connection_link {
    id                           = data.davinci_connection.http_connector.id
    name                         = data.davinci_connection.http_connector.name
    replace_import_connection_id = "867ed4363b2bc21c860085ad2baa817d"
  }

  // Connector link: nodeConnector
  connection_link {
    id                           = data.davinci_connection.node_connector.id
    name                         = data.davinci_connection.node_connector.name
    replace_import_connection_id = "e7eae662d2ca276e4c6f097fc36a3bb1"
  }

  // Connector link: pingOneSSOConnector
  connection_link {
    id                           = data.davinci_connection.ping_sso.id
    name                         = data.davinci_connection.ping_sso.name
    replace_import_connection_id = "94141bf2f1b9b59a5f5365ff135e02bb"
  }

  // Connector link: variablesConnector
  connection_link {
    id                           = data.davinci_connection.variables.id
    name                         = data.davinci_connection.variables.name
    replace_import_connection_id = "06922a684039827499bdbdd97f49827b"
  }
}

// Flow Name: CIAM-Passwordless-Protect-Device-Authentication-Subflow
resource "davinci_flow" "ciam_passwordless_protect_device_authentication_subflow" {
  depends_on = [
    davinci_variable.ciam_protectdevicestatus,
    davinci_variable.ciam_protectpredictor,
    davinci_variable.ciam_protectriskid,
    davinci_variable.ciam_protectrisklevel,
    davinci_variable.ciam_protectriskpolicyid,
  ]

  environment_id = pingone_environment.my_environment.id

  name        = "CIAM-Passwordless-Protect-Device-Authentication-Subflow"
  description = "Imported on Tue May 14 2024 18:46:55 GMT+0000 (Coordinated Universal Time)"

  flow_json = file("./davinci-flows/device-authn-subflow.json")


  // Connector link: annotationConnector
  connection_link {
    id                           = data.davinci_connection.annotation.id
    name                         = data.davinci_connection.annotation.name
    replace_import_connection_id = "921bfae85c38ed45045e07be703d86b8"
  }

  // Connector link: errorConnector
  connection_link {
    id                           = data.davinci_connection.error_message.id
    name                         = data.davinci_connection.error_message.name
    replace_import_connection_id = "53ab83a4a4ab919d9f2cb02d9e111ac8"
  }

  // Connector link: flowConnector
  connection_link {
    id                           = data.davinci_connection.flow_connector.id
    name                         = data.davinci_connection.flow_connector.name
    replace_import_connection_id = "2581eb287bb1d9bd29ae9886d675f89f"
  }

  // Connector link: functionsConnector
  connection_link {
    id                           = data.davinci_connection.functions.id
    name                         = data.davinci_connection.functions.name
    replace_import_connection_id = "de650ca45593b82c49064ead10b9fe17"
  }

  // Connector link: httpConnector
  connection_link {
    id                           = data.davinci_connection.http_connector.id
    name                         = data.davinci_connection.http_connector.name
    replace_import_connection_id = "867ed4363b2bc21c860085ad2baa817d"
  }

  // Connector link: nodeConnector
  connection_link {
    id                           = data.davinci_connection.node_connector.id
    name                         = data.davinci_connection.node_connector.name
    replace_import_connection_id = "e7eae662d2ca276e4c6f097fc36a3bb1"
  }

  // Connector link: notificationsConnector
  connection_link {
    id                           = data.davinci_connection.pingone_notifications.id
    name                         = data.davinci_connection.pingone_notifications.name
    replace_import_connection_id = "cacf3d2861657174d93cbf445d55797a"
  }

  // Connector link: pingOneMfaConnector
  connection_link {
    id                           = data.davinci_connection.pingone_mfa.id
    name                         = data.davinci_connection.pingone_mfa.name
    replace_import_connection_id = "b72bd44e6be8180bd5988ac74cd9c949"
  }

  // Connector link: pingOneRiskConnector
  connection_link {
    id                           = data.davinci_connection.protect_connector.id
    name                         = data.davinci_connection.protect_connector.name
    replace_import_connection_id = "292873d5ceea806d81373ed0341b5c88"
  }

  // Connector link: pingOneSSOConnector
  connection_link {
    id                           = data.davinci_connection.ping_sso.id
    name                         = data.davinci_connection.ping_sso.name
    replace_import_connection_id = "94141bf2f1b9b59a5f5365ff135e02bb"
  }

  // Connector link: variablesConnector
  connection_link {
    id                           = data.davinci_connection.variables.id
    name                         = data.davinci_connection.variables.name
    replace_import_connection_id = "06922a684039827499bdbdd97f49827b"
  }


  // Subflow link: CIAM-Passwordless-Protect-Magic-Link-Authentication-Subflow
  subflow_link {
    id                        = davinci_flow.ciam_passwordless_protect_magic_link_authentication_subflow.id
    name                      = davinci_flow.ciam_passwordless_protect_magic_link_authentication_subflow.name
    replace_import_subflow_id = "c990174d6bb04ddf2f712b74eb80fb8b"
  }

  // Subflow link: CIAM-Passwordless-Protect-Threat-Detection-Subflow
  subflow_link {
    id                        = davinci_flow.ciam_passwordless_protect_threat_detection_subflow.id
    name                      = davinci_flow.ciam_passwordless_protect_threat_detection_subflow.name
    replace_import_subflow_id = "fa75459607692f70b795bacd0a37b878"
  }
}

// Flow Name: CIAM-Passwordless-Protect-Device-Registration-Subflow
resource "davinci_flow" "ciam_passwordless_protect_device_registration_subflow" {
  depends_on = [
    davinci_variable.ciam_deviceid,
  ]

  environment_id = pingone_environment.my_environment.id

  name        = "CIAM-Passwordless-Protect-Device-Registration-Subflow"
  description = "Imported on Tue May 14 2024 18:46:54 GMT+0000 (Coordinated Universal Time)"

  flow_json = file("./davinci-flows/device-registration-subflow.json")


  // Connector link: annotationConnector
  connection_link {
    id                           = data.davinci_connection.annotation.id
    name                         = data.davinci_connection.annotation.name
    replace_import_connection_id = "921bfae85c38ed45045e07be703d86b8"
  }

  // Connector link: errorConnector
  connection_link {
    id                           = data.davinci_connection.error_message.id
    name                         = data.davinci_connection.error_message.name
    replace_import_connection_id = "53ab83a4a4ab919d9f2cb02d9e111ac8"
  }

  // Connector link: functionsConnector
  connection_link {
    id                           = data.davinci_connection.functions.id
    name                         = data.davinci_connection.functions.name
    replace_import_connection_id = "de650ca45593b82c49064ead10b9fe17"
  }

  // Connector link: httpConnector
  connection_link {
    id                           = data.davinci_connection.http_connector.id
    name                         = data.davinci_connection.http_connector.name
    replace_import_connection_id = "867ed4363b2bc21c860085ad2baa817d"
  }

  // Connector link: nodeConnector
  connection_link {
    id                           = data.davinci_connection.node_connector.id
    name                         = data.davinci_connection.node_connector.name
    replace_import_connection_id = "e7eae662d2ca276e4c6f097fc36a3bb1"
  }

  // Connector link: pingOneMfaConnector
  connection_link {
    id                           = data.davinci_connection.pingone_mfa.id
    name                         = data.davinci_connection.pingone_mfa.name
    replace_import_connection_id = "b72bd44e6be8180bd5988ac74cd9c949"
  }

  // Connector link: stringsConnector
  connection_link {
    id                           = davinci_connection.stringsconnector__d49474a1b556eb233d3376c918eb3497.id
    name                         = davinci_connection.stringsconnector__d49474a1b556eb233d3376c918eb3497.name
    replace_import_connection_id = "d49474a1b556eb233d3376c918eb3497"
  }

  // Connector link: variablesConnector
  connection_link {
    id                           = data.davinci_connection.variables.id
    name                         = data.davinci_connection.variables.name
    replace_import_connection_id = "06922a684039827499bdbdd97f49827b"
  }
}

// Flow Name: CIAM-Passwordless-Protect-Magic-Link-Authentication-Subflow
resource "davinci_flow" "ciam_passwordless_protect_magic_link_authentication_subflow" {
  depends_on = [
    davinci_variable.ciam_companyname,
    davinci_variable.ciam_logostyle,
    davinci_variable.ciam_logourl,
  ]

  environment_id = pingone_environment.my_environment.id

  name        = "CIAM-Passwordless-Protect-Magic-Link-Authentication-Subflow"
  description = "Imported on Tue May 14 2024 20:50:46 GMT+0000 (Coordinated Universal Time)"

  flow_json = file("./davinci-flows/magiclink-authn-subflow.json")


  // Connector link: annotationConnector
  connection_link {
    id                           = data.davinci_connection.annotation.id
    name                         = data.davinci_connection.annotation.name
    replace_import_connection_id = "921bfae85c38ed45045e07be703d86b8"
  }

  // Connector link: challengeConnector
  connection_link {
    id                           = davinci_connection.challengeconnector__94cb18cc8ee6ddaf28e881b16637aec6.id
    name                         = davinci_connection.challengeconnector__94cb18cc8ee6ddaf28e881b16637aec6.name
    replace_import_connection_id = "94cb18cc8ee6ddaf28e881b16637aec6"
  }

  // Connector link: flowConnector
  connection_link {
    id                           = data.davinci_connection.flow_connector.id
    name                         = data.davinci_connection.flow_connector.name
    replace_import_connection_id = "2581eb287bb1d9bd29ae9886d675f89f"
  }

  // Connector link: functionsConnector
  connection_link {
    id                           = data.davinci_connection.functions.id
    name                         = data.davinci_connection.functions.name
    replace_import_connection_id = "de650ca45593b82c49064ead10b9fe17"
  }

  // Connector link: httpConnector
  connection_link {
    id                           = data.davinci_connection.http_connector.id
    name                         = data.davinci_connection.http_connector.name
    replace_import_connection_id = "867ed4363b2bc21c860085ad2baa817d"
  }

  // Connector link: nodeConnector
  connection_link {
    id                           = data.davinci_connection.node_connector.id
    name                         = data.davinci_connection.node_connector.name
    replace_import_connection_id = "e7eae662d2ca276e4c6f097fc36a3bb1"
  }

  // Connector link: notificationsConnector
  connection_link {
    id                           = data.davinci_connection.pingone_notifications.id
    name                         = data.davinci_connection.pingone_notifications.name
    replace_import_connection_id = "cacf3d2861657174d93cbf445d55797a"
  }

  // Connector link: pingOneSSOConnector
  connection_link {
    id                           = data.davinci_connection.ping_sso.id
    name                         = data.davinci_connection.ping_sso.name
    replace_import_connection_id = "94141bf2f1b9b59a5f5365ff135e02bb"
  }
}

// Flow Name: CIAM-Passwordless-Protect-Registration-Authentication-Account-Recovery-Main Flow
resource "davinci_flow" "ciam_passwordless_protect_registration_authentication_account_recovery_main_flow" {
  depends_on = [
    davinci_variable.agreementid,
    davinci_variable.ciam_accountrecoveryenabled,
    davinci_variable.ciam_agreementenabled,
    davinci_variable.ciam_appleenabled,
    davinci_variable.ciam_authmethod,
    davinci_variable.ciam_companyname,
    davinci_variable.ciam_emailotpenabled,
    davinci_variable.ciam_facebookenabled,
    davinci_variable.ciam_fidopasskeyenabled,
    davinci_variable.ciam_googleenabled,
    davinci_variable.ciam_logostyle,
    davinci_variable.ciam_logourl,
    davinci_variable.ciam_magiclinkenabled,
    davinci_variable.ciam_passwordlessrequired,
    davinci_variable.ciam_protectdevicestatus,
    davinci_variable.ciam_protectpredictor,
    davinci_variable.ciam_protectriskid,
    davinci_variable.ciam_protectrisklevel,
    davinci_variable.ciam_protectriskpolicyid,
    davinci_variable.ciam_sessionlengthinminute,
    davinci_variable.ciam_smsotpenabled,
  ]

  environment_id = pingone_environment.my_environment.id

  name        = "CIAM-Passwordless-Protect-Registration-Authentication-Account-Recovery-Main Flow"
  description = "Imported on Wed May 15 2024 17:02:07 GMT+0000 (Coordinated Universal Time)"

  flow_json = file("./davinci-flows/davinci-oidc-passwordless-flow.json")


  // Connector link: annotationConnector
  connection_link {
    id                           = data.davinci_connection.annotation.id
    name                         = data.davinci_connection.annotation.name
    replace_import_connection_id = "921bfae85c38ed45045e07be703d86b8"
  }

  // Connector link: errorConnector
  connection_link {
    id                           = data.davinci_connection.error_message.id
    name                         = data.davinci_connection.error_message.name
    replace_import_connection_id = "53ab83a4a4ab919d9f2cb02d9e111ac8"
  }

  // Connector link: flowConnector
  connection_link {
    id                           = data.davinci_connection.flow_connector.id
    name                         = data.davinci_connection.flow_connector.name
    replace_import_connection_id = "2581eb287bb1d9bd29ae9886d675f89f"
  }

  // Connector link: functionsConnector
  connection_link {
    id                           = data.davinci_connection.functions.id
    name                         = data.davinci_connection.functions.name
    replace_import_connection_id = "de650ca45593b82c49064ead10b9fe17"
  }

  // Connector link: httpConnector
  connection_link {
    id                           = data.davinci_connection.http_connector.id
    name                         = data.davinci_connection.http_connector.name
    replace_import_connection_id = "867ed4363b2bc21c860085ad2baa817d"
  }

  // Connector link: nodeConnector
  connection_link {
    id                           = data.davinci_connection.node_connector.id
    name                         = data.davinci_connection.node_connector.name
    replace_import_connection_id = "e7eae662d2ca276e4c6f097fc36a3bb1"
  }

  // Connector link: notificationsConnector
  connection_link {
    id                           = data.davinci_connection.pingone_notifications.id
    name                         = data.davinci_connection.pingone_notifications.name
    replace_import_connection_id = "cacf3d2861657174d93cbf445d55797a"
  }

  // Connector link: pingOneAuthenticationConnector
  connection_link {
    id                           = data.davinci_connection.authentication_connector.id
    name                         = data.davinci_connection.authentication_connector.name
    replace_import_connection_id = "c3e6a164bde107954e93f5c09f0c8bce"
  }

  // Connector link: pingOneMfaConnector
  connection_link {
    id                           = data.davinci_connection.pingone_mfa.id
    name                         = data.davinci_connection.pingone_mfa.name
    replace_import_connection_id = "b72bd44e6be8180bd5988ac74cd9c949"
  }

  // Connector link: pingOneRiskConnector
  connection_link {
    id                           = data.davinci_connection.protect_connector.id
    name                         = data.davinci_connection.protect_connector.name
    replace_import_connection_id = "292873d5ceea806d81373ed0341b5c88"
  }

  // Connector link: pingOneSSOConnector
  connection_link {
    id                           = data.davinci_connection.ping_sso.id
    name                         = data.davinci_connection.ping_sso.name
    replace_import_connection_id = "94141bf2f1b9b59a5f5365ff135e02bb"
  }

  // Connector link: variablesConnector
  connection_link {
    id                           = data.davinci_connection.variables.id
    name                         = data.davinci_connection.variables.name
    replace_import_connection_id = "06922a684039827499bdbdd97f49827b"
  }


  // Subflow link: CIAM-Passwordless-Protect-Account-Recovery-Subflow
  subflow_link {
    id                        = davinci_flow.ciam_passwordless_protect_account_recovery_subflow.id
    name                      = davinci_flow.ciam_passwordless_protect_account_recovery_subflow.name
    replace_import_subflow_id = "364df5f173b46e296fdd0a128de61ee8"
  }

  // Subflow link: CIAM-Passwordless-Protect-Account-Registration-Subflow
  subflow_link {
    id                        = davinci_flow.ciam_passwordless_protect_account_registration_subflow.id
    name                      = davinci_flow.ciam_passwordless_protect_account_registration_subflow.name
    replace_import_subflow_id = "ed7202d8251c0980d41119b324980c91"
  }

  // Subflow link: CIAM-Passwordless-Protect-Agreement(ToS)-Subflow
  subflow_link {
    id                        = davinci_flow.ciam_passwordless_protect_agreement_tos_subflow.id
    name                      = davinci_flow.ciam_passwordless_protect_agreement_tos_subflow.name
    replace_import_subflow_id = "02ef9161e97275f09faf2925b4173d77"
  }

  // Subflow link: CIAM-Passwordless-Protect-Change-Password-Subflow
  subflow_link {
    id                        = davinci_flow.ciam_passwordless_protect_change_password_subflow.id
    name                      = davinci_flow.ciam_passwordless_protect_change_password_subflow.name
    replace_import_subflow_id = "f33a958f628aa8368027ca75240103c6"
  }

  // Subflow link: CIAM-Passwordless-Protect-Device-Authentication-Subflow
  subflow_link {
    id                        = davinci_flow.ciam_passwordless_protect_device_authentication_subflow.id
    name                      = davinci_flow.ciam_passwordless_protect_device_authentication_subflow.name
    replace_import_subflow_id = "6fc11379c939d1f89efb42105dcd4295"
  }

  // Subflow link: CIAM-Passwordless-Protect-Threat-Detection-Subflow
  subflow_link {
    id                        = davinci_flow.ciam_passwordless_protect_threat_detection_subflow.id
    name                      = davinci_flow.ciam_passwordless_protect_threat_detection_subflow.name
    replace_import_subflow_id = "d76548b32520975dfb808ab5a2bf4d25"
  }

  // Subflow link: CIAM-Passwordless-Protect-Verify-Email-Subflow
  subflow_link {
    id                        = davinci_flow.ciam_passwordless_protect_verify_email_subflow.id
    name                      = davinci_flow.ciam_passwordless_protect_verify_email_subflow.name
    replace_import_subflow_id = "0ca2d9bf2d20379a006aff1ef4f17e0f"
  }
}

// Flow Name: CIAM-Passwordless-Protect-Threat-Detection-Subflow
resource "davinci_flow" "ciam_passwordless_protect_threat_detection_subflow" {
  depends_on = [
    # davinci_variable.companyname,
  ]

  environment_id = pingone_environment.my_environment.id

  name        = "CIAM-Passwordless-Protect-Threat-Detection-Subflow"
  description = "Imported on Tue May 14 2024 18:46:53 GMT+0000 (Coordinated Universal Time)"

  flow_json = file("./davinci-flows/threat-detection-subflow.json")


  // Connector link: annotationConnector
  connection_link {
    id                           = data.davinci_connection.annotation.id
    name                         = data.davinci_connection.annotation.name
    replace_import_connection_id = "921bfae85c38ed45045e07be703d86b8"
  }

  // Connector link: errorConnector
  connection_link {
    id                           = data.davinci_connection.error_message.id
    name                         = data.davinci_connection.error_message.name
    replace_import_connection_id = "53ab83a4a4ab919d9f2cb02d9e111ac8"
  }

  // Connector link: functionsConnector
  connection_link {
    id                           = data.davinci_connection.functions.id
    name                         = data.davinci_connection.functions.name
    replace_import_connection_id = "de650ca45593b82c49064ead10b9fe17"
  }

  // Connector link: httpConnector
  connection_link {
    id                           = data.davinci_connection.http_connector.id
    name                         = data.davinci_connection.http_connector.name
    replace_import_connection_id = "867ed4363b2bc21c860085ad2baa817d"
  }

  // Connector link: pingOneRiskConnector
  connection_link {
    id                           = data.davinci_connection.protect_connector.id
    name                         = data.davinci_connection.protect_connector.name
    replace_import_connection_id = "292873d5ceea806d81373ed0341b5c88"
  }
}

// Flow Name: CIAM-Passwordless-Protect-Verify-Email-Subflow
resource "davinci_flow" "ciam_passwordless_protect_verify_email_subflow" {
  depends_on = [
    davinci_variable.ciam_verificationlimit,
    davinci_variable.ciam_verificationvalidationattempts,
  ]

  environment_id = pingone_environment.my_environment.id

  name        = "CIAM-Passwordless-Protect-Verify-Email-Subflow"
  description = "Imported on Tue May 14 2024 18:46:53 GMT+0000 (Coordinated Universal Time)"

  flow_json = file("./davinci-flows/verify-email-subflow.json")


  // Connector link: annotationConnector
  connection_link {
    id                           = data.davinci_connection.annotation.id
    name                         = data.davinci_connection.annotation.name
    replace_import_connection_id = "921bfae85c38ed45045e07be703d86b8"
  }

  // Connector link: errorConnector
  connection_link {
    id                           = data.davinci_connection.error_message.id
    name                         = data.davinci_connection.error_message.name
    replace_import_connection_id = "53ab83a4a4ab919d9f2cb02d9e111ac8"
  }

  // Connector link: functionsConnector
  connection_link {
    id                           = data.davinci_connection.functions.id
    name                         = data.davinci_connection.functions.name
    replace_import_connection_id = "de650ca45593b82c49064ead10b9fe17"
  }

  // Connector link: httpConnector
  connection_link {
    id                           = data.davinci_connection.http_connector.id
    name                         = data.davinci_connection.http_connector.name
    replace_import_connection_id = "867ed4363b2bc21c860085ad2baa817d"
  }

  // Connector link: nodeConnector
  connection_link {
    id                           = data.davinci_connection.node_connector.id
    name                         = data.davinci_connection.node_connector.name
    replace_import_connection_id = "e7eae662d2ca276e4c6f097fc36a3bb1"
  }

  // Connector link: pingOneSSOConnector
  connection_link {
    id                           = data.davinci_connection.ping_sso.id
    name                         = data.davinci_connection.ping_sso.name
    replace_import_connection_id = "94141bf2f1b9b59a5f5365ff135e02bb"
  }

  // Connector link: variablesConnector
  connection_link {
    id                           = data.davinci_connection.variables.id
    name                         = data.davinci_connection.variables.name
    replace_import_connection_id = "06922a684039827499bdbdd97f49827b"
  }
}

// Flow Name: OOTB - Basic Profile Management
resource "davinci_flow" "ootb_basic_profile_management" {
  depends_on = [
    davinci_variable.username,
  ]

  environment_id = pingone_environment.my_environment.id

  name        = "OOTB - Basic Profile Management"
  description = "Imported on Wed Sep 13 2023 17:10:34 GMT+0000 (Coordinated Universal Time)"

  flow_json = file("./davinci-flows/profile-management-flow.json")


  // Connector link: annotationConnector
  connection_link {
    id                           = data.davinci_connection.annotation.id
    name                         = data.davinci_connection.annotation.name
    replace_import_connection_id = "921bfae85c38ed45045e07be703d86b8"
  }

  // Connector link: errorConnector
  connection_link {
    id                           = data.davinci_connection.error_message.id
    name                         = data.davinci_connection.error_message.name
    replace_import_connection_id = "53ab83a4a4ab919d9f2cb02d9e111ac8"
  }

  // Connector link: functionsConnector
  connection_link {
    id                           = data.davinci_connection.functions.id
    name                         = data.davinci_connection.functions.name
    replace_import_connection_id = "de650ca45593b82c49064ead10b9fe17"
  }

  // Connector link: httpConnector
  connection_link {
    id                           = data.davinci_connection.http_connector.id
    name                         = data.davinci_connection.http_connector.name
    replace_import_connection_id = "867ed4363b2bc21c860085ad2baa817d"
  }

  // Connector link: pingOneSSOConnector
  connection_link {
    id                           = data.davinci_connection.ping_sso.id
    name                         = data.davinci_connection.ping_sso.name
    replace_import_connection_id = "94141bf2f1b9b59a5f5365ff135e02bb"
  }

  // Connector link: variablesConnector
  connection_link {
    id                           = data.davinci_connection.variables.id
    name                         = data.davinci_connection.variables.name
    replace_import_connection_id = "06922a684039827499bdbdd97f49827b"
  }
}



#########################################################################
# PingOne DaVinci - Create connection
#########################################################################
# {@link https://registry.terraform.io/providers/pingidentity/davinci/0.1.9/docs/resources/connection}

// Flow Name: CIAM-Passwordless-Protect-Magic-Link-Authentication-Subflow
resource "davinci_connection" "challengeconnector__94cb18cc8ee6ddaf28e881b16637aec6" {
  environment_id = pingone_environment.my_environment.id

  connector_id = "challengeConnector"
  name         = "Challenge"

  // properties based on the connector type
  // Visit the DaVinci Connector Parameter Reference for details of the required properties:
  // https://registry.terraform.io/providers/pingidentity/davinci/latest/docs/guides/connector-reference
}

// Flow Name: CIAM-Passwordless-Protect-Device-Registration-Subflow
resource "davinci_connection" "stringsconnector__d49474a1b556eb233d3376c918eb3497" {
  environment_id = pingone_environment.my_environment.id

  connector_id = "stringsConnector"
  name         = "String Manipulation"

  // properties based on the connector type
  // Visit the DaVinci Connector Parameter Reference for details of the required properties:
  // https://registry.terraform.io/providers/pingidentity/davinci/latest/docs/guides/connector-reference
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
    flow_id    = resource.davinci_flow.ciam_passwordless_protect_registration_authentication_account_recovery_main_flow.id
    version_id = -1
    weight     = 100
  }
}

#########################################################################
# PingOne DaVinci - Create global company variables
#########################################################################
# {@link https://registry.terraform.io/providers/pingidentity/davinci/latest/docs/resources/variable}


# resource "davinci_variable" "ciam_errorMessage" {
#   depends_on     = [data.davinci_connections.read_all]
#   name           = "ciam_errorMessage"
#   environment_id = pingone_environment.my_environment.id
#   description    = "Error message"
#   context        = "flowInstance"
#   type           = "string"
# }

// Flow Name: CIAM-Passwordless-Protect-Registration-Authentication-Account-Recovery-Main Flow
resource "davinci_variable" "agreementid" {
  depends_on     = [data.davinci_connections.read_all]

  environment_id = pingone_environment.my_environment.id

  context = "flowInstance"

  name        = "agreementId"
  type        = "string"
  description = "Agreement id"

  // Defines a static value.  Comment out or remove both `value` and `empty_value` if the variable value should not be tracked in Terraform state.
  value = pingone_agreement.agreement.id
  
  // Defines a static blank string value ("").  Comment out or remove both `value` and `empty_value` if the variable value should not be tracked in Terraform state.
  // empty_value = true

  min = 0
  max = 2000

  mutable = true
}

// Flow Name: CIAM-Passwordless-Protect-Registration-Authentication-Account-Recovery-Main Flow
resource "davinci_variable" "ciam_accountrecoveryenabled" {
  depends_on     = [data.davinci_connections.read_all]

  environment_id = pingone_environment.my_environment.id

  context = "company"

  name        = "ciam_accountRecoveryEnabled"
  type        = "boolean"
  description = "Account recovery enabled"

  // Defines a static value.  Comment out or remove both `value` and `empty_value` if the variable value should not be tracked in Terraform state.
  value = "false"
  
  // Defines a static blank string value ("").  Comment out or remove both `value` and `empty_value` if the variable value should not be tracked in Terraform state.
  // empty_value = true

  min = 0
  max = 2000

  mutable = true
}

// Flow Name: CIAM-Passwordless-Protect-Registration-Authentication-Account-Recovery-Main Flow
resource "davinci_variable" "ciam_agreementenabled" {
  depends_on     = [data.davinci_connections.read_all]

  environment_id = pingone_environment.my_environment.id

  context = "company"

  name        = "ciam_agreementEnabled"
  type        = "boolean"
  description = "Agreement enabled"

  // Defines a static value.  Comment out or remove both `value` and `empty_value` if the variable value should not be tracked in Terraform state.
  value = "false"
  
  // Defines a static blank string value ("").  Comment out or remove both `value` and `empty_value` if the variable value should not be tracked in Terraform state.
  // empty_value = true

  min = 0
  max = 2000

  mutable = true
}

// Flow Name: CIAM-Passwordless-Protect-Registration-Authentication-Account-Recovery-Main Flow
resource "davinci_variable" "ciam_appleenabled" {
  depends_on     = [data.davinci_connections.read_all]

  environment_id = pingone_environment.my_environment.id

  context = "company"

  name        = "ciam_appleEnabled"
  type        = "boolean"
  description = "Apple enabled"

  // Defines a static value.  Comment out or remove both `value` and `empty_value` if the variable value should not be tracked in Terraform state.
  value = "false"
  
  // Defines a static blank string value ("").  Comment out or remove both `value` and `empty_value` if the variable value should not be tracked in Terraform state.
  // empty_value = true

  min = 0
  max = 2000

  mutable = true
}

// Flow Name: CIAM-Passwordless-Protect-Registration-Authentication-Account-Recovery-Main Flow
resource "davinci_variable" "ciam_authmethod" {
  depends_on     = [data.davinci_connections.read_all]

  environment_id = pingone_environment.my_environment.id

  context = "flowInstance"

  name        = "ciam_authMethod"
  type        = "string"
  description = "Authentication method"

  // Defines a static value.  Comment out or remove both `value` and `empty_value` if the variable value should not be tracked in Terraform state.
  // value = ""
  
  // Defines a static blank string value ("").  Comment out or remove both `value` and `empty_value` if the variable value should not be tracked in Terraform state.
  // empty_value = true

  min = 0
  max = 2000

  mutable = true
}

// Flow Name: CIAM-Passwordless-Protect-Registration-Authentication-Account-Recovery-Main Flow
resource "davinci_variable" "ciam_companyname" {
  depends_on     = [data.davinci_connections.read_all]

  environment_id = pingone_environment.my_environment.id

  context = "company"

  name        = "ciam_companyName"
  type        = "string"
  description = "Company name"

  // Defines a static value.  Comment out or remove both `value` and `empty_value` if the variable value should not be tracked in Terraform state.
  value = "Ping Identity"
  
  // Defines a static blank string value ("").  Comment out or remove both `value` and `empty_value` if the variable value should not be tracked in Terraform state.
  // empty_value = true

  min = 0
  max = 2000

  mutable = true
}

// Flow Name: CIAM-Passwordless-Protect-Device-Registration-Subflow
resource "davinci_variable" "ciam_deviceid" {
  depends_on     = [data.davinci_connections.read_all]

  environment_id = pingone_environment.my_environment.id

  context = "flowInstance"

  name        = "ciam_deviceId"
  type        = "string"
  description = "Device id"

  // Defines a static value.  Comment out or remove both `value` and `empty_value` if the variable value should not be tracked in Terraform state.
  // value = ""
  
  // Defines a static blank string value ("").  Comment out or remove both `value` and `empty_value` if the variable value should not be tracked in Terraform state.
  // empty_value = true

  min = 0
  max = 2000

  mutable = true
}

// Flow Name: CIAM-Passwordless-Protect-Registration-Authentication-Account-Recovery-Main Flow
resource "davinci_variable" "ciam_emailotpenabled" {
  depends_on     = [data.davinci_connections.read_all]

  environment_id = pingone_environment.my_environment.id

  context = "company"

  name        = "ciam_emailOtpEnabled"
  type        = "boolean"
  description = "Email OTP enabled"

  // Defines a static value.  Comment out or remove both `value` and `empty_value` if the variable value should not be tracked in Terraform state.
  value = "true"
  
  // Defines a static blank string value ("").  Comment out or remove both `value` and `empty_value` if the variable value should not be tracked in Terraform state.
  // empty_value = true

  min = 0
  max = 2000

  mutable = true
}

// Flow Name: CIAM-Passwordless-Protect-Account-Recovery-Subflow
resource "davinci_variable" "ciam_errorconnector" {
  environment_id = pingone_environment.my_environment.id

  context = "flowInstance"

  name        = "ciam_errorConnector"
  type        = "string"

  // Defines a static value.  Comment out or remove both `value` and `empty_value` if the variable value should not be tracked in Terraform state.
  // value = ""
  
  // Defines a static blank string value ("").  Comment out or remove both `value` and `empty_value` if the variable value should not be tracked in Terraform state.
  // empty_value = true

  min = 0
  max = 2000

  mutable = true
}

// Flow Name: CIAM-Passwordless-Protect-Registration-Authentication-Account-Recovery-Main Flow
resource "davinci_variable" "ciam_facebookenabled" {
  depends_on     = [data.davinci_connections.read_all]

  environment_id = pingone_environment.my_environment.id

  context = "company"

  name        = "ciam_facebookEnabled"
  type        = "boolean"
  description = "Facebook enabled"

  // Defines a static value.  Comment out or remove both `value` and `empty_value` if the variable value should not be tracked in Terraform state.
  value = "false"
  
  // Defines a static blank string value ("").  Comment out or remove both `value` and `empty_value` if the variable value should not be tracked in Terraform state.
  // empty_value = true

  min = 0
  max = 2000

  mutable = true
}

// Flow Name: CIAM-Passwordless-Protect-Registration-Authentication-Account-Recovery-Main Flow
resource "davinci_variable" "ciam_fidopasskeyenabled" {
  depends_on     = [data.davinci_connections.read_all]

  environment_id = pingone_environment.my_environment.id

  context = "company"

  name        = "ciam_fidoPasskeyEnabled"
  type        = "boolean"
  description = "FIDO passkey enabled"

  // Defines a static value.  Comment out or remove both `value` and `empty_value` if the variable value should not be tracked in Terraform state.
  value = "false"
  
  // Defines a static blank string value ("").  Comment out or remove both `value` and `empty_value` if the variable value should not be tracked in Terraform state.
  // empty_value = true

  min = 0
  max = 2000

  mutable = true
}

// Flow Name: CIAM-Passwordless-Protect-Registration-Authentication-Account-Recovery-Main Flow
resource "davinci_variable" "ciam_googleenabled" {
  depends_on     = [data.davinci_connections.read_all]

  environment_id = pingone_environment.my_environment.id

  context = "company"

  name        = "ciam_googleEnabled"
  type        = "boolean"
  description = "Google enabled"

  // Defines a static value.  Comment out or remove both `value` and `empty_value` if the variable value should not be tracked in Terraform state.
  value = "false"
  
  // Defines a static blank string value ("").  Comment out or remove both `value` and `empty_value` if the variable value should not be tracked in Terraform state.
  // empty_value = true

  min = 0
  max = 2000

  mutable = true
}

// Flow Name: CIAM-Passwordless-Protect-Registration-Authentication-Account-Recovery-Main Flow
resource "davinci_variable" "ciam_logostyle" {
  depends_on     = [data.davinci_connections.read_all]

  environment_id = pingone_environment.my_environment.id

  context = "company"

  name        = "ciam_logoStyle"
  type        = "string"
  description = "CSS Style for company logo"

  // Defines a static value.  Comment out or remove both `value` and `empty_value` if the variable value should not be tracked in Terraform state.
  value = "width: 65px; height: 65px;"
  
  // Defines a static blank string value ("").  Comment out or remove both `value` and `empty_value` if the variable value should not be tracked in Terraform state.
  // empty_value = true

  min = 0
  max = 2000

  mutable = true
}

// Flow Name: CIAM-Passwordless-Protect-Registration-Authentication-Account-Recovery-Main Flow
resource "davinci_variable" "ciam_logourl" {
  depends_on     = [data.davinci_connections.read_all]

  environment_id = pingone_environment.my_environment.id

  context = "company"

  name        = "ciam_logoUrl"
  type        = "string"
  description = "URL of company logo"

  // Defines a static value.  Comment out or remove both `value` and `empty_value` if the variable value should not be tracked in Terraform state.
  value = "https://assets.pingone.com/ux/ui-library/5.0.2/images/logo-pingidentity.png"
  
  // Defines a static blank string value ("").  Comment out or remove both `value` and `empty_value` if the variable value should not be tracked in Terraform state.
  // empty_value = true

  min = 0
  max = 2000

  mutable = true
}

// Flow Name: CIAM-Passwordless-Protect-Registration-Authentication-Account-Recovery-Main Flow
resource "davinci_variable" "ciam_magiclinkenabled" {
  depends_on     = [data.davinci_connections.read_all]

  environment_id = pingone_environment.my_environment.id

  context = "company"

  name        = "ciam_magicLinkEnabled"
  type        = "boolean"
  description = "Magic link enabled"

  // Defines a static value.  Comment out or remove both `value` and `empty_value` if the variable value should not be tracked in Terraform state.
  value = "false"
  
  // Defines a static blank string value ("").  Comment out or remove both `value` and `empty_value` if the variable value should not be tracked in Terraform state.
  // empty_value = true

  min = 0
  max = 2000

  mutable = true
}

// Flow Name: CIAM-Passwordless-Protect-Registration-Authentication-Account-Recovery-Main Flow
resource "davinci_variable" "ciam_passwordlessrequired" {
  depends_on     = [data.davinci_connections.read_all]

  environment_id = pingone_environment.my_environment.id

  context = "company"

  name        = "ciam_passwordlessRequired"
  type        = "boolean"
  description = "Passwordless required"

  // Defines a static value.  Comment out or remove both `value` and `empty_value` if the variable value should not be tracked in Terraform state.
  value = "false"
  
  // Defines a static blank string value ("").  Comment out or remove both `value` and `empty_value` if the variable value should not be tracked in Terraform state.
  // empty_value = true

  min = 0
  max = 2000

  mutable = true
}

// Flow Name: CIAM-Passwordless-Protect-Account-Recovery-Subflow
resource "davinci_variable" "ciam_protectdevicestatus" {
  environment_id = pingone_environment.my_environment.id

  context = "flowInstance"

  name        = "ciam_protectDeviceStatus"
  type        = "string"
  description = "Used by CIAM Passwordless and PingOne protect flow"

  // Defines a static value.  Comment out or remove both `value` and `empty_value` if the variable value should not be tracked in Terraform state.
  // value = ""
  
  // Defines a static blank string value ("").  Comment out or remove both `value` and `empty_value` if the variable value should not be tracked in Terraform state.
  // empty_value = true

  min = 0
  max = 2000

  mutable = true
}

// Flow Name: CIAM-Passwordless-Protect-Account-Recovery-Subflow
resource "davinci_variable" "ciam_protectpredictor" {
  environment_id = pingone_environment.my_environment.id

  context = "flowInstance"

  name        = "ciam_protectPredictor"
  type        = "string"
  description = "Used by CIAM Passwordless and PingOne Protect flows."

  // Defines a static value.  Comment out or remove both `value` and `empty_value` if the variable value should not be tracked in Terraform state.
  // value = ""
  
  // Defines a static blank string value ("").  Comment out or remove both `value` and `empty_value` if the variable value should not be tracked in Terraform state.
  // empty_value = true

  min = 0
  max = 2000

  mutable = true
}

// Flow Name: CIAM-Passwordless-Protect-Account-Recovery-Subflow
resource "davinci_variable" "ciam_protectriskid" {
  environment_id = pingone_environment.my_environment.id

  context = "flowInstance"

  name        = "ciam_protectRiskID"
  type        = "string"
  description = "This variable is used by CIAM Passwordless with pingone protect flows."

  // Defines a static value.  Comment out or remove both `value` and `empty_value` if the variable value should not be tracked in Terraform state.
  // value = ""
  
  // Defines a static blank string value ("").  Comment out or remove both `value` and `empty_value` if the variable value should not be tracked in Terraform state.
  // empty_value = true

  min = 0
  max = 2000

  mutable = true
}

// Flow Name: CIAM-Passwordless-Protect-Account-Recovery-Subflow
resource "davinci_variable" "ciam_protectrisklevel" {
  environment_id = pingone_environment.my_environment.id

  context = "flowInstance"

  name        = "ciam_protectRiskLevel"
  type        = "string"
  description = "Used by CIAM Passwordless and PingOne protect flows"

  // Defines a static value.  Comment out or remove both `value` and `empty_value` if the variable value should not be tracked in Terraform state.
  // value = ""
  
  // Defines a static blank string value ("").  Comment out or remove both `value` and `empty_value` if the variable value should not be tracked in Terraform state.
  // empty_value = true

  min = 0
  max = 2000

  mutable = true
}

// Flow Name: CIAM-Passwordless-Protect-Account-Recovery-Subflow
resource "davinci_variable" "ciam_protectriskpolicyid" {
  depends_on     = [data.http.get_risk_policy_id,data.davinci_connections.read_all]

  environment_id = pingone_environment.my_environment.id

  context = "company"

  name        = "ciam_protectriskPolicyId"
  type        = "string"
  description = "This PingOne Protect Risk Policy ID will be passed by default."

  // Defines a static value.  Comment out or remove both `value` and `empty_value` if the variable value should not be tracked in Terraform state.
  value = "${local.policy_id}"
  
  // Defines a static blank string value ("").  Comment out or remove both `value` and `empty_value` if the variable value should not be tracked in Terraform state.
  // empty_value = true

  min = 0
  max = 2000

  mutable = true
}

// Flow Name: CIAM-Passwordless-Protect-Account-Recovery-Subflow
resource "davinci_variable" "ciam_protectriskpolicyid_flow" {
  depends_on     = [data.http.get_risk_policy_id,data.davinci_connections.read_all]

  environment_id = pingone_environment.my_environment.id

  context = "flowInstance"

  name        = "ciam_protectriskPolicyId"
  type        = "string"
  description = "This PingOne Protect Risk Policy ID will be passed by default."

  // Defines a static value.  Comment out or remove both `value` and `empty_value` if the variable value should not be tracked in Terraform state.
  value = "${local.policy_id}"
  
  // Defines a static blank string value ("").  Comment out or remove both `value` and `empty_value` if the variable value should not be tracked in Terraform state.
  // empty_value = true

  min = 0
  max = 2000

  mutable = true
}

// Flow Name: CIAM-Passwordless-Protect-Account-Recovery-Subflow
resource "davinci_variable" "ciam_recoverylimit" {
  depends_on     = [data.davinci_connections.read_all]

  environment_id = pingone_environment.my_environment.id

  context = "company"

  name        = "ciam_recoveryLimit"
  type        = "number"
  description = "Recovery limit"

  // Defines a static value.  Comment out or remove both `value` and `empty_value` if the variable value should not be tracked in Terraform state.
  value = "5"
  
  // Defines a static blank string value ("").  Comment out or remove both `value` and `empty_value` if the variable value should not be tracked in Terraform state.
  // empty_value = true

  min = 0
  max = 2000

  mutable = true
}

// Flow Name: CIAM-Passwordless-Protect-Account-Recovery-Subflow
resource "davinci_variable" "ciam_recoveryvalidationattempts" {
  depends_on     = [data.davinci_connections.read_all]

  environment_id = pingone_environment.my_environment.id

  context = "flowInstance"

  name        = "ciam_recoveryValidationAttempts"
  type        = "number"
  description = "Recovery validation attempts"

  // Defines a static value.  Comment out or remove both `value` and `empty_value` if the variable value should not be tracked in Terraform state.
  // value = ""
  
  // Defines a static blank string value ("").  Comment out or remove both `value` and `empty_value` if the variable value should not be tracked in Terraform state.
  // empty_value = true

  min = 0
  max = 2000

  mutable = true
}

// Flow Name: CIAM-Passwordless-Protect-Registration-Authentication-Account-Recovery-Main Flow
resource "davinci_variable" "ciam_sessionlengthinminute" {
  depends_on     = [data.davinci_connections.read_all]
  
  environment_id = pingone_environment.my_environment.id

  context = "company"

  name        = "ciam_sessionLengthInMinute"
  type        = "number"
  description = "Session length in minutes"

  // Defines a static value.  Comment out or remove both `value` and `empty_value` if the variable value should not be tracked in Terraform state.
  value = "5"
  
  // Defines a static blank string value ("").  Comment out or remove both `value` and `empty_value` if the variable value should not be tracked in Terraform state.
  // empty_value = true

  min = 0
  max = 2000

  mutable = true
}

// Flow Name: CIAM-Passwordless-Protect-Registration-Authentication-Account-Recovery-Main Flow
resource "davinci_variable" "ciam_smsotpenabled" {
  depends_on     = [data.davinci_connections.read_all]

  environment_id = pingone_environment.my_environment.id

  context = "company"

  name        = "ciam_smsOtpEnabled"
  type        = "boolean"
  description = "SMS OTP enabled"

  // Defines a static value.  Comment out or remove both `value` and `empty_value` if the variable value should not be tracked in Terraform state.
  value = "true"
  
  // Defines a static blank string value ("").  Comment out or remove both `value` and `empty_value` if the variable value should not be tracked in Terraform state.
  // empty_value = true

  min = 0
  max = 2000

  mutable = true
}

// Flow Name: CIAM-Passwordless-Protect-Verify-Email-Subflow
resource "davinci_variable" "ciam_verificationlimit" {
  depends_on     = [data.davinci_connections.read_all]

  environment_id = pingone_environment.my_environment.id

  context = "company"

  name        = "ciam_verificationLimit"
  type        = "number"

  // Defines a static value.  Comment out or remove both `value` and `empty_value` if the variable value should not be tracked in Terraform state.
  value = "5"
  
  // Defines a static blank string value ("").  Comment out or remove both `value` and `empty_value` if the variable value should not be tracked in Terraform state.
  // empty_value = true

  min = 0
  max = 2000
}

// Flow Name: CIAM-Passwordless-Protect-Verify-Email-Subflow
resource "davinci_variable" "ciam_verificationvalidationattempts" {
  depends_on     = [data.davinci_connections.read_all]

  environment_id = pingone_environment.my_environment.id

  context = "flowInstance"

  name        = "ciam_verificationValidationAttempts"
  type        = "number"
  description = "Verification validation attempts"

  // Defines a static value.  Comment out or remove both `value` and `empty_value` if the variable value should not be tracked in Terraform state.
  // value = ""
  
  // Defines a static blank string value ("").  Comment out or remove both `value` and `empty_value` if the variable value should not be tracked in Terraform state.
  // empty_value = true

  min = 0
  max = 2000

  mutable = true
}

// Flow Name: CIAM-Passwordless-Protect-Threat-Detection-Subflow
# resource "davinci_variable" "companyname" {
#   environment_id = pingone_environment.my_environment.id

#   context = "flowInstance"

#   name        = "companyName"
#   type        = "string"

#   // Defines a static value.  Comment out or remove both `value` and `empty_value` if the variable value should not be tracked in Terraform state.
#   // value = ""
  
#   // Defines a static blank string value ("").  Comment out or remove both `value` and `empty_value` if the variable value should not be tracked in Terraform state.
#   // empty_value = true

#   min = 0
#   max = 2000

#   mutable = true
# }

// Flow Name: OOTB - Basic Profile Management
resource "davinci_variable" "username" {
  environment_id = pingone_environment.my_environment.id

  context = "flowInstance"

  name        = "username"
  type        = "string"

  // Defines a static value.  Comment out or remove both `value` and `empty_value` if the variable value should not be tracked in Terraform state.
  // value = ""
  
  // Defines a static blank string value ("").  Comment out or remove both `value` and `empty_value` if the variable value should not be tracked in Terraform state.
  // empty_value = true

  min = 0
  max = 2000

  mutable = true
}
