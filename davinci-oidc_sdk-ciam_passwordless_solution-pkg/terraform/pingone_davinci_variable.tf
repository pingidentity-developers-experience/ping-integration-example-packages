
resource "pingone_davinci_variable" "agreementid" {
  environment_id = pingone_environment.my_environment.id
  name           = "agreementId"
  context        = "flowInstance"
  data_type      = "string"
  mutable        = true
  display_name   = "Agreement id"
  min            = 0
  max            = 2000

  value = {
    string = pingone_agreement.agreement.id
  }
}


resource "pingone_davinci_variable" "ciam_accountrecoveryenabled" {
  environment_id = pingone_environment.my_environment.id
  name           = "ciam_accountRecoveryEnabled"
  context        = "company"
  data_type      = "boolean"
  mutable        = true
  display_name   = "Account recovery enabled"
  min            = 0
  max            = 2000

  value = {
    string = "false"
  }
}


resource "pingone_davinci_variable" "ciam_agreementenabled" {
  environment_id = pingone_environment.my_environment.id
  name           = "ciam_agreementEnabled"
  context        = "company"
  data_type      = "boolean"
  mutable        = true
  display_name   = "Agreement enabled"
  min            = 0
  max            = 2000

  value = {
    string = "false"
  }
}


resource "pingone_davinci_variable" "ciam_appleenabled" {
  environment_id = pingone_environment.my_environment.id
  name           = "ciam_appleEnabled"
  context        = "company"
  data_type      = "boolean"
  mutable        = true
  display_name   = "Apple enabled"
  min            = 0
  max            = 2000

  value = {
    string = "false"
  }
}


resource "pingone_davinci_variable" "ciam_authmethod" {
  environment_id = pingone_environment.my_environment.id
  name           = "ciam_authMethod"
  context        = "flowInstance"
  data_type      = "string"
  mutable        = true
  display_name   = "Authentication method"
  min            = 0
  max            = 2000
}


resource "pingone_davinci_variable" "ciam_companyname" {
  environment_id = pingone_environment.my_environment.id
  name           = "ciam_companyName"
  context        = "company"
  data_type      = "string"
  mutable        = true
  display_name   = "Company name"
  min            = 0
  max            = 2000

  value = {
    string = "Ping Identity"
  }
}


resource "pingone_davinci_variable" "ciam_deviceid" {
  environment_id = pingone_environment.my_environment.id
  name           = "ciam_deviceId"
  context        = "flowInstance"
  data_type      = "string"
  mutable        = true
  display_name   = "Device id"
  min            = 0
  max            = 2000
}


resource "pingone_davinci_variable" "ciam_emailotpenabled" {
  environment_id = pingone_environment.my_environment.id
  name           = "ciam_emailOtpEnabled"
  context        = "company"
  data_type      = "boolean"
  mutable        = true
  display_name   = "Email OTP enabled"
  min            = 0
  max            = 2000

  value = {
    string = "true"
  }
}


resource "pingone_davinci_variable" "ciam_errorconnector" {
  environment_id = pingone_environment.my_environment.id
  name           = "ciam_errorConnector"
  context        = "flowInstance"
  data_type      = "string"
  mutable        = true
  min            = 0
  max            = 2000
}


resource "pingone_davinci_variable" "ciam_facebookenabled" {
  environment_id = pingone_environment.my_environment.id
  name           = "ciam_facebookEnabled"
  context        = "company"
  data_type      = "boolean"
  mutable        = true
  display_name   = "Facebook enabled"
  min            = 0
  max            = 2000

  value = {
    string = "false"
  }
}


resource "pingone_davinci_variable" "ciam_fidopasskeyenabled" {
  environment_id = pingone_environment.my_environment.id
  name           = "ciam_fidoPasskeyEnabled"
  context        = "company"
  data_type      = "boolean"
  mutable        = true
  display_name   = "FIDO passkey enabled"
  min            = 0
  max            = 2000

  value = {
    string = "false"
  }
}


resource "pingone_davinci_variable" "ciam_googleenabled" {
  environment_id = pingone_environment.my_environment.id
  name           = "ciam_googleEnabled"
  context        = "company"
  data_type      = "boolean"
  mutable        = true
  display_name   = "Google enabled"
  min            = 0
  max            = 2000

  value = {
    string = "false"
  }
}


resource "pingone_davinci_variable" "ciam_logostyle" {
  environment_id = pingone_environment.my_environment.id
  name           = "ciam_logoStyle"
  context        = "company"
  data_type      = "string"
  mutable        = true
  display_name   = "CSS Style for company logo"
  min            = 0
  max            = 2000

  value = {
    string = "width: 65px; height: 65px;"
  }
}


resource "pingone_davinci_variable" "ciam_logourl" {
  environment_id = pingone_environment.my_environment.id
  name           = "ciam_logoUrl"
  context        = "company"
  data_type      = "string"
  mutable        = true
  display_name   = "URL of company logo"
  min            = 0
  max            = 2000

  value = {
    string = "https://assets.pingone.com/ux/ui-library/5.0.2/images/logo-pingidentity.png"
  }
}


resource "pingone_davinci_variable" "ciam_magiclinkenabled" {
  environment_id = pingone_environment.my_environment.id
  name           = "ciam_magicLinkEnabled"
  context        = "company"
  data_type      = "boolean"
  mutable        = true
  display_name   = "Magic link enabled"
  min            = 0
  max            = 2000

  value = {
    string = "false"
  }
}


