##########################################################################
# pingone_davinci_connector_instance.tf
# Declarations for PingOne DaVinci Connector Instance.
# {@link https://registry.terraform.io/providers/pingidentity/pingone/latest/docs/resources/davinci_connector_instance}
# {@link https://docs.pingidentity.com/davinci/connectors/davinci_connections.html}
##########################################################################

resource "pingone_davinci_connector_instance" "http" {
  environment_id = pingone_environment.my_environment.id
  name           = "Http"

  connector = {
    id = "httpConnector"
  }
}


resource "pingone_davinci_connector_instance" "pingone_sso" {
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
      "value" : "${pingone_application_secret.worker_app_secret.secret}"
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