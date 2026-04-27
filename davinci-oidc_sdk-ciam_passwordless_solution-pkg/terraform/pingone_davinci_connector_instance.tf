##########################################################################
# pingone_davinci_connector_instance.tf
# Declarations for PingOne DaVinci Connector Instance.
# {@link https://registry.terraform.io/providers/pingidentity/pingone/latest/docs/resources/davinci_connector_instance}
# {@link https://docs.pingidentity.com/davinci/connectors/davinci_connections.html}
##########################################################################

resource "pingone_davinci_connector_instance" "annotation" {
  environment_id = pingone_environment.my_environment.id
  name           = "Annotation"

  connector = {
    id = "annotationConnector"
  }
}


resource "pingone_davinci_connector_instance" "challenge" {
  environment_id = pingone_environment.my_environment.id
  name           = "Challenge"

  connector = {
    id = "challengeConnector"
  }
}


resource "pingone_davinci_connector_instance" "error_message" {
  environment_id = pingone_environment.my_environment.id
  name           = "Error Message"

  connector = {
    id = "errorConnector"
  }
}


resource "pingone_davinci_connector_instance" "flow_connector" {
  environment_id = pingone_environment.my_environment.id
  name           = "Flow Connector"

  connector = {
    id = "flowConnector"
  }
}


resource "pingone_davinci_connector_instance" "functions" {
  environment_id = pingone_environment.my_environment.id
  name           = "Functions"

  connector = {
    id = "functionsConnector"
  }
}


resource "pingone_davinci_connector_instance" "http" {
  environment_id = pingone_environment.my_environment.id
  name           = "Http"

  connector = {
    id = "httpConnector"
  }
}


resource "pingone_davinci_connector_instance" "node" {
  environment_id = pingone_environment.my_environment.id
  name           = "Node"

  connector = {
    id = "nodeConnector"
  }
}


resource "pingone_davinci_connector_instance" "pingone" {
  environment_id = pingone_environment.my_environment.id
  name           = "PingOne"

  connector = {
    id = "pingOneSSOConnector"
  }
  properties = jsonencode({
    "clientId" : {
      "type" : "string",
      "value" : "${pingone_application.worker_app.oidc_options.client_id}"
    },
    "clientSecret" : {
      "type" : "string",
      "value" : "${pingone_application_secret.worker_app.secret}"
    },
    "envId" : {
      "type" : "string",
      "value" : "${pingone_environment.my_environment.id}"
    },
    "region" : {
      "type" : "string",
      "value" : "${var.region_code}"
    }
  })
}


resource "pingone_davinci_connector_instance" "pingone_authentication" {
  environment_id = pingone_environment.my_environment.id
  name           = "PingOne Authentication"

  connector = {
    id = "pingOneAuthenticationConnector"
  }
}


resource "pingone_davinci_connector_instance" "pingone_mfa" {
  environment_id = pingone_environment.my_environment.id
  name           = "PingOne MFA"

  connector = {
    id = "pingOneMfaConnector"
  }
  properties = jsonencode({
    "clientId" : {
      "type" : "string",
      "value" : "${pingone_application.worker_app.oidc_options.client_id}"
    },
    "clientSecret" : {
      "type" : "string",
      "value" : "${pingone_application_secret.worker_app.secret}"
    },
    "envId" : {
      "type" : "string",
      "value" : "${pingone_environment.my_environment.id}"
    },
    "region" : {
      "type" : "string",
      "value" : "${var.region_code}"
    }
  })
}


resource "pingone_davinci_connector_instance" "pingone_notifications" {
  environment_id = pingone_environment.my_environment.id
  name           = "PingOne Notifications"

  connector = {
    id = "notificationsConnector"
  }
  properties = jsonencode({
    "clientId" : {
      "type" : "string",
      "value" : "${pingone_application.worker_app.oidc_options.client_id}"
    },
    "clientSecret" : {
      "type" : "string",
      "value" : "${pingone_application_secret.worker_app.secret}"
    },
    "envId" : {
      "type" : "string",
      "value" : "${pingone_environment.my_environment.id}"
    },
    "region" : {
      "type" : "string",
      "value" : "${var.region_code}"
    }
  })
}


resource "pingone_davinci_connector_instance" "pingone_protect" {
  environment_id = pingone_environment.my_environment.id
  name           = "PingOne Protect"

  connector = {
    id = "pingOneRiskConnector"
  }
  properties = jsonencode({
    "clientId" : {
      "type" : "string",
      "value" : "${pingone_application.worker_app.oidc_options.client_id}"
    },
    "clientSecret" : {
      "type" : "string",
      "value" : "${pingone_application_secret.worker_app.secret}"
    },
    "envId" : {
      "type" : "string",
      "value" : "${pingone_environment.my_environment.id}"
    },
    "region" : {
      "type" : "string",
      "value" : "${var.region_code}"
    }
  })
}


resource "pingone_davinci_connector_instance" "string_manipulation" {
  environment_id = pingone_environment.my_environment.id
  name           = "String Manipulation"

  connector = {
    id = "stringsConnector"
  }
}


resource "pingone_davinci_connector_instance" "variables" {
  environment_id = pingone_environment.my_environment.id
  name           = "Variables"

  connector = {
    id = "variablesConnector"
  }
}