##########################################################################
# pingone_davinci_flow_deploy.tf
# Declarations for PingOne DaVinci Flow Deployment.
# {@link https://registry.terraform.io/providers/pingidentity/pingone/latest/docs/resources/davinci_flow_deploy}
# {@link https://docs.pingidentity.com/davinci/flows/davinci_flows.html}
##########################################################################

resource "pingone_davinci_flow_deploy" "ciam_passwordless_protect_account_recovery_subflow" {
  environment_id = pingone_environment.my_environment.id
  flow_id        = pingone_davinci_flow.ciam_passwordless_protect_account_recovery_subflow.id

  deploy_trigger_values = {
    deployed_version = pingone_davinci_flow.ciam_passwordless_protect_account_recovery_subflow.current_version
  }
}


resource "pingone_davinci_flow_deploy" "ciam_passwordless_protect_account_registration_subflow" {
  environment_id = pingone_environment.my_environment.id
  flow_id        = pingone_davinci_flow.ciam_passwordless_protect_account_registration_subflow.id

  deploy_trigger_values = {
    deployed_version = pingone_davinci_flow.ciam_passwordless_protect_account_registration_subflow.current_version
  }
}


resource "pingone_davinci_flow_deploy" "ciam_passwordless_protect_agreement_tos_subflow" {
  environment_id = pingone_environment.my_environment.id
  flow_id        = pingone_davinci_flow.ciam_passwordless_protect_agreement_tos_subflow.id

  deploy_trigger_values = {
    deployed_version = pingone_davinci_flow.ciam_passwordless_protect_agreement_tos_subflow.current_version
  }
}


resource "pingone_davinci_flow_deploy" "ciam_passwordless_protect_change_password_subflow" {
  environment_id = pingone_environment.my_environment.id
  flow_id        = pingone_davinci_flow.ciam_passwordless_protect_change_password_subflow.id

  deploy_trigger_values = {
    deployed_version = pingone_davinci_flow.ciam_passwordless_protect_change_password_subflow.current_version
  }
}


resource "pingone_davinci_flow_deploy" "ciam_passwordless_protect_device_authentication_subflow" {
  environment_id = pingone_environment.my_environment.id
  flow_id        = pingone_davinci_flow.ciam_passwordless_protect_device_authentication_subflow.id

  deploy_trigger_values = {
    deployed_version = pingone_davinci_flow.ciam_passwordless_protect_device_authentication_subflow.current_version
  }
}


resource "pingone_davinci_flow_deploy" "ciam_passwordless_protect_device_registration_subflow" {
  environment_id = pingone_environment.my_environment.id
  flow_id        = pingone_davinci_flow.ciam_passwordless_protect_device_registration_subflow.id

  deploy_trigger_values = {
    deployed_version = pingone_davinci_flow.ciam_passwordless_protect_device_registration_subflow.current_version
  }
}


resource "pingone_davinci_flow_deploy" "ciam_passwordless_protect_magic_link_authentication_subflow" {
  environment_id = pingone_environment.my_environment.id
  flow_id        = pingone_davinci_flow.ciam_passwordless_protect_magic_link_authentication_subflow.id

  deploy_trigger_values = {
    deployed_version = pingone_davinci_flow.ciam_passwordless_protect_magic_link_authentication_subflow.current_version
  }
}


resource "pingone_davinci_flow_deploy" "ciam_passwordless_protect_registration_authentication_account_recovery_main_flow" {
  environment_id = pingone_environment.my_environment.id
  flow_id        = pingone_davinci_flow.ciam_passwordless_protect_registration_authentication_account_recovery_main_flow.id

  deploy_trigger_values = {
    deployed_version = pingone_davinci_flow.ciam_passwordless_protect_registration_authentication_account_recovery_main_flow.current_version
  }
}


resource "pingone_davinci_flow_deploy" "ciam_passwordless_protect_threat_detection_subflow" {
  environment_id = pingone_environment.my_environment.id
  flow_id        = pingone_davinci_flow.ciam_passwordless_protect_threat_detection_subflow.id

  deploy_trigger_values = {
    deployed_version = pingone_davinci_flow.ciam_passwordless_protect_threat_detection_subflow.current_version
  }
}


resource "pingone_davinci_flow_deploy" "ciam_passwordless_protect_verify_email_subflow" {
  environment_id = pingone_environment.my_environment.id
  flow_id        = pingone_davinci_flow.ciam_passwordless_protect_verify_email_subflow.id

  deploy_trigger_values = {
    deployed_version = pingone_davinci_flow.ciam_passwordless_protect_verify_email_subflow.current_version
  }
}


resource "pingone_davinci_flow_deploy" "ootb_basic_profile_management" {
  environment_id = pingone_environment.my_environment.id
  flow_id        = pingone_davinci_flow.ootb_basic_profile_management.id

  deploy_trigger_values = {
    deployed_version = pingone_davinci_flow.ootb_basic_profile_management.current_version
  }
}