##########################################################################
# pingone_davinci_flow.tf
# Declarations for PingOne DaVinci Flow.
# {@link https://registry.terraform.io/providers/pingidentity/pingone/latest/docs/resources/davinci_flow}
# {@link https://docs.pingidentity.com/davinci/flows/davinci_flows.html}
##########################################################################

resource "pingone_davinci_flow" "pingone_davinci_api_protect_example" {
  environment_id = pingone_environment.my_environment.id
  name           = "PingOne DaVinci API Protect Example"
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
        "09anefv002" = {
          data = {
            id        = "09anefv002"
            node_type = "EVAL"
            properties = jsonencode({
              "7h8bs4vxuo" : {
                "value" : "allTriggersFalse"
              },
              "u6w4ob97dt" : {
                "value" : "allTriggersFalse"
              }
            })
          }
          position = {
            x = 1357
            y = 326
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
        "0mqv2pv49t" = {
          data = {
            id              = "0mqv2pv49t"
            node_type       = "CONNECTION"
            connection_id   = pingone_davinci_connector_instance.pingcli__Variables.id
            connector_id    = "variablesConnector"
            name            = "Variables"
            label           = "Variables"
            capability_name = "saveValue"
            type            = "trigger"
            status          = "configured"
            properties = jsonencode({
              "saveVariables" : {
                "value" : [
                  {
                    "key" : 0.5428342378678097,
                    "label" : "userId (string - flowInstance)",
                    "name" : "userId",
                    "nameDefault" : "id",
                    "type" : "string",
                    "value" : "[\n  {\n    \"children\": [\n      {\n        \"text\": \"\"\n      },\n      {\n        \"text\": \"\"\n      },\n      {\n        \"type\": \"link\",\n        \"src\": \"pingIdentity.svg\",\n        \"url\": \"id\",\n        \"data\": \"{{local.6i7lwwrw94.payload.output.user.id}}\",\n        \"tooltip\": \"{{local.6i7lwwrw94.payload.output.user.id}}\",\n        \"children\": [\n          {\n            \"text\": \"id\"\n          }\n        ]\n      },\n      {\n        \"text\": \"\"\n      }\n    ]\n  }\n]"
                  }
                ]
              }
            })
          }
          position = {
            x = 877
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
        "1jf93tyrvi" = {
          data = {
            id              = "1jf93tyrvi"
            node_type       = "CONNECTION"
            connection_id   = pingone_davinci_connector_instance.pingcli__Variables.id
            connector_id    = "variablesConnector"
            name            = "Variables"
            label           = "Variables"
            capability_name = "saveValue"
            type            = "trigger"
            status          = "configured"
            properties = jsonencode({
              "saveVariables" : {
                "value" : [
                  {
                    "key" : 0.8779096515773732,
                    "label" : "userId (string - flowInstance)",
                    "name" : "userId",
                    "nameDefault" : "id",
                    "type" : "string",
                    "value" : "[\n  {\n    \"children\": [\n      {\n        \"text\": \"\"\n      },\n      {\n        \"text\": \"\"\n      },\n      {\n        \"type\": \"link\",\n        \"src\": \"pingIdentity.svg\",\n        \"url\": \"id\",\n        \"data\": \"{{local.m4sfmek769.payload.output.matchedUser.id}}\",\n        \"tooltip\": \"{{local.m4sfmek769.payload.output.matchedUser.id}}\",\n        \"children\": [\n          {\n            \"text\": \"id\"\n          }\n        ]\n      },\n      {\n        \"text\": \"\"\n      }\n    ]\n  }\n]"
                  }
                ]
              }
            })
          }
          position = {
            x = 877
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
            x = 577
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
        "75k6wc3j9i" = {
          data = {
            id        = "75k6wc3j9i"
            node_type = "EVAL"
            properties = jsonencode({
              "jr1f287nlq" : {
                "value" : "allTriggersFalse"
              }
            })
          }
          position = {
            x = 697
            y = 266
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
        "87jn430mui" = {
          data = {
            id        = "87jn430mui"
            node_type = "EVAL"
            properties = jsonencode({
              "kc7wrmpc93" : {
                "value" : "allTriggersFalse"
              }
            })
          }
          position = {
            x = 727
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
        "a6rirjd0m2" = {
          data = {
            id        = "a6rirjd0m2"
            node_type = "EVAL"
          }
          position = {
            x = 1072
            y = 401
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
                    "nameDefault" : "level",
                    "type" : "string",
                    "value" : "[\n  {\n    \"children\": [\n      {\n        \"text\": \"\"\n      },\n      {\n        \"text\": \"\"\n      },\n      {\n        \"type\": \"link\",\n        \"src\": \"pingIdentity.svg\",\n        \"url\": \"level\",\n        \"data\": \"{{local.l9q5mxjjtm.payload.output.rawResponse.result.level}}\",\n        \"tooltip\": \"{{local.l9q5mxjjtm.payload.output.rawResponse.result.level}}\",\n        \"children\": [\n          {\n            \"text\": \"level\"\n          }\n        ]\n      },\n      {\n        \"text\": \"\"\n      }\n    ]\n  }\n]"
                  },
                  {
                    "key" : 0.18337199639822654,
                    "name" : null,
                    "nameDefault" : "score",
                    "type" : "string",
                    "value" : "[\n  {\n    \"children\": [\n      {\n        \"text\": \"\"\n      },\n      {\n        \"text\": \"\"\n      },\n      {\n        \"type\": \"link\",\n        \"src\": \"pingIdentity.svg\",\n        \"url\": \"score\",\n        \"data\": \"{{local.l9q5mxjjtm.payload.output.rawResponse.result.score}}\",\n        \"tooltip\": \"{{local.l9q5mxjjtm.payload.output.rawResponse.result.score}}\",\n        \"children\": [\n          {\n            \"text\": \"score\"\n          }\n        ]\n      },\n      {\n        \"text\": \"\"\n      }\n    ]\n  }\n]"
                  },
                  {
                    "key" : 0.5430462947447765,
                    "name" : null,
                    "nameDefault" : "rawResponse",
                    "type" : "string",
                    "value" : "[\n  {\n    \"children\": [\n      {\n        \"text\": \"\"\n      },\n      {\n        \"text\": \"\"\n      },\n      {\n        \"type\": \"link\",\n        \"src\": \"pingIdentity.svg\",\n        \"url\": \"rawResponse\",\n        \"data\": \"{{local.l9q5mxjjtm.payload.output.rawResponse}}\",\n        \"tooltip\": \"{{local.l9q5mxjjtm.payload.output.rawResponse}}\",\n        \"children\": [\n          {\n            \"text\": \"rawResponse\"\n          }\n        ]\n      },\n      {\n        \"text\": \"\"\n      }\n    ]\n  }\n]"
                  },
                  {
                    "key" : 0.10159057010255945,
                    "label" : null,
                    "name" : null,
                    "nameDefault" : "success",
                    "type" : null,
                    "value" : "[\n  {\n    \"children\": [\n      {\n        \"text\": \"\"\n      },\n      {\n        \"text\": \"\"\n      },\n      {\n        \"type\": \"link\",\n        \"src\": \"pingIdentity.svg\",\n        \"url\": \"success\",\n        \"data\": \"{{local.6i7lwwrw94.payload.success}}\",\n        \"tooltip\": \"{{local.6i7lwwrw94.payload.success}}\",\n        \"children\": [\n          {\n            \"text\": \"success\"\n          }\n        ]\n      },\n      {\n        \"text\": \"\"\n      }\n    ]\n  }\n]"
                  }
                ]
              },
              "returnRequestParameters" : {
                "value" : true
              }
            })
          }
          position = {
            x = 1860
            y = 270
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
        "gznrygimzf" = {
          data = {
            id              = "gznrygimzf"
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
                    "key" : 0.8800805675019314,
                    "name" : null,
                    "nameDefault" : "message",
                    "type" : "string",
                    "value" : "[\n  {\n    \"children\": [\n      {\n        \"text\": \"\"\n      },\n      {\n        \"text\": \"\"\n      },\n      {\n        \"type\": \"link\",\n        \"src\": \"pingIdentity.svg\",\n        \"url\": \"message\",\n        \"data\": \"{{local.sxdpclcyko.payload.error.message}}\",\n        \"tooltip\": \"{{local.sxdpclcyko.payload.error.message}}\",\n        \"children\": [\n          {\n            \"text\": \"message\"\n          }\n        ]\n      },\n      {\n        \"text\": \"\"\n      }\n    ]\n  }\n]"
                  }
                ]
              }
            })
          }
          position = {
            x = 1860
            y = 420
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
        "jr1f287nlq" = {
          data = {
            id              = "jr1f287nlq"
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
                    "key" : 0.617681003488906,
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
            x = 877
            y = 386
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
            x = 877
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
        "l9q5mxjjtm" = {
          data = {
            id              = "l9q5mxjjtm"
            node_type       = "CONNECTION"
            connection_id   = pingone_davinci_connector_instance.pingone_protect.id
            connector_id    = "pingOneRiskConnector"
            name            = "PingOne Protect"
            label           = "PingOne Protect"
            capability_name = "createRiskEvaluation"
            type            = "action"
            status          = "configured"
            properties = jsonencode({
              "additionalUserProperties" : {
                "value" : []
              },
              "cookie" : {
                "value" : "[\n  {\n    \"children\": [\n      {\n        \"text\": \"\"\n      },\n      {\n        \"text\": \"\"\n      },\n      {\n        \"type\": \"link\",\n        \"src\": \"auth.svg\",\n        \"url\": \"cookies\",\n        \"data\": \"{{global.cookies}}\",\n        \"tooltip\": \"{{global.cookies}}\",\n        \"children\": [\n          {\n            \"text\": \"cookies\"\n          }\n        ]\n      },\n      {\n        \"text\": \"\"\n      }\n    ]\n  }\n]"
              },
              "ipAddress" : {
                "value" : "[\n  {\n    \"children\": [\n      {\n        \"text\": \"\"\n      },\n      {\n        \"text\": \"\"\n      },\n      {\n        \"type\": \"link\",\n        \"src\": \"auth.svg\",\n        \"url\": \"ip\",\n        \"data\": \"{{global.ip}}\",\n        \"tooltip\": \"{{global.ip}}\",\n        \"children\": [\n          {\n            \"text\": \"ip\"\n          }\n        ]\n      },\n      {\n        \"text\": \"\"\n      }\n    ]\n  }\n]"
              },
              "password" : {
                "value" : "[\n  {\n    \"children\": [\n      {\n        \"text\": \"\"\n      },\n      {\n        \"text\": \"\"\n      },\n      {\n        \"type\": \"link\",\n        \"src\": \"auth.svg\",\n        \"url\": \"password\",\n        \"data\": \"{{global.parameters.password}}\",\n        \"tooltip\": \"{{global.parameters.password}}\",\n        \"children\": [\n          {\n            \"text\": \"password\"\n          }\n        ]\n      },\n      {\n        \"text\": \"\"\n      }\n    ]\n  }\n]"
              },
              "skRiskFP" : {
                "value" : "[\n  {\n    \"children\": [\n      {\n        \"text\": \"\"\n      },\n      {\n        \"text\": \"\"\n      },\n      {\n        \"type\": \"link\",\n        \"src\": \"auth.svg\",\n        \"url\": \"riskData\",\n        \"data\": \"{{global.parameters.riskData}}\",\n        \"tooltip\": \"{{global.parameters.riskData}}\",\n        \"children\": [\n          {\n            \"text\": \"riskData\"\n          }\n        ]\n      },\n      {\n        \"text\": \"\"\n      }\n    ]\n  }\n]"
              },
              "targetResourceName" : {
                "value" : "[\n  {\n    \"children\": [\n      {\n        \"text\": \"DaVinci API Protect Sample App\"\n      }\n    ]\n  }\n]"
              },
              "userAgent" : {
                "value" : "[\n  {\n    \"children\": [\n      {\n        \"text\": \"\"\n      },\n      {\n        \"text\": \"\"\n      },\n      {\n        \"type\": \"link\",\n        \"src\": \"auth.svg\",\n        \"url\": \"userAgent\",\n        \"data\": \"{{global.userAgent}}\",\n        \"tooltip\": \"{{global.userAgent}}\",\n        \"children\": [\n          {\n            \"text\": \"userAgent\"\n          }\n        ]\n      },\n      {\n        \"text\": \"\"\n      }\n    ]\n  }\n]"
              },
              "userId" : {
                "value" : "[\n  {\n    \"children\": [\n      {\n        \"text\": \"\"\n      },\n      {\n        \"text\": \"\"\n      },\n      {\n        \"type\": \"link\",\n        \"src\": \"variable.svg\",\n        \"url\": \"userId\",\n        \"data\": \"{{global.variables.userId}}\",\n        \"tooltip\": \"{{global.variables.userId}}\",\n        \"children\": [\n          {\n            \"text\": \"userId\"\n          }\n        ]\n      },\n      {\n        \"text\": \"\"\n      }\n    ]\n  }\n]"
              },
              "userName" : {
                "value" : "[\n  {\n    \"children\": [\n      {\n        \"text\": \"\"\n      },\n      {\n        \"text\": \"\"\n      },\n      {\n        \"type\": \"link\",\n        \"src\": \"auth.svg\",\n        \"url\": \"email\",\n        \"data\": \"{{global.parameters.email}}\",\n        \"tooltip\": \"{{global.parameters.email}}\",\n        \"children\": [\n          {\n            \"text\": \"email\"\n          }\n        ]\n      },\n      {\n        \"text\": \"\"\n      }\n    ]\n  }\n]"
              },
              "userType" : {
                "value" : "PING_ONE"
              }
            })
          }
          position = {
            x = 1237
            y = 326
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
            y = 266
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
        "n6js2rcdqf" = {
          data = {
            id        = "n6js2rcdqf"
            node_type = "EVAL"
            properties = jsonencode({
              "gznrygimzf" : {
                "value" : "allTriggersFalse"
              }
            })
          }
          position = {
            x = 1695
            y = 270
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
            x = 577
            y = 266
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
        "rvgypb5svi" = {
          data = {
            id        = "rvgypb5svi"
            node_type = "EVAL"
          }
          position = {
            x = 1072
            y = 281
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
        "sxdpclcyko" = {
          data = {
            id              = "sxdpclcyko"
            node_type       = "CONNECTION"
            connection_id   = pingone_davinci_connector_instance.pingone_protect.id
            connector_id    = "pingOneRiskConnector"
            name            = "PingOne Protect"
            label           = "PingOne Protect"
            capability_name = "updateRiskEvaluation"
            type            = "action"
            status          = "configured"
            properties = jsonencode({
              "completionStatus" : {
                "value" : "[\n  {\n    \"children\": [\n      {\n        \"text\": \"SUCCESS\"\n      }\n    ]\n  }\n]"
              },
              "riskId" : {
                "value" : "[\n  {\n    \"children\": [\n      {\n        \"text\": \"\"\n      },\n      {\n        \"text\": \"\"\n      },\n      {\n        \"type\": \"link\",\n        \"src\": \"pingIdentity.svg\",\n        \"url\": \"id\",\n        \"data\": \"{{local.l9q5mxjjtm.payload.output.rawResponse.id}}\",\n        \"tooltip\": \"{{local.l9q5mxjjtm.payload.output.rawResponse.id}}\",\n        \"children\": [\n          {\n            \"text\": \"id\"\n          }\n        ]\n      },\n      {\n        \"text\": \"\"\n      }\n    ]\n  }\n]"
              }
            })
          }
          position = {
            x = 1560
            y = 270
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
        "u6w4ob97dt" = {
          data = {
            id              = "u6w4ob97dt"
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
                    "key" : 0.7318766750020025,
                    "name" : null,
                    "nameDefault" : "message",
                    "type" : "string",
                    "value" : "[\n  {\n    \"children\": [\n      {\n        \"text\": \"\"\n      },\n      {\n        \"text\": \"\"\n      },\n      {\n        \"type\": \"link\",\n        \"src\": \"pingIdentity.svg\",\n        \"url\": \"message\",\n        \"data\": \"{{local.l9q5mxjjtm.payload.error.message}}\",\n        \"tooltip\": \"{{local.l9q5mxjjtm.payload.error.message}}\",\n        \"children\": [\n          {\n            \"text\": \"message\"\n          }\n        ]\n      },\n      {\n        \"text\": \"\"\n      }\n    ]\n  }\n]"
                  }
                ]
              }
            })
          }
          position = {
            x = 1560
            y = 420
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
            y = 266
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
        "05t56lofq2" = {
          data = {
            id     = "05t56lofq2"
            source = "09anefv002"
            target = "sxdpclcyko"
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
        "06eo6sq6c8" = {
          data = {
            id     = "06eo6sq6c8"
            source = "0mqv2pv49t"
            target = "a6rirjd0m2"
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
        "07z104pd2b" = {
          data = {
            id     = "07z104pd2b"
            source = "75k6wc3j9i"
            target = "1jf93tyrvi"
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
        "53h4nrs4u0" = {
          data = {
            id     = "53h4nrs4u0"
            source = "n6js2rcdqf"
            target = "gznrygimzf"
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
        "6n86yrphlt" = {
          data = {
            id     = "6n86yrphlt"
            source = "a6rirjd0m2"
            target = "l9q5mxjjtm"
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
        "6uwzgd9xgy" = {
          data = {
            id     = "6uwzgd9xgy"
            source = "1jf93tyrvi"
            target = "rvgypb5svi"
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
        "7mi39hz4x5" = {
          data = {
            id     = "7mi39hz4x5"
            source = "87jn430mui"
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
        "8cy8txv5dv" = {
          data = {
            id     = "8cy8txv5dv"
            source = "l9q5mxjjtm"
            target = "09anefv002"
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
        "gjatfkco0t" = {
          data = {
            id     = "gjatfkco0t"
            source = "09anefv002"
            target = "u6w4ob97dt"
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
        "jqobmjbxm9" = {
          data = {
            id     = "jqobmjbxm9"
            source = "p53gq7n410"
            target = "75k6wc3j9i"
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
        "jsl67wfxc3" = {
          data = {
            id     = "jsl67wfxc3"
            source = "75k6wc3j9i"
            target = "jr1f287nlq"
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
        "jwovpclfvp" = {
          data = {
            id     = "jwovpclfvp"
            source = "rvgypb5svi"
            target = "l9q5mxjjtm"
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
        "tr8r1rok8t" = {
          data = {
            id     = "tr8r1rok8t"
            source = "6i7lwwrw94"
            target = "87jn430mui"
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
        "vsise0s8iw" = {
          data = {
            id     = "vsise0s8iw"
            source = "87jn430mui"
            target = "0mqv2pv49t"
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
        "wv1og0m5r3" = {
          data = {
            id     = "wv1og0m5r3"
            source = "sxdpclcyko"
            target = "n6js2rcdqf"
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
        "zwftxnuob4" = {
          data = {
            id     = "zwftxnuob4"
            source = "n6js2rcdqf"
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
    },
    {
      property_name          = "riskData"
      preferred_data_type    = "string"
      preferred_control_type = "textField"
      required               = true
      is_expanded            = true
      description            = ""
    }
  ]
}