resource "pingone_davinci_variable" "ciam_passwordlessrequired" {
  environment_id = pingone_environment.my_environment.id
  name           = "ciam_passwordlessRequired"
  context        = "company"
  data_type      = "boolean"
  mutable        = true
  display_name   = "Passwordless required"
  min            = 0
  max            = 2000

  value = {
    string = "false"
  }
}


resource "pingone_davinci_variable" "ciam_protectdevicestatus" {
  environment_id = pingone_environment.my_environment.id
  name           = "ciam_protectDeviceStatus"
  context        = "flowInstance"
  data_type      = "string"
  mutable        = true
  display_name   = "Used by CIAM Passwordless and PingOne protect flow"
  min            = 0
  max            = 2000
}


resource "pingone_davinci_variable" "ciam_protectpredictor" {
  environment_id = pingone_environment.my_environment.id
  name           = "ciam_protectPredictor"
  context        = "flowInstance"
  data_type      = "string"
  mutable        = true
  display_name   = "Used by CIAM Passwordless and PingOne Protect flows."
  min            = 0
  max            = 2000
}


resource "pingone_davinci_variable" "ciam_protectriskid" {
  environment_id = pingone_environment.my_environment.id
  name           = "ciam_protectRiskID"
  context        = "flowInstance"
  data_type      = "string"
  mutable        = true
  display_name   = "This variable is used by CIAM Passwordless with pingone protect flows."
  min            = 0
  max            = 2000
}


resource "pingone_davinci_variable" "ciam_protectrisklevel" {
  environment_id = pingone_environment.my_environment.id
  name           = "ciam_protectRiskLevel"
  context        = "flowInstance"
  data_type      = "string"
  mutable        = true
  display_name   = "Used by CIAM Passwordless and PingOne protect flows"
  min            = 0
  max            = 2000
}


resource "pingone_davinci_variable" "ciam_protectriskpolicyid" {
  environment_id = pingone_environment.my_environment.id
  name           = "ciam_protectriskPolicyId"
  context        = "company"
  data_type      = "string"
  mutable        = true
  display_name   = "This PingOne Protect Risk Policy ID will be passed by default."
  min            = 0
  max            = 2000

  value = {
    string = "${local.policy_id}"
  }
}


resource "pingone_davinci_variable" "ciam_protectriskpolicyid_flow" {
  environment_id = pingone_environment.my_environment.id
  name           = "ciam_protectriskPolicyId"
  context        = "flowInstance"
  data_type      = "string"
  mutable        = true
  display_name   = "This PingOne Protect Risk Policy ID will be passed by default."
  min            = 0
  max            = 2000

  value = {
    string = "${local.policy_id}"
  }
}


resource "pingone_davinci_variable" "ciam_recoverylimit" {
  environment_id = pingone_environment.my_environment.id
  name           = "ciam_recoveryLimit"
  context        = "company"
  data_type      = "number"
  mutable        = true
  min            = 0
  max            = 2000

  value = {
    string = "5"
  }
}


resource "pingone_davinci_variable" "ciam_recoveryvalidationattempts" {
  environment_id = pingone_environment.my_environment.id
  name           = "ciam_recoveryValidationAttempts"
  context        = "flowInstance"
  data_type      = "number"
  mutable        = true
  min            = 0
  max            = 2000
}


resource "pingone_davinci_variable" "ciam_sessionlengthinminute" {
  environment_id = pingone_environment.my_environment.id
  name           = "ciam_sessionLengthInMinute"
  context        = "company"
  data_type      = "number"
  mutable        = true
  display_name   = "Session length in minutes"
  min            = 0
  max            = 2000

  value = {
    string = "5"
  }
}


resource "pingone_davinci_variable" "ciam_smsotpenabled" {
  environment_id = pingone_environment.my_environment.id
  name           = "ciam_smsOtpEnabled"
  context        = "company"
  data_type      = "boolean"
  mutable        = true
  display_name   = "SMS OTP enabled"
  min            = 0
  max            = 2000

  value = {
    string = "true"
  }
}


resource "pingone_davinci_variable" "ciam_verificationlimit" {
  environment_id = pingone_environment.my_environment.id
  name           = "ciam_verificationLimit"
  context        = "company"
  data_type      = "number"
  mutable        = true
  min            = 0
  max            = 2000

  value = {
    string = "5"
  }
}


resource "pingone_davinci_variable" "ciam_verificationvalidationattempts" {
  environment_id = pingone_environment.my_environment.id
  name           = "ciam_verificationValidationAttempts"
  context        = "flowInstance"
  data_type      = "number"
  mutable        = true
  min            = 0
  max            = 2000
}


resource "pingone_davinci_variable" "companyname" {
  environment_id = pingone_environment.my_environment.id
  name           = "companyName"
  context        = "flowInstance"
  data_type      = "string"
  mutable        = true
  min            = 0
  max            = 2000
}


resource "pingone_davinci_variable" "username" {
  environment_id = pingone_environment.my_environment.id
  name           = "username"
  context        = "flowInstance"
  data_type      = "string"
  mutable        = true
  min            = 0
  max            = 2000
}