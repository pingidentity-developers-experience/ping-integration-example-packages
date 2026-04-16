
resource "pingone_davinci_flow_enable" "ciam_passwordless_protect_account_recovery_subflow" {
  environment_id = pingone_environment.my_environment.id
  flow_id        = pingone_davinci_flow.ciam_passwordless_protect_account_recovery_subflow.id
  enabled        = true
}


resource "pingone_davinci_flow_enable" "ciam_passwordless_protect_account_registration_subflow" {
  environment_id = pingone_environment.my_environment.id
  flow_id        = pingone_davinci_flow.ciam_passwordless_protect_account_registration_subflow.id
  enabled        = true
}


resource "pingone_davinci_flow_enable" "ciam_passwordless_protect_agreement_tos_subflow" {
  environment_id = pingone_environment.my_environment.id
  flow_id        = pingone_davinci_flow.ciam_passwordless_protect_agreement_tos_subflow.id
  enabled        = true
}


resource "pingone_davinci_flow_enable" "ciam_passwordless_protect_change_password_subflow" {
  environment_id = pingone_environment.my_environment.id
  flow_id        = pingone_davinci_flow.ciam_passwordless_protect_change_password_subflow.id
  enabled        = true
}


resource "pingone_davinci_flow_enable" "ciam_passwordless_protect_device_authentication_subflow" {
  environment_id = pingone_environment.my_environment.id
  flow_id        = pingone_davinci_flow.ciam_passwordless_protect_device_authentication_subflow.id
  enabled        = true
}


resource "pingone_davinci_flow_enable" "ciam_passwordless_protect_device_registration_subflow" {
  environment_id = pingone_environment.my_environment.id
  flow_id        = pingone_davinci_flow.ciam_passwordless_protect_device_registration_subflow.id
  enabled        = true
}


resource "pingone_davinci_flow_enable" "ciam_passwordless_protect_magic_link_authentication_subflow" {
  environment_id = pingone_environment.my_environment.id
  flow_id        = pingone_davinci_flow.ciam_passwordless_protect_magic_link_authentication_subflow.id
  enabled        = true
}


resource "pingone_davinci_flow_enable" "ciam_passwordless_protect_registration_authentication_account_recovery_main_flow" {
  environment_id = pingone_environment.my_environment.id
  flow_id        = pingone_davinci_flow.ciam_passwordless_protect_registration_authentication_account_recovery_main_flow.id
  enabled        = true
}


resource "pingone_davinci_flow_enable" "ciam_passwordless_protect_threat_detection_subflow" {
  environment_id = pingone_environment.my_environment.id
  flow_id        = pingone_davinci_flow.ciam_passwordless_protect_threat_detection_subflow.id
  enabled        = true
}


resource "pingone_davinci_flow_enable" "ciam_passwordless_protect_verify_email_subflow" {
  environment_id = pingone_environment.my_environment.id
  flow_id        = pingone_davinci_flow.ciam_passwordless_protect_verify_email_subflow.id
  enabled        = true
}


resource "pingone_davinci_flow_enable" "ootb_basic_profile_management" {
  environment_id = pingone_environment.my_environment.id
  flow_id        = pingone_davinci_flow.ootb_basic_profile_management.id
  enabled        = true
}