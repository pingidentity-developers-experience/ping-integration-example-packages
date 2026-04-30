##########################################################################
# pingone_davinci_flow.tf
# Declarations for PingOne DaVinci Flow.
# {@link https://registry.terraform.io/providers/pingidentity/pingone/latest/docs/resources/davinci_flow}
# {@link https://docs.pingidentity.com/davinci/flows/davinci_flows.html}
##########################################################################

resource "pingone_davinci_flow" "pingone_davinci_api_registration_example" {
  environment_id = pingone_environment.my_environment.id
  name           = "PingOne DaVinci API Registration Example"
  description    = "Imported on Tue May 16 2023 19:35:07 GMT+0000 (Coordinated Universal Time)"
  color          = "#CACED3"

  settings = {
    csp                              = "worker-src 'self' blob:; script-src 'self' https://cdn.jsdelivr.net https://code.jquery.com https://devsdk.singularkey.com http://cdnjs.cloudflare.com 'unsafe-inline' 'unsafe-eval';"
    log_level                        = 2
    intermediate_loading_screen_css  = ""
    intermediate_loading_screen_html = ""
  }

  graph_data = {
    renderer = jsonencode({
      "name" : "null"
    })
    elements = {
      nodes = {
        "6i7lwwrw94" = {
          data = {
            id              = "6i7lwwrw94"
            node_type       = "CONNECTION"
            connection_id   = pingone_davinci_connector_instance.pingone_sso.id
            connector_id    = "pingOneSSOConnector"
            name            = "PingOne"
            label           = "PingOne"
            capability_name = "createUser"
            type            = "action"
            status          = "configured"
            properties = jsonencode({
              "additionalUserProperties" : {
                "value" : []
              },
              "email" : {
                "value" : "[\n  {\n    \"children\": [\n      {\n        \"text\": \"\"\n      },\n      {\n        \"text\": \"\"\n      },\n      {\n        \"type\": \"link\",\n        \"src\": \"auth.svg\",\n        \"url\": \"email\",\n        \"data\": \"{{global.parameters.email}}\",\n        \"tooltip\": \"{{global.parameters.email}}\",\n        \"children\": [\n          {\n            \"text\": \"email\"\n          }\n        ]\n      },\n      {\n        \"text\": \"\"\n      }\n    ]\n  }\n]"
              },
              "passwordForCreateUser" : {
                "value" : "[\n  {\n    \"children\": [\n      {\n        \"text\": \"\"\n      },\n      {\n        \"text\": \"\"\n      },\n      {\n        \"type\": \"link\",\n        \"src\": \"auth.svg\",\n        \"url\": \"password\",\n        \"data\": \"{{global.parameters.password}}\",\n        \"tooltip\": \"{{global.parameters.password}}\",\n        \"children\": [\n          {\n            \"text\": \"password\"\n          }\n        ]\n      },\n      {\n        \"text\": \"\"\n      }\n    ]\n  }\n]"
              },
              "population" : {
                "value" : "useDefaultPopulation"
              },
              "username" : {
                "value" : "[\n  {\n    \"children\": [\n      {\n        \"text\": \"\"\n      },\n      {\n        \"text\": \"\"\n      },\n      {\n        \"type\": \"link\",\n        \"src\": \"auth.svg\",\n        \"url\": \"email\",\n        \"data\": \"{{global.parameters.email}}\",\n        \"tooltip\": \"{{global.parameters.email}}\",\n        \"children\": [\n          {\n            \"text\": \"email\"\n          }\n        ]\n      },\n      {\n        \"text\": \"\"\n      }\n    ]\n  }\n]"
              }
            })
          }
          position = {
            x = 667
            y = 472
          }
          group      = "nodes"
          removed    = false
          selected   = false
          selectable = true
          locked     = false
          grabbable  = true
          pannable   = false
          classes    = ""
        }
        "8uo3defwup" = {
          data = {
            id        = "8uo3defwup"
            node_type = "EVAL"
            properties = jsonencode({
              "jpeg607lcn" : {
                "value" : "allTriggersFalse"
              },
              "kc7wrmpc93" : {
                "value" : "allTriggersTrue"
              }
            })
          }
          position = {
            x = 787
            y = 322
          }
          group      = "nodes"
          removed    = false
          selected   = false
          selectable = true
          locked     = false
          grabbable  = true
          pannable   = false
          classes    = ""
        }
        "c9u3f1nyw7" = {
          data = {
            id              = "c9u3f1nyw7"
            node_type       = "CONNECTION"
            connection_id   = pingone_davinci_connector_instance.http.id
            connector_id    = "httpConnector"
            name            = "Http"
            label           = "Http"
            capability_name = "createSuccessResponse"
            type            = "action"
            status          = "configured"
            properties = jsonencode({
              "claimsNameValuePairs" : {
                "value" : [
                  {
                    "key" : 0.3076393052734512,
                    "name" : null,
                    "nameDefault" : "success",
                    "type" : "string",
                    "value" : "[\n  {\n    \"children\": [\n      {\n        \"text\": \"\"\n      },\n      {\n        \"text\": \"\"\n      },\n      {\n        \"type\": \"link\",\n        \"src\": \"pingIdentity.svg\",\n        \"url\": \"success\",\n        \"data\": \"{{local.6i7lwwrw94.payload.success}}\",\n        \"tooltip\": \"{{local.6i7lwwrw94.payload.success}}\",\n        \"children\": [\n          {\n            \"text\": \"success\"\n          }\n        ]\n      },\n      {\n        \"text\": \"\"\n      }\n    ]\n  }\n]"
                  },
                  {
                    "key" : 0.08566196004820625,
                    "name" : null,
                    "nameDefault" : "createdAt",
                    "type" : "string",
                    "value" : "[\n  {\n    \"children\": [\n      {\n        \"text\": \"\"\n      },\n      {\n        \"text\": \"\"\n      },\n      {\n        \"type\": \"link\",\n        \"src\": \"pingIdentity.svg\",\n        \"url\": \"createdAt\",\n        \"data\": \"{{local.6i7lwwrw94.payload.output.user.createdAt}}\",\n        \"tooltip\": \"{{local.6i7lwwrw94.payload.output.user.createdAt}}\",\n        \"children\": [\n          {\n            \"text\": \"createdAt\"\n          }\n        ]\n      },\n      {\n        \"text\": \"\"\n      }\n    ]\n  }\n]"
                  }
                ]
              }
            })
          }
          position = {
            x = 1050
            y = 476
          }
          group      = "nodes"
          removed    = false
          selected   = false
          selectable = true
          locked     = false
          grabbable  = true
          pannable   = false
          classes    = ""
        }
        "hcmfduc8d9" = {
          data = {
            id        = "hcmfduc8d9"
            node_type = "EVAL"
            label     = "Evaluator"
            properties = jsonencode({
              "kc7wrmpc93" : {
                "value" : "allTriggersFalse"
              }
            })
          }
          position = {
            x = 787
            y = 472
          }
          group      = "nodes"
          removed    = false
          selected   = false
          selectable = true
          locked     = false
          grabbable  = true
          pannable   = false
          classes    = ""
        }
        "jpeg607lcn" = {
          data = {
            id              = "jpeg607lcn"
            node_type       = "CONNECTION"
            connection_id   = pingone_davinci_connector_instance.http.id
            connector_id    = "httpConnector"
            name            = "Http"
            label           = "Http"
            capability_name = "createErrorResponse"
            type            = "action"
            status          = "configured"
            properties = jsonencode({
              "backgroundColor" : {
                "value" : "#d0021bff"
              },
              "claimsNameValuePairs" : {
                "value" : [
                  {
                    "key" : 0.5898678839936096,
                    "name" : null,
                    "nameDefault" : "message",
                    "type" : "string",
                    "value" : "[\n  {\n    \"children\": [\n      {\n        \"text\": \"\"\n      },\n      {\n        \"text\": \"\"\n      },\n      {\n        \"type\": \"link\",\n        \"src\": \"pingIdentity.svg\",\n        \"url\": \"message\",\n        \"data\": \"{{local.p53gq7n410.payload.error.message}}\",\n        \"tooltip\": \"{{local.p53gq7n410.payload.error.message}}\",\n        \"children\": [\n          {\n            \"text\": \"message\"\n          }\n        ]\n      },\n      {\n        \"text\": \"\"\n      }\n    ]\n  }\n]"
                  }
                ]
              }
            })
          }
          position = {
            x = 1050
            y = 356
          }
          group      = "nodes"
          removed    = false
          selected   = false
          selectable = true
          locked     = false
          grabbable  = true
          pannable   = false
          classes    = ""
        }
        "k2eziu1puq" = {
          data = {
            id              = "k2eziu1puq"
            node_type       = "CONNECTION"
            connection_id   = pingone_davinci_connector_instance.http.id
            connector_id    = "httpConnector"
            name            = "Http"
            label           = "Http"
            capability_name = "createSuccessResponse"
            type            = "action"
            status          = "configured"
            properties = jsonencode({
              "claimsNameValuePairs" : {
                "value" : [
                  {
                    "key" : 0.7708072563929735,
                    "name" : null,
                    "nameDefault" : "success",
                    "type" : "string",
                    "value" : "[\n  {\n    \"children\": [\n      {\n        \"text\": \"\"\n      },\n      {\n        \"text\": \"\"\n      },\n      {\n        \"type\": \"link\",\n        \"src\": \"pingIdentity.svg\",\n        \"url\": \"success\",\n        \"data\": \"{{local.p53gq7n410.payload.success}}\",\n        \"tooltip\": \"{{local.p53gq7n410.payload.success}}\",\n        \"children\": [\n          {\n            \"text\": \"success\"\n          }\n        ]\n      },\n      {\n        \"text\": \"\"\n      }\n    ]\n  }\n]"
                  }
                ]
              }
            })
          }
          position = {
            x = 1050
            y = 236
          }
          group      = "nodes"
          removed    = false
          selected   = false
          selectable = true
          locked     = false
          grabbable  = true
          pannable   = false
          classes    = ""
        }
        "kc7wrmpc93" = {
          data = {
            id              = "kc7wrmpc93"
            node_type       = "CONNECTION"
            connection_id   = pingone_davinci_connector_instance.http.id
            connector_id    = "httpConnector"
            name            = "Http"
            label           = "Http"
            capability_name = "createErrorResponse"
            type            = "action"
            status          = "configured"
            properties = jsonencode({
              "backgroundColor" : {
                "value" : "#d0021bff"
              },
              "claimsNameValuePairs" : {
                "value" : [
                  {
                    "key" : 0.578323540163898,
                    "name" : null,
                    "nameDefault" : "message",
                    "type" : "string",
                    "value" : "[\n  {\n    \"children\": [\n      {\n        \"text\": \"\"\n      },\n      {\n        \"text\": \"\"\n      },\n      {\n        \"type\": \"link\",\n        \"src\": \"pingIdentity.svg\",\n        \"url\": \"message\",\n        \"data\": \"{{local.6i7lwwrw94.payload.error.message}}\",\n        \"tooltip\": \"{{local.6i7lwwrw94.payload.error.message}}\",\n        \"children\": [\n          {\n            \"text\": \"message\"\n          }\n        ]\n      },\n      {\n        \"text\": \"\"\n      }\n    ]\n  }\n]"
                  }
                ]
              }
            })
          }
          position = {
            x = 1050
            y = 596
          }
          group      = "nodes"
          removed    = false
          selected   = false
          selectable = true
          locked     = false
          grabbable  = true
          pannable   = false
          classes    = ""
        }
        "m4sfmek769" = {
          data = {
            id              = "m4sfmek769"
            node_type       = "CONNECTION"
            connection_id   = pingone_davinci_connector_instance.pingone_sso.id
            connector_id    = "pingOneSSOConnector"
            name            = "PingOne"
            label           = "PingOne"
            capability_name = "userLookup"
            type            = "action"
            status          = "configured"
            properties = jsonencode({
              "matchAttributes" : {
                "value" : [
                  "email"
                ]
              },
              "userIdentifierForFindUser" : {
                "value" : "[\n  {\n    \"children\": [\n      {\n        \"text\": \"\"\n      },\n      {\n        \"text\": \"\"\n      },\n      {\n        \"type\": \"link\",\n        \"src\": \"auth.svg\",\n        \"url\": \"email\",\n        \"data\": \"{{global.parameters.email}}\",\n        \"tooltip\": \"{{global.parameters.email}}\",\n        \"children\": [\n          {\n            \"text\": \"email\"\n          }\n        ]\n      },\n      {\n        \"text\": \"\"\n      }\n    ]\n  }\n]"
              }
            })
          }
          position = {
            x = 277
            y = 322
          }
          group      = "nodes"
          removed    = false
          selected   = false
          selectable = true
          locked     = false
          grabbable  = true
          pannable   = false
          classes    = ""
        }
        "p53gq7n410" = {
          data = {
            id              = "p53gq7n410"
            node_type       = "CONNECTION"
            connection_id   = pingone_davinci_connector_instance.pingone_sso.id
            connector_id    = "pingOneSSOConnector"
            name            = "PingOne"
            label           = "PingOne"
            capability_name = "checkPassword"
            type            = "action"
            status          = "configured"
            properties = jsonencode({
              "identifier" : {
                "value" : "[\n  {\n    \"children\": [\n      {\n        \"text\": \"\"\n      },\n      {\n        \"text\": \"\"\n      },\n      {\n        \"type\": \"link\",\n        \"src\": \"auth.svg\",\n        \"url\": \"email\",\n        \"data\": \"{{global.parameters.email}}\",\n        \"tooltip\": \"{{global.parameters.email}}\",\n        \"children\": [\n          {\n            \"text\": \"email\"\n          }\n        ]\n      },\n      {\n        \"text\": \"\"\n      }\n    ]\n  }\n]"
              },
              "matchAttribute" : {
                "value" : "email"
              },
              "password" : {
                "value" : "[\n  {\n    \"children\": [\n      {\n        \"text\": \"\"\n      },\n      {\n        \"text\": \"\"\n      },\n      {\n        \"type\": \"link\",\n        \"src\": \"auth.svg\",\n        \"url\": \"password\",\n        \"data\": \"{{global.parameters.password}}\",\n        \"tooltip\": \"{{global.parameters.password}}\",\n        \"children\": [\n          {\n            \"text\": \"password\"\n          }\n        ]\n      },\n      {\n        \"text\": \"\"\n      }\n    ]\n  }\n]"
              }
            })
          }
          position = {
            x = 667
            y = 322
          }
          group      = "nodes"
          removed    = false
          selected   = false
          selectable = true
          locked     = false
          grabbable  = true
          pannable   = false
          classes    = ""
        }
        "yqi3iaujxx" = {
          data = {
            id        = "yqi3iaujxx"
            node_type = "EVAL"
            label     = "Evaluator"
            properties = jsonencode({
              "0di26c5iy7" : {
                "value" : "anyTriggersFalse"
              },
              "6i7lwwrw94" : {
                "value" : "allTriggersFalse"
              }
            })
          }
          position = {
            x = 427
            y = 322
          }
          group      = "nodes"
          removed    = false
          selected   = false
          selectable = true
          locked     = false
          grabbable  = true
          pannable   = false
          classes    = ""
        }
      }
      edges = {
        "3uq6a5770u" = {
          data = {
            id     = "3uq6a5770u"
            source = "hcmfduc8d9"
            target = "c9u3f1nyw7"
          }
          position = {
            x = 0
            y = 0
          }
          group      = "edges"
          removed    = false
          selected   = false
          selectable = true
          locked     = false
          grabbable  = true
          pannable   = true
          classes    = ""
        }
        "73bgp80cye" = {
          data = {
            id     = "73bgp80cye"
            source = "6i7lwwrw94"
            target = "hcmfduc8d9"
          }
          position = {
            x = 0
            y = 0
          }
          group      = "edges"
          removed    = false
          selected   = false
          selectable = true
          locked     = false
          grabbable  = true
          pannable   = true
          classes    = ""
        }
        "8xta8bc53k" = {
          data = {
            id     = "8xta8bc53k"
            source = "p53gq7n410"
            target = "8uo3defwup"
          }
          position = {
            x = 0
            y = 0
          }
          group      = "edges"
          removed    = false
          selected   = false
          selectable = true
          locked     = false
          grabbable  = true
          pannable   = true
          classes    = ""
        }
        "apual4vawu" = {
          data = {
            id     = "apual4vawu"
            source = "m4sfmek769"
            target = "yqi3iaujxx"
          }
          position = {
            x = 0
            y = 0
          }
          group      = "edges"
          removed    = false
          selected   = false
          selectable = true
          locked     = false
          grabbable  = true
          pannable   = true
          classes    = ""
        }
        "cygeg7p11i" = {
          data = {
            id     = "cygeg7p11i"
            source = "yqi3iaujxx"
            target = "p53gq7n410"
          }
          position = {
            x = 0
            y = 0
          }
          group      = "edges"
          removed    = false
          selected   = false
          selectable = true
          locked     = false
          grabbable  = true
          pannable   = true
          classes    = ""
        }
        "p4nmcet6qn" = {
          data = {
            id     = "p4nmcet6qn"
            source = "8uo3defwup"
            target = "k2eziu1puq"
          }
          position = {
            x = 0
            y = 0
          }
          group      = "edges"
          removed    = false
          selected   = false
          selectable = true
          locked     = false
          grabbable  = true
          pannable   = true
          classes    = ""
        }
        "poco6s1p07" = {
          data = {
            id     = "poco6s1p07"
            source = "yqi3iaujxx"
            target = "6i7lwwrw94"
          }
          position = {
            x = 0
            y = 0
          }
          group      = "edges"
          removed    = false
          selected   = false
          selectable = true
          locked     = false
          grabbable  = true
          pannable   = true
          classes    = ""
        }
        "wf1i9gpmx1" = {
          data = {
            id     = "wf1i9gpmx1"
            source = "hcmfduc8d9"
            target = "kc7wrmpc93"
          }
          position = {
            x = 0
            y = 0
          }
          group      = "edges"
          removed    = false
          selected   = false
          selectable = true
          locked     = false
          grabbable  = true
          pannable   = true
          classes    = ""
        }
        "z2bqgf35gv" = {
          data = {
            id     = "z2bqgf35gv"
            source = "8uo3defwup"
            target = "jpeg607lcn"
          }
          position = {
            x = 0
            y = 0
          }
          group      = "edges"
          removed    = false
          selected   = false
          selectable = true
          locked     = false
          grabbable  = true
          pannable   = true
          classes    = ""
        }
      }
    }
    box_selection_enabled = true
    panning_enabled       = true
    user_panning_enabled  = true
    user_zooming_enabled  = true
    zooming_enabled       = true
    zoom                  = 1
    min_zoom              = 1e-50
    max_zoom              = 1e+50
    pan = {
      x = 0
      y = 0
    }
  }

  input_schema = [
    {
      property_name          = "email"
      preferred_data_type    = "string"
      preferred_control_type = "textField"
      required               = true
      is_expanded            = true
      description            = ""
    },
    {
      property_name          = "password"
      preferred_data_type    = "string"
      preferred_control_type = "textField"
      required               = true
      is_expanded            = true
      description            = ""
    }
  ]
}