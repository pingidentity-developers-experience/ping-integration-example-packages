##########################################################################
# pingone_davinci_flow.tf
# Declarations for PingOne DaVinci Flow.
# {@link https://registry.terraform.io/providers/pingidentity/pingone/latest/docs/resources/davinci_flow}
# {@link https://docs.pingidentity.com/davinci/flows/davinci_flows.html}
##########################################################################

resource "pingone_davinci_flow" "pingone_davinci_registration_example" {
  environment_id = pingone_environment.my_environment.id
  name           = "PingOne DaVinci Registration Example"
  description    = "Imported on Tue May 16 2023 19:35:07 GMT+0000 (Coordinated Universal Time)"
  color          = "#AFD5FF"

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
        "0di26c5iy7" = {
          data = {
            id              = "0di26c5iy7"
            node_type       = "CONNECTION"
            connection_id   = pingone_davinci_connector_instance.http.id
            connector_id    = "httpConnector"
            name            = "Http"
            label           = "Http"
            capability_name = "customHTMLTemplate"
            type            = "trigger"
            status          = "configured"
            properties = jsonencode({
              "customHTML" : {
                "value" : "[\n  {\n    \"children\": [\n      {\n        \"text\": \"\u003cform id=\\\"registerForm\\\"\u003e\\n    \u003cp\u003eWe did not locate that account. Sign up now!\u003c/p\u003e\\n    \u003cinput type=\\\"text\\\" id=\\\"email\\\" placeholder=\\\"Email address\\\" /\u003e\\n    \u003cinput type=\\\"password\\\" id=\\\"password\\\" placeholder=\\\"password\\\" /\u003e\\n    \u003cbutton class=\\\"btn\\\" data-skcomponent=\\\"skbutton\\\" data-skbuttontype=\\\"form-submit\\\" data-skform=\\\"registerForm\\\" data-skbuttonvalue=\\\"submit\\\"\u003eRegister\u003c/button\u003e\\n\u003c/form\u003e\"\n      }\n    ]\n  }\n]"
              },
              "formFieldsList" : {
                "value" : [
                  {
                    "displayName" : "Email",
                    "hashedVisibility" : false,
                    "preferredControlType" : "textField",
                    "preferredDataType" : "string",
                    "propertyName" : "email",
                    "value" : "[\n  {\n    \"children\": [\n      {\n        \"text\": \"\"\n      },\n      {\n        \"text\": \"\"\n      },\n      {\n        \"type\": \"link\",\n        \"src\": \"http.svg\",\n        \"url\": \"email\",\n        \"data\": \"{{local.cfpq1xg2dc.payload.output.email}}\",\n        \"tooltip\": \"{{local.cfpq1xg2dc.payload.output.email}}\",\n        \"children\": [\n          {\n            \"text\": \"email\"\n          }\n        ]\n      },\n      {\n        \"text\": \"\"\n      }\n    ]\n  }\n]"
                  },
                  {
                    "displayName" : "Password",
                    "hashedVisibility" : true,
                    "preferredControlType" : "textField",
                    "preferredDataType" : "string",
                    "propertyName" : "password",
                    "value" : ""
                  },
                  {
                    "preferredControlType" : "textField",
                    "preferredDataType" : "string",
                    "propertyName" : "buttonValue"
                  }
                ]
              },
              "nodeTitle" : {
                "value" : "Register New Email Form"
              },
              "validationRules" : {
                "value" : [
                  {
                    "propertyName" : "email",
                    "rules" : [
                      {
                        "message" : "Must be a valid email address",
                        "ruleName" : "email"
                      }
                    ]
                  },
                  {
                    "propertyName" : "password",
                    "rules" : [
                      {
                        "message" : "Must contain 8 or more characters that are of at least one number, and one uppercase, one lowercase letter, and one or more of the following special characters @$!.,%*?\u0026.",
                        "pattern" : "^(?=.*[a-z])(?=.*[A-Z])(?=.*\\d)(?=.*[@$!.,%*?\u0026])[A-Za-z\\d@$!.,%*?\u0026]{8,}$",
                        "ruleName" : "format"
                      }
                    ]
                  }
                ]
              }
            })
          }
          position = {
            x = 847
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
        "64the1zf75" = {
          data = {
            id              = "64the1zf75"
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
                    "key" : 0.15658883947546076,
                    "label" : "loggedInUser (string - flowInstance)",
                    "name" : "loggedInUser",
                    "nameDefault" : "email",
                    "type" : "string",
                    "value" : "[\n  {\n    \"children\": [\n      {\n        \"text\": \"\"\n      },\n      {\n        \"text\": \"\"\n      },\n      {\n        \"type\": \"link\",\n        \"src\": \"pingIdentity.svg\",\n        \"url\": \"email\",\n        \"data\": \"{{local.m4sfmek769.payload.output.matchedUser.email}}\",\n        \"tooltip\": \"{{local.m4sfmek769.payload.output.matchedUser.email}}\",\n        \"children\": [\n          {\n            \"text\": \"email\"\n          }\n        ]\n      },\n      {\n        \"text\": \"\"\n      }\n    ]\n  }\n]"
                  }
                ]
              },
              "nodeTitle" : {
                "value" : "Successfully Completed Login"
              }
            })
          }
          position = {
            x = 1417
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
                "value" : "[\n  {\n    \"children\": [\n      {\n        \"text\": \"\"\n      },\n      {\n        \"text\": \"\"\n      },\n      {\n        \"type\": \"link\",\n        \"src\": \"http.svg\",\n        \"url\": \"email\",\n        \"data\": \"{{local.0di26c5iy7.payload.output.email}}\",\n        \"tooltip\": \"{{local.0di26c5iy7.payload.output.email}}\",\n        \"children\": [\n          {\n            \"text\": \"email\"\n          }\n        ]\n      },\n      {\n        \"text\": \"\"\n      }\n    ]\n  }\n]"
              },
              "passwordForCreateUser" : {
                "value" : "[\n  {\n    \"children\": [\n      {\n        \"text\": \"\"\n      },\n      {\n        \"text\": \"\"\n      },\n      {\n        \"type\": \"link\",\n        \"src\": \"http.svg\",\n        \"url\": \"password\",\n        \"data\": \"{{local.0di26c5iy7.payload.output.password}}\",\n        \"tooltip\": \"{{local.0di26c5iy7.payload.output.password}}\",\n        \"children\": [\n          {\n            \"text\": \"password\"\n          }\n        ]\n      },\n      {\n        \"text\": \"\"\n      }\n    ]\n  }\n]"
              },
              "population" : {
                "value" : "useDefaultPopulation"
              },
              "username" : {
                "value" : "[\n  {\n    \"children\": [\n      {\n        \"text\": \"\"\n      },\n      {\n        \"text\": \"\"\n      },\n      {\n        \"type\": \"link\",\n        \"src\": \"http.svg\",\n        \"url\": \"email\",\n        \"data\": \"{{local.0di26c5iy7.payload.output.email}}\",\n        \"tooltip\": \"{{local.0di26c5iy7.payload.output.email}}\",\n        \"children\": [\n          {\n            \"text\": \"email\"\n          }\n        ]\n      },\n      {\n        \"text\": \"\"\n      }\n    ]\n  }\n]"
              }
            })
          }
          position = {
            x = 1117
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
        "7imwg8c7j4" = {
          data = {
            id              = "7imwg8c7j4"
            node_type       = "CONNECTION"
            connection_id   = pingone_davinci_connector_instance.http.id
            connector_id    = "httpConnector"
            name            = "Http"
            label           = "Http"
            capability_name = "customHTMLTemplate"
            type            = "trigger"
            status          = "configured"
            properties = jsonencode({
              "claimsNameValuePairs" : {
                "value" : [
                  {
                    "key" : 0.4322985925683791,
                    "label" : "userRegistered (boolean - flowInstance)",
                    "name" : "userRegistered",
                    "nameDefault" : "email",
                    "type" : "boolean",
                    "value" : "[\n  {\n    \"children\": [\n      {\n        \"text\": \"true\"\n      }\n    ]\n  }\n]"
                  }
                ]
              },
              "customHTML" : {
                "value" : "[\n  {\n    \"children\": [\n      {\n        \"text\": \"\u003ch2\u003eThank you for registering!\u003c/h2\u003e\\n\u003cbutton class=\\\"btn\\\" id=\\\"login\\\"\u003eLogin\u003c/button\u003e\"\n      }\n    ]\n  }\n]"
              },
              "customScript" : {
                "value" : "(() =\u003e {\n    document.getElementById('login').addEventListener('click', () =\u003e window.location.reload());\n})();"
              },
              "nodeTitle" : {
                "value" : "Successfully Completed Registration"
              }
            })
          }
          position = {
            x = 1417
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
        "8uo3defwup" = {
          data = {
            id        = "8uo3defwup"
            node_type = "EVAL"
          }
          position = {
            x = 1237
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
        "auhsovpoa8" = {
          data = {
            id        = "auhsovpoa8"
            node_type = "EVAL"
            label     = "Evaluator"
          }
          position = {
            x = 967
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
        "cfpq1xg2dc" = {
          data = {
            id              = "cfpq1xg2dc"
            node_type       = "CONNECTION"
            connection_id   = pingone_davinci_connector_instance.http.id
            connector_id    = "httpConnector"
            name            = "Http"
            label           = "Http"
            capability_name = "customHTMLTemplate"
            type            = "trigger"
            status          = "configured"
            properties = jsonencode({
              "customHTML" : {
                "value" : "[\n  {\n    \"children\": [\n      {\n        \"text\": \"\u003cform id=\\\"emailForm\\\"\u003e\\n    \u003cinput type=\\\"text\\\" id=\\\"email\\\" name=\\\"email\\\" placeholder=\\\"Email Address\\\" /\u003e\\n    \u003cdiv data-skcomponent=\\\"skerrormessage\\\" class=\\\"input-error-msg text-danger\\\" data-skerrorid=\\\"email\\\"\u003e\u003c/div\u003e\\n    \u003cbutton class=\\\"btn\\\" data-skcomponent=\\\"skbutton\\\" data-skbuttontype=\\\"form-submit\\\" data-skform=\\\"emailForm\\\" data-skbuttonvalue=\\\"submit\\\"\u003eSubmit\u003c/button\u003e\\n\u003cform\u003e\"\n      }\n    ]\n  }\n]"
              },
              "formFieldsList" : {
                "value" : [
                  {
                    "displayName" : "Email",
                    "hashedVisibility" : false,
                    "preferredControlType" : "textField",
                    "preferredDataType" : "string",
                    "propertyName" : "email",
                    "value" : ""
                  },
                  {
                    "hashedVisibility" : false,
                    "preferredControlType" : "textField",
                    "preferredDataType" : "string",
                    "propertyName" : "buttonValue",
                    "value" : ""
                  }
                ]
              },
              "validationRules" : {
                "value" : [
                  {
                    "propertyName" : "email",
                    "rules" : [
                      {
                        "message" : "Must be a valid email address",
                        "ruleName" : "email"
                      }
                    ]
                  }
                ]
              }
            })
          }
          position = {
            x = 277
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
        "eg2kadjdo1" = {
          data = {
            id              = "eg2kadjdo1"
            node_type       = "CONNECTION"
            connection_id   = pingone_davinci_connector_instance.http.id
            connector_id    = "httpConnector"
            name            = "Http"
            label           = "Http"
            capability_name = "customHTMLTemplate"
            type            = "trigger"
            status          = "configured"
            properties = jsonencode({
              "customHTML" : {
                "value" : "[\n  {\n    \"children\": [\n      {\n        \"text\": \"\u003cform id=\\\"loginForm\\\"\u003e\"\n      }\n    ]\n  },\n  {\n    \"children\": [\n      {\n        \"text\": \"\\t\u003cdiv data-skcomponent=\\\"skerror\\\" style=\\\"color: red; padding-bottom: 1rem; text-align: center;\\\" class=\\\"feedback feedback--error sk-alert sk-alert-danger has-text-danger has-background-danger-light text-danger text-center pb-3\\\" data-id=\\\"feedback\\\" data-skvisibility=\\\"\\\"\u003e\u003c/div\u003e\\n    \u003cinput type=\\\"password\\\" id=\\\"password\\\" placeholder=\\\"password\\\" /\u003e\\n    \u003cbutton class=\\\"btn\\\" data-skcomponent=\\\"skbutton\\\" data-skbuttontype=\\\"form-submit\\\" data-skform=\\\"loginForm\\\" data-skbuttonvalue=\\\"submit\\\"\u003eLogin\u003c/button\u003e\\n\u003c/form\u003e\"\n      }\n    ]\n  }\n]"
              },
              "formFieldsList" : {
                "value" : [
                  {
                    "displayName" : "Password",
                    "hashedVisibility" : true,
                    "preferredControlType" : "textField",
                    "preferredDataType" : "string",
                    "propertyName" : "password",
                    "value" : ""
                  },
                  {
                    "preferredControlType" : "textField",
                    "preferredDataType" : "string",
                    "propertyName" : "buttonValue"
                  }
                ]
              },
              "nodeTitle" : {
                "value" : "Enter Password Form"
              },
              "validationRules" : {
                "value" : [
                  {
                    "propertyName" : "password",
                    "rules" : [
                      {
                        "message" : "Must contain 8 or more characters that are of at least one number, and one uppercase, one lowercase letter, and one or more of the following special characters @$!.,%*?\u0026.",
                        "pattern" : "^(?=.*[a-z])(?=.*[A-Z])(?=.*\\d)(?=.*[@$!.,%*?\u0026])[A-Za-z\\d@$!.,%*?\u0026]{8,}$",
                        "ruleName" : "format"
                      }
                    ]
                  }
                ]
              }
            })
          }
          position = {
            x = 847
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
        "fyg4fdn344" = {
          data = {
            id        = "fyg4fdn344"
            node_type = "EVAL"
          }
          position = {
            x = 397
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
        "hcmfduc8d9" = {
          data = {
            id        = "hcmfduc8d9"
            node_type = "EVAL"
            label     = "Evaluator"
          }
          position = {
            x = 1237
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
                "value" : "[\n  {\n    \"children\": [\n      {\n        \"text\": \"\"\n      },\n      {\n        \"text\": \"\"\n      },\n      {\n        \"type\": \"link\",\n        \"src\": \"http.svg\",\n        \"url\": \"email\",\n        \"data\": \"{{local.cfpq1xg2dc.payload.output.email}}\",\n        \"tooltip\": \"{{local.cfpq1xg2dc.payload.output.email}}\",\n        \"children\": [\n          {\n            \"text\": \"email\"\n          }\n        ]\n      },\n      {\n        \"text\": \"\"\n      }\n    ]\n  }\n]"
              }
            })
          }
          position = {
            x = 547
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
                "value" : "[\n  {\n    \"children\": [\n      {\n        \"text\": \"\"\n      },\n      {\n        \"text\": \"\"\n      },\n      {\n        \"type\": \"link\",\n        \"src\": \"http.svg\",\n        \"url\": \"email\",\n        \"data\": \"{{local.cfpq1xg2dc.payload.output.email}}\",\n        \"tooltip\": \"{{local.cfpq1xg2dc.payload.output.email}}\",\n        \"children\": [\n          {\n            \"text\": \"email\"\n          }\n        ]\n      },\n      {\n        \"text\": \"\"\n      }\n    ]\n  }\n]"
              },
              "matchAttribute" : {
                "value" : "email"
              },
              "password" : {
                "value" : "[\n  {\n    \"children\": [\n      {\n        \"text\": \"\"\n      },\n      {\n        \"text\": \"\"\n      },\n      {\n        \"type\": \"link\",\n        \"src\": \"http.svg\",\n        \"url\": \"password\",\n        \"data\": \"{{local.eg2kadjdo1.payload.output.password}}\",\n        \"tooltip\": \"{{local.eg2kadjdo1.payload.output.password}}\",\n        \"children\": [\n          {\n            \"text\": \"password\"\n          }\n        ]\n      },\n      {\n        \"text\": \"\"\n      }\n    ]\n  }\n]"
              }
            })
          }
          position = {
            x = 1117
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
        "tx0qrifdc8" = {
          data = {
            id        = "tx0qrifdc8"
            node_type = "EVAL"
            label     = "Evaluator"
          }
          position = {
            x = 966.5
            y = 236.75
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
              }
            })
          }
          position = {
            x = 667
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
      }
      edges = {
        "2jkvc6rbx3" = {
          data = {
            id     = "2jkvc6rbx3"
            source = "hcmfduc8d9"
            target = "7imwg8c7j4"
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
        "56je658g3m" = {
          data = {
            id     = "56je658g3m"
            source = "tx0qrifdc8"
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
        "63jzayvdql" = {
          data = {
            id     = "63jzayvdql"
            source = "auhsovpoa8"
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
        "7xh26arsu2" = {
          data = {
            id     = "7xh26arsu2"
            source = "yqi3iaujxx"
            target = "0di26c5iy7"
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
        "a30k2zzp2s" = {
          data = {
            id     = "a30k2zzp2s"
            source = "yqi3iaujxx"
            target = "eg2kadjdo1"
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
        "dlgb6bc47d" = {
          data = {
            id     = "dlgb6bc47d"
            source = "fyg4fdn344"
            target = "m4sfmek769"
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
        "l69t6tv4wc" = {
          data = {
            id     = "l69t6tv4wc"
            source = "cfpq1xg2dc"
            target = "fyg4fdn344"
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
        "p071062a0c" = {
          data = {
            id     = "p071062a0c"
            source = "8uo3defwup"
            target = "64the1zf75"
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
        "qsnral171j" = {
          data = {
            id     = "qsnral171j"
            source = "eg2kadjdo1"
            target = "tx0qrifdc8"
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
        "xj61qimmey" = {
          data = {
            id     = "xj61qimmey"
            source = "0di26c5iy7"
            target = "auhsovpoa8"
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
}