##########################################################################
# pingone_davinci_flow.tf
# Declarations for PingOne DaVinci Flow.
# {@link https://registry.terraform.io/providers/pingidentity/pingone/latest/docs/resources/davinci_flow}
# {@link https://docs.pingidentity.com/davinci/flows/davinci_flows.html}
##########################################################################


resource "pingone_davinci_flow" "pingone_davinci_sso_protect_example" {
  environment_id = pingone_environment.my_environment.id
  name           = "PingOne DaVinci SSO Protect Example"
  description    = "Imported on Tue May 16 2023 19:35:07 GMT+0000 (Coordinated Universal Time)"
  color          = "#AFD5FF"

  settings = {
    csp                              = "worker-src 'self' blob:; script-src 'self' https://cdn.jsdelivr.net https://code.jquery.com https://devsdk.singularkey.com http://cdnjs.cloudflare.com 'unsafe-inline' 'unsafe-eval';"
    css                              = ".companyLogo {\n    /* Ping Logo  */\n    content: url(\"https://assets.pingone.com/ux/ui-library/5.0.2/images/logo-pingidentity.png\");\n    height: 65px;\n    width: 65px;\n}"
    log_level                        = 2
    use_custom_css                   = true
    intermediate_loading_screen_css  = ""
    intermediate_loading_screen_html = ""
    css_links                        = ["https://assets.pingone.com/ux/end-user-nano/0.1.0-alpha.1/end-user-nano.css", "https://assets.pingone.com/ux/astro-nano/0.1.0-alpha.7/icons.css"]
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
              "ij45fm4h76" : {
                "value" : "allTriggersFalse"
              },
              "u6w4ob97dt" : {
                "value" : "allTriggersFalse"
              }
            })
          }
          position = {
            x = 2167
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
        "0mqv2pv49t" = {
          data = {
            id              = "0mqv2pv49t"
            node_type       = "CONNECTION"
            connection_id   = pingone_davinci_connector_instance.variables.id
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
                  },
                  {
                    "key" : 0.03547881087858262,
                    "label" : "riskSDKOutput (string - flowInstance)",
                    "name" : "riskSDKOutput",
                    "nameDefault" : "riskSDKOutput",
                    "type" : "string",
                    "value" : "[\n  {\n    \"children\": [\n      {\n        \"text\": \"\"\n      },\n      {\n        \"text\": \"\"\n      },\n      {\n        \"type\": \"link\",\n        \"src\": \"http.svg\",\n        \"url\": \"riskSDKOutput\",\n        \"data\": \"{{local.3a7vnut1c8.payload.output.riskSDKOutput}}\",\n        \"tooltip\": \"{{local.3a7vnut1c8.payload.output.riskSDKOutput}}\",\n        \"children\": [\n          {\n            \"text\": \"riskSDKOutput\"\n          }\n        ]\n      },\n      {\n        \"text\": \"\"\n      }\n    ]\n  }\n]"
                  }
                ]
              }
            })
          }
          position = {
            x = 1470
            y = 510
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
            connection_id   = pingone_davinci_connector_instance.variables.id
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
                  },
                  {
                    "key" : 0.045596971849856116,
                    "label" : "riskSDKOutput (string - flowInstance)",
                    "name" : "riskSDKOutput",
                    "nameDefault" : "riskSDKOutput",
                    "type" : "string",
                    "value" : "[\n  {\n    \"children\": [\n      {\n        \"text\": \"\"\n      },\n      {\n        \"text\": \"\"\n      },\n      {\n        \"type\": \"link\",\n        \"src\": \"http.svg\",\n        \"url\": \"riskSDKOutput\",\n        \"data\": \"{{local.n9qaul10jk.payload.output.riskSDKOutput}}\",\n        \"tooltip\": \"{{local.n9qaul10jk.payload.output.riskSDKOutput}}\",\n        \"children\": [\n          {\n            \"text\": \"riskSDKOutput\"\n          }\n        ]\n      },\n      {\n        \"text\": \"\"\n      }\n    ]\n  }\n]"
                  }
                ]
              }
            })
          }
          position = {
            x = 1470
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
        "3a7vnut1c8" = {
          data = {
            id              = "3a7vnut1c8"
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
                "value" : "[[[skcomponent###c2tjb21wb25lbnQgInNrcmlzayIgIGVudmlyb25tZW50SWQ9IiIgY29sbGVjdEJlaGF2aW9yYWxEYXRhPSJ0cnVlIiBwcm9wZXJ0eW5hbWU9InJpc2tmcCI=###eyJuYW1lIjoic2tyaXNrIiwib3B0aW9ucyI6eyJlbnZpcm9ubWVudElkIjoiIiwiY29sbGVjdEJlaGF2aW9yYWxEYXRhIjoidHJ1ZSIsInByb3BlcnR5bmFtZSI6InJpc2tmcCJ9LCJjb21wb25lbnRQcm9wcyI6eyJlbnZpcm9ubWVudElkIjp7Im5hbWUiOiJlbnZpcm9ubWVudElkIiwiZGlzcGxheU5hbWUiOiJFbnZpcm9ubWVudCBJRCJ9LCJjb2xsZWN0QmVoYXZpb3JhbERhdGEiOnsibmFtZSI6ImNvbGxlY3RCZWhhdmlvcmFsRGF0YSIsImRpc3BsYXlOYW1lIjoiQ29sbGVjdCBiZWhhdmlvcmFsIGRhdGEiLCJ0eXBlIjoic2VsZWN0IiwidmFsdWUiOiJ0cnVlIiwiaW5mbyI6IkJlaGF2aW9yYWwgZGF0YSBpcyB1c2VkIHRvIGRldGVjdCBIdW1hbi9Ob24gSHVtYW4gdXNlcnMuIEl0IGlzIHJlY29tbWVuZGVkIHRvIHNldCB0aGUgc2FtZSB2YWx1ZSB0aHJvdWdob3V0IHRoZSBmbG93LiIsIm9wdGlvbnMiOlt7Im5hbWUiOiJUcnVlIiwidmFsdWUiOiJ0cnVlIn0seyJuYW1lIjoiRmFsc2UiLCJ2YWx1ZSI6ImZhbHNlIn1dfSwicHJvcGVydHluYW1lIjp7Im5hbWUiOiJwcm9wZXJ0eW5hbWUiLCJkaXNwbGF5TmFtZSI6IlJpc2sgUHJvcGVydHkgTmFtZSIsInZhbHVlIjoicmlza2ZwIiwiaW5mbyI6Ik5hbWUgZm9yIHJlZmVyZW5jaW5nIHRoaXMgcmlzayBjb21wb25lbnQifX19]]]\n\u003cdiv\n  class=\"bg-light d-flex flex-column justify-content-center align-items-center position-absolute top-0 start-0 bottom-0 end-0 overflow-auto\"\u003e\n  \u003cdiv style=\"max-width: 400px; min-width: 400px; width: 100%\"\u003e\n    \u003cdiv class=\"card shadow mb-5\"\u003e\n      \u003cdiv class=\"card-body p-5 d-flex flex-column\"\u003e\n        \u003cimg class=\"companyLogo align-self-center mb-5\" alt=\"{{global.variables.companyName}}\" /\u003e\n        \u003ch1 class=\"text-center mb-4\"\u003eCreate Account\u003c/h1\u003e\n        \u003cp class=\"text-muted text-center\"\u003eWelcome to Ping Identity\u003c/p\u003e\n        \u003cp class=\"text-danger mdi mdi-alert-circle\" data-id=\"feedback\" data-skcomponent=\"skerror\"\u003e\u003c/p\u003e\n        \u003cform id=\"regForm\" data-id=\"regForm\"\u003e\n          \u003cdiv class=\"mb-4 form-floating\"\u003e\n            \u003cinput class=\"form-control\" type=\"text\" id=\"username\" name=\"username\" placeholder=\"username\"\n              autocomplete=\"off\" value={{local.d9583hqcp9.payload.output.username}} data-id=\"username-input\" disabled/\u003e\n            \u003clabel class=\"form-label\" for=\"username\"\u003eUsername\u003c/label\u003e\n          \u003c/div\u003e\n          \u003cdiv class=\"mb-4 form-floating\"\u003e\n            \u003cinput class=\"form-control\" type=\"text\" id=\"fname\" name=\"fname\" placeholder=\"fname\"\n              autocomplete=\"off\" value=\"\" data-id=\"fname-input\" /\u003e\n            \u003clabel class=\"form-label\" for=\"fname\"\u003eFirst Name\u003c/label\u003e\n            \u003cdiv data-skcomponent=\"skerrormessage\" class=\"text-danger validation-message\" data-skerrorid=\"fname\"\u003e\u003c/div\u003e\n          \u003c/div\u003e\n          \u003cdiv class=\"mb-4 form-floating\"\u003e\n            \u003cinput class=\"form-control\" type=\"text\" id=\"lname\" name=\"lname\" placeholder=\"lname\"\n              autocomplete=\"off\" value=\"\" data-id=\"lname-input\" /\u003e\n            \u003clabel class=\"form-label\" for=\"lname\"\u003eLast Name\u003c/label\u003e\n            \u003cdiv data-skcomponent=\"skerrormessage\" class=\"text-danger validation-message\" data-skerrorid=\"lname\"\u003e\u003c/div\u003e\n          \u003c/div\u003e\n          \u003cdiv class=\"mb-4 form-floating\"\u003e\n            \u003cinput class=\"form-control\" type=\"text\" id=\"email\" name=\"email\" placeholder=\"email\"\n              autocomplete=\"off\" value=\"\" data-id=\"email-input\" /\u003e\n            \u003clabel class=\"form-label\" for=\"email\"\u003eEmail Address\u003c/label\u003e\n            \u003cdiv data-skcomponent=\"skerrormessage\" class=\"text-danger validation-message\" data-skerrorid=\"email\"\u003e\u003c/div\u003e\n          \u003c/div\u003e\n          \u003cdiv id=\"passwordDiv\" class=\"mb-4 form-floating\"\u003e\n            \u003cinput class=\"form-control\" type=\"password\" id=\"password\" name=\"password\" placeholder=\"Password\"\n              autocomplete=\"off\" value=\"\" data-id=\"password-input\" /\u003e\n            \u003clabel class=\"form-label\" for=\"password\"\u003ePassword\u003c/label\u003e\n            \u003cdiv data-skcomponent=\"skerrormessage\" class=\"text-danger validation-message\" data-skerrorid=\"password\"\u003e\u003c/div\u003e\n          \u003c/div\u003e\n          \u003cdiv class=\"d-flex flex-column\"\u003e\n            \u003cbutton data-id=\"button\" type=\"submit\" class=\"btn btn-primary mb-3\" data-skcomponent=\"skbutton\"\n              data-skbuttontype=\"form-submit\" data-skform=\"regForm\" id=\"btnSignIn\"\n              data-skbuttonvalue=\"register\"\u003e\n              Register\n            \u003c/button\u003e\n          \u003c/div\u003e\n        \u003c/form\u003e\n      \u003c/div\u003e\n    \u003c/div\u003e\n  \u003c/div\u003e\n\u003c/div\u003e"
              },
              "customScript" : {
                "value" : "// Focus on the first input element on the page\nconst focusOnFirstInputElement = () =\u003e {\n    const element = document.querySelector(\"input\");\n\n    // Set focus on the first input element, if it exists\n    if (element) {\n        element.focus();\n    }\n};\n\nfunction makePasswordToggle(id) {\n    var container = document.getElementById(id);\n    var password = container.getElementsByTagName(\"input\")[0];\n    var toggler = document.createElement(\"button\");\n    toggler.setAttribute(\"tabindex\", \"-1\");\n    toggler.setAttribute(\"type\", \"button\");\n    toggler.setAttribute(\"aria-label\", \"Show/Hide Password\");\n    toggler.className = \"btn mdi mdi-eye-off-outline position-absolute end-0 top-50 translate-middle-y\";\n    container.appendChild(toggler);\n     \n    function showHidePassword() {\n        if (password.type == \"password\") {\n            password.setAttribute(\"type\", \"text\");\n            toggler.classList.add(\"mdi-eye-outline\");\n            toggler.classList.remove(\"mdi-eye-off-outline\");\n        } else {\n            toggler.classList.add(\"mdi-eye-off-outline\");\n            toggler.classList.remove(\"mdi-eye-outline\");\n            password.setAttribute(\"type\", \"password\");\n        }\n        password.focus();\n    };\n \n    toggler.addEventListener(\"click\", showHidePassword);\n}\n \nfunction start() {\n    makePasswordToggle(\"passwordDiv\");\n    focusOnFirstInputElement();\n}\n \nif (document.readyState === \"loading\") {\n    // Loading hasn't finished yet\n    document.addEventListener(\"DOMContentLoaded\", start);\n} else {\n    // `DOMContentLoaded` has already fired\n    start();\n}"
              },
              "formFieldsList" : {
                "value" : [
                  {
                    "preferredControlType" : "textField",
                    "preferredDataType" : "string",
                    "propertyName" : "buttonValue"
                  },
                  {
                    "displayName" : "First Name",
                    "hashedVisibility" : false,
                    "preferredControlType" : "textField",
                    "preferredDataType" : "string",
                    "propertyName" : "fname",
                    "value" : ""
                  },
                  {
                    "displayName" : "Last Name",
                    "hashedVisibility" : false,
                    "preferredControlType" : "textField",
                    "preferredDataType" : "string",
                    "propertyName" : "lname",
                    "value" : ""
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
                    "displayName" : "Risk Output",
                    "hashedVisibility" : false,
                    "preferredControlType" : "textField",
                    "preferredDataType" : "string",
                    "propertyName" : "riskSDKOutput",
                    "value" : ""
                  },
                  {
                    "displayName" : "Email Address",
                    "hashedVisibility" : false,
                    "preferredControlType" : "textField",
                    "preferredDataType" : "string",
                    "propertyName" : "email",
                    "value" : ""
                  }
                ]
              },
              "nodeTitle" : {
                "value" : "Registration Form"
              },
              "validationRules" : {
                "value" : [
                  {
                    "propertyName" : "fname",
                    "rules" : [
                      {
                        "message" : "First name is required",
                        "ruleName" : "presence"
                      }
                    ]
                  },
                  {
                    "propertyName" : "lname",
                    "rules" : [
                      {
                        "message" : "Last name is required",
                        "ruleName" : "presence"
                      }
                    ]
                  },
                  {
                    "propertyName" : "password",
                    "rules" : [
                      {
                        "message" : "Password is required",
                        "ruleName" : "presence"
                      }
                    ]
                  },
                  {
                    "propertyName" : "email",
                    "rules" : [
                      {
                        "message" : "Email is required",
                        "ruleName" : "presence"
                      }
                    ]
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
        "3m229em5w4" = {
          data = {
            id        = "3m229em5w4"
            node_type = "EVAL"
          }
          position = {
            x = 1620
            y = 315
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
        "5fy38889km" = {
          data = {
            id              = "5fy38889km"
            node_type       = "CONNECTION"
            connection_id   = pingone_davinci_connector_instance.pingone_authentication.id
            connector_id    = "pingOneAuthenticationConnector"
            name            = "PingOne Authentication"
            label           = "PingOne Authentication"
            capability_name = "setSession"
            type            = "action"
            status          = "configured"
            properties = jsonencode({
              "idleTimeout" : {
                "value" : 43200
              },
              "userId" : {
                "value" : "[\n  {\n    \"children\": [\n      {\n        \"text\": \"\"\n      },\n      {\n        \"text\": \"\"\n      },\n      {\n        \"type\": \"link\",\n        \"src\": \"variable.svg\",\n        \"url\": \"userId\",\n        \"data\": \"{{global.variables.userId}}\",\n        \"tooltip\": \"{{global.variables.userId}}\",\n        \"children\": [\n          {\n            \"text\": \"userId\"\n          }\n        ]\n      },\n      {\n        \"text\": \"\"\n      }\n    ]\n  }\n]"
              }
            })
          }
          position = {
            x = 1770
            y = 360
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
            connection_id   = pingone_davinci_connector_instance.pingone.id
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
                "value" : "[\n  {\n    \"children\": [\n      {\n        \"text\": \"\"\n      },\n      {\n        \"text\": \"\"\n      },\n      {\n        \"type\": \"link\",\n        \"src\": \"http.svg\",\n        \"url\": \"email\",\n        \"data\": \"{{local.3a7vnut1c8.payload.output.email}}\",\n        \"tooltip\": \"{{local.3a7vnut1c8.payload.output.email}}\",\n        \"children\": [\n          {\n            \"text\": \"email\"\n          }\n        ]\n      },\n      {\n        \"text\": \"\"\n      }\n    ]\n  }\n]"
              },
              "family" : {
                "value" : "[\n  {\n    \"children\": [\n      {\n        \"text\": \"\"\n      },\n      {\n        \"text\": \"\"\n      },\n      {\n        \"type\": \"link\",\n        \"src\": \"http.svg\",\n        \"url\": \"lname\",\n        \"data\": \"{{local.3a7vnut1c8.payload.output.lname}}\",\n        \"tooltip\": \"{{local.3a7vnut1c8.payload.output.lname}}\",\n        \"children\": [\n          {\n            \"text\": \"lname\"\n          }\n        ]\n      },\n      {\n        \"text\": \"\"\n      }\n    ]\n  }\n]"
              },
              "given" : {
                "value" : "[\n  {\n    \"children\": [\n      {\n        \"text\": \"\"\n      },\n      {\n        \"text\": \"\"\n      },\n      {\n        \"type\": \"link\",\n        \"src\": \"http.svg\",\n        \"url\": \"fname\",\n        \"data\": \"{{local.3a7vnut1c8.payload.output.fname}}\",\n        \"tooltip\": \"{{local.3a7vnut1c8.payload.output.fname}}\",\n        \"children\": [\n          {\n            \"text\": \"fname\"\n          }\n        ]\n      },\n      {\n        \"text\": \"\"\n      }\n    ]\n  }\n]"
              },
              "passwordForCreateUser" : {
                "value" : "[\n  {\n    \"children\": [\n      {\n        \"text\": \"\"\n      },\n      {\n        \"text\": \"\"\n      },\n      {\n        \"type\": \"link\",\n        \"src\": \"http.svg\",\n        \"url\": \"password\",\n        \"data\": \"{{local.3a7vnut1c8.payload.output.password}}\",\n        \"tooltip\": \"{{local.3a7vnut1c8.payload.output.password}}\",\n        \"children\": [\n          {\n            \"text\": \"password\"\n          }\n        ]\n      },\n      {\n        \"text\": \"\"\n      }\n    ]\n  }\n]"
              },
              "population" : {
                "value" : "useDefaultPopulation"
              },
              "username" : {
                "value" : "[\n  {\n    \"children\": [\n      {\n        \"text\": \"\"\n      },\n      {\n        \"text\": \"\"\n      },\n      {\n        \"type\": \"link\",\n        \"src\": \"http.svg\",\n        \"url\": \"username\",\n        \"data\": \"{{local.d9583hqcp9.payload.output.username}}\",\n        \"tooltip\": \"{{local.d9583hqcp9.payload.output.username}}\",\n        \"children\": [\n          {\n            \"text\": \"username\"\n          }\n        ]\n      },\n      {\n        \"text\": \"\"\n      }\n    ]\n  }\n]"
              }
            })
          }
          position = {
            x = 1147
            y = 506
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
              },
              "pausjqv615" : {
                "value" : "allTriggersFalse"
              }
            })
          }
          position = {
            x = 1267
            y = 296
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
              "hhj5mpkk0u" : {
                "value" : "allTriggersFalse"
              },
              "kc7wrmpc93" : {
                "value" : "allTriggersFalse"
              }
            })
          }
          position = {
            x = 1297
            y = 506
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
        "9g690zq061" = {
          data = {
            id        = "9g690zq061"
            node_type = "EVAL"
          }
          position = {
            x = 1893.5
            y = 358
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
        "d9583hqcp9" = {
          data = {
            id              = "d9583hqcp9"
            node_type       = "CONNECTION"
            connection_id   = pingone_davinci_connector_instance.http.id
            connector_id    = "httpConnector"
            name            = "Http"
            label           = "Http"
            capability_name = "customHTMLTemplate"
            type            = "trigger"
            status          = "configured"
            properties = jsonencode({
              "backgroundColor" : {
                "value" : "#afd5ffff"
              },
              "customCSS" : {},
              "customHTML" : {
                "value" : "[[[skcomponent###c2tjb21wb25lbnQgInNrcmlzayIgIGVudmlyb25tZW50SWQ9IiIgY29sbGVjdEJlaGF2aW9yYWxEYXRhPSJ0cnVlIiBwcm9wZXJ0eW5hbWU9InJpc2tmcCI=###eyJuYW1lIjoic2tyaXNrIiwib3B0aW9ucyI6eyJlbnZpcm9ubWVudElkIjoiIiwiY29sbGVjdEJlaGF2aW9yYWxEYXRhIjoidHJ1ZSIsInByb3BlcnR5bmFtZSI6InJpc2tmcCJ9LCJjb21wb25lbnRQcm9wcyI6eyJlbnZpcm9ubWVudElkIjp7Im5hbWUiOiJlbnZpcm9ubWVudElkIiwiZGlzcGxheU5hbWUiOiJFbnZpcm9ubWVudCBJRCJ9LCJjb2xsZWN0QmVoYXZpb3JhbERhdGEiOnsibmFtZSI6ImNvbGxlY3RCZWhhdmlvcmFsRGF0YSIsImRpc3BsYXlOYW1lIjoiQ29sbGVjdCBiZWhhdmlvcmFsIGRhdGEiLCJ0eXBlIjoic2VsZWN0IiwidmFsdWUiOiJ0cnVlIiwiaW5mbyI6IkJlaGF2aW9yYWwgZGF0YSBpcyB1c2VkIHRvIGRldGVjdCBIdW1hbi9Ob24gSHVtYW4gdXNlcnMuIEl0IGlzIHJlY29tbWVuZGVkIHRvIHNldCB0aGUgc2FtZSB2YWx1ZSB0aHJvdWdob3V0IHRoZSBmbG93LiIsIm9wdGlvbnMiOlt7Im5hbWUiOiJUcnVlIiwidmFsdWUiOiJ0cnVlIn0seyJuYW1lIjoiRmFsc2UiLCJ2YWx1ZSI6ImZhbHNlIn1dfSwicHJvcGVydHluYW1lIjp7Im5hbWUiOiJwcm9wZXJ0eW5hbWUiLCJkaXNwbGF5TmFtZSI6IlJpc2sgUHJvcGVydHkgTmFtZSIsInZhbHVlIjoicmlza2ZwIiwiaW5mbyI6Ik5hbWUgZm9yIHJlZmVyZW5jaW5nIHRoaXMgcmlzayBjb21wb25lbnQifX19]]]\n\u003cdiv\n  class=\"bg-light d-flex flex-column justify-content-center align-items-center position-absolute top-0 start-0 bottom-0 end-0 overflow-auto\"\u003e\n  \u003cdiv style=\"max-width: 400px; min-width: 400px; width: 100%\"\u003e\n    \u003cdiv class=\"card shadow mb-5\"\u003e\n      \u003cdiv class=\"card-body p-5 d-flex flex-column\"\u003e\n        \u003cimg class=\"companyLogo align-self-center mb-5\" alt=\"{{global.variables.companyName}}\" /\u003e\n        \u003ch1 class=\"text-center mb-4\"\u003eSign On\u003c/h1\u003e\n        \u003cp class=\"text-muted text-center\"\u003eWelcome to Ping Identity\u003c/p\u003e\n        \u003cp class=\"text-danger mdi mdi-alert-circle\" data-id=\"feedback\" data-skcomponent=\"skerror\"\u003e\u003c/p\u003e\n        \u003cform id=\"usernameForm\" data-id=\"usernameForm\"\u003e\n          \u003cdiv class=\"mb-4 form-floating\"\u003e\n            \u003cinput class=\"form-control\" type=\"text\" id=\"username\" name=\"username\" placeholder=\"username\"\n              autocomplete=\"off\" value=\"\" data-id=\"username-input\" /\u003e\n            \u003clabel class=\"form-label\" for=\"username\"\u003eUsername\u003c/label\u003e\n            \u003cdiv data-skcomponent=\"skerrormessage\" class=\"text-danger validation-message\" data-skerrorid=\"username\"\u003e\u003c/div\u003e\n          \u003c/div\u003e\n          \u003cdiv class=\"d-flex flex-column\"\u003e\n            \u003cbutton data-id=\"button\" type=\"submit\" class=\"btn btn-primary mb-3\" data-skcomponent=\"skbutton\"\n              data-skbuttontype=\"form-submit\" data-skform=\"usernameForm\" id=\"btnSignIn\"\n              data-skbuttonvalue=\"next\"\u003e\n              Next\n            \u003c/button\u003e\n          \u003c/div\u003e\n        \u003c/form\u003e\n      \u003c/div\u003e\n    \u003c/div\u003e\n  \u003c/div\u003e\n\u003c/div\u003e"
              },
              "customScript" : {
                "value" : "// Focus on the first input element on the page\nconst focusOnFirstInputElement = () =\u003e {\n    const element = document.querySelector(\"input\");\n\n    // Set focus on the first input element, if it exists\n    if (element) {\n        element.focus();\n    }\n};\n \nfunction start() {\n    focusOnFirstInputElement();\n}\n \nif (document.readyState === \"loading\") {\n    // Loading hasn't finished yet\n    document.addEventListener(\"DOMContentLoaded\", start);\n} else {\n    // `DOMContentLoaded` has already fired\n    start();\n}"
              },
              "formFieldsList" : {
                "value" : [
                  {
                    "displayName" : "Username",
                    "hashedVisibility" : false,
                    "preferredControlType" : "textField",
                    "preferredDataType" : "string",
                    "propertyName" : "username",
                    "value" : "[\n  {\n    \"children\": [\n      {\n        \"text\": \"\"\n      }\n    ]\n  }\n]"
                  },
                  {
                    "preferredControlType" : "textField",
                    "preferredDataType" : "string",
                    "propertyName" : "buttonValue"
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
                    "displayName" : "Risk Output",
                    "hashedVisibility" : false,
                    "preferredControlType" : "textField",
                    "preferredDataType" : "string",
                    "propertyName" : "riskSDKOutput",
                    "value" : ""
                  }
                ]
              },
              "nodeTitle" : {
                "value" : "Username Form"
              },
              "validationRules" : {
                "value" : [
                  {
                    "propertyName" : "username",
                    "rules" : [
                      {
                        "message" : "Username is required",
                        "ruleName" : "presence"
                      }
                    ]
                  }
                ]
              }
            })
          }
          position = {
            x = 277
            y = 296
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
        "dwmluz6lew" = {
          data = {
            id        = "dwmluz6lew"
            node_type = "EVAL"
          }
          position = {
            x = 1012
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
        "g6narytx9z" = {
          data = {
            id              = "g6narytx9z"
            node_type       = "CONNECTION"
            connection_id   = pingone_davinci_connector_instance.pingone_authentication.id
            connector_id    = "pingOneAuthenticationConnector"
            name            = "PingOne Authentication"
            label           = "PingOne Authentication"
            capability_name = "returnSuccessResponseRedirect"
            type            = "action"
            status          = "configured"
            properties = jsonencode({
              "idTokenClaims" : {
                "value" : [
                  {
                    "key" : 0.9317182139746887,
                    "label" : "riskScore (object - flowInstance)",
                    "name" : "riskScore",
                    "nameDefault" : "result",
                    "type" : "object",
                    "value" : "[\n  {\n    \"children\": [\n      {\n        \"text\": \"\"\n      },\n      {\n        \"text\": \"\"\n      },\n      {\n        \"type\": \"link\",\n        \"src\": \"pingIdentity.svg\",\n        \"url\": \"result\",\n        \"data\": \"{{local.l9q5mxjjtm.payload.output.rawResponse.result}}\",\n        \"tooltip\": \"{{local.l9q5mxjjtm.payload.output.rawResponse.result}}\",\n        \"children\": [\n          {\n            \"text\": \"result\"\n          }\n        ]\n      },\n      {\n        \"text\": \"\"\n      }\n    ]\n  }\n]"
                  }
                ]
              },
              "idleTimeout" : {
                "value" : 43200
              },
              "userId" : {
                "value" : "[\n  {\n    \"children\": [\n      {\n        \"text\": \"\"\n      },\n      {\n        \"text\": \"\"\n      },\n      {\n        \"type\": \"moustache\",\n        \"data\": \"{{global.variables.userId}}\",\n        \"name\": \"userId\",\n        \"children\": [\n          {\n            \"text\": \"\"\n          }\n        ]\n      },\n      {\n        \"text\": \"\"\n      }\n    ]\n  }\n]"
              }
            })
          }
          position = {
            x = 2767
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
        "hbs3eh5iqo" = {
          data = {
            id        = "hbs3eh5iqo"
            node_type = "EVAL"
          }
          position = {
            x = 427
            y = 296
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
        "hhj5mpkk0u" = {
          data = {
            id              = "hhj5mpkk0u"
            node_type       = "CONNECTION"
            connection_id   = pingone_davinci_connector_instance.error_message.id
            connector_id    = "errorConnector"
            name            = "Error Message"
            label           = "Error Message"
            capability_name = "customErrorMessage"
            type            = "action"
            status          = "configured"
            properties = jsonencode({
              "errorMessage" : {
                "value" : "[\n  {\n    \"children\": [\n      {\n        \"text\": \"\"\n      },\n      {\n        \"text\": \"\"\n      },\n      {\n        \"type\": \"link\",\n        \"src\": \"pingIdentity.svg\",\n        \"url\": \"message\",\n        \"data\": \"{{local.6i7lwwrw94.payload.error.message}}\",\n        \"tooltip\": \"{{local.6i7lwwrw94.payload.error.message}}\",\n        \"children\": [\n          {\n            \"text\": \"message\"\n          }\n        ]\n      },\n      {\n        \"text\": \"\"\n      }\n    ]\n  }\n]"
              }
            })
          }
          position = {
            x = 1477
            y = 626
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
        "ij45fm4h76" = {
          data = {
            id              = "ij45fm4h76"
            node_type       = "CONNECTION"
            connection_id   = pingone_davinci_connector_instance.error_message.id
            connector_id    = "errorConnector"
            name            = "Error Message"
            label           = "Error Message"
            capability_name = "customErrorMessage"
            type            = "action"
            status          = "configured"
            properties = jsonencode({
              "errorMessage" : {
                "value" : "[\n  {\n    \"children\": [\n      {\n        \"text\": \"\"\n      },\n      {\n        \"text\": \"\"\n      },\n      {\n        \"type\": \"link\",\n        \"src\": \"pingIdentity.svg\",\n        \"url\": \"message\",\n        \"data\": \"{{local.l9q5mxjjtm.payload.error.message}}\",\n        \"tooltip\": \"{{local.l9q5mxjjtm.payload.error.message}}\",\n        \"children\": [\n          {\n            \"text\": \"message\"\n          }\n        ]\n      },\n      {\n        \"text\": \"\"\n      }\n    ]\n  }\n]"
              }
            })
          }
          position = {
            x = 2377
            y = 446
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
                "value" : "[\n  {\n    \"children\": [\n      {\n        \"text\": \"\"\n      },\n      {\n        \"text\": \"\"\n      },\n      {\n        \"type\": \"link\",\n        \"src\": \"http.svg\",\n        \"url\": \"password\",\n        \"data\": \"{{local.zgqu7wj7mb.payload.output.password}}\",\n        \"tooltip\": \"{{local.zgqu7wj7mb.payload.output.password}}\",\n        \"children\": [\n          {\n            \"text\": \"password\"\n          }\n        ]\n      },\n      {\n        \"text\": \"\"\n      }\n    ]\n  }\n]"
              },
              "skRiskFP" : {
                "value" : "[\n  {\n    \"children\": [\n      {\n        \"text\": \"\"\n      },\n      {\n        \"text\": \"\"\n      },\n      {\n        \"type\": \"link\",\n        \"src\": \"variable.svg\",\n        \"url\": \"riskSDKOutput\",\n        \"data\": \"{{global.variables.riskSDKOutput}}\",\n        \"tooltip\": \"{{global.variables.riskSDKOutput}}\",\n        \"children\": [\n          {\n            \"text\": \"riskSDKOutput\"\n          }\n        ]\n      },\n      {\n        \"text\": \"\"\n      }\n    ]\n  }\n]"
              },
              "targetResourceName" : {
                "value" : "[\n  {\n    \"children\": [\n      {\n        \"text\": \"DaVinci SSO Protect Sample App\"\n      }\n    ]\n  }\n]"
              },
              "userAgent" : {
                "value" : "[\n  {\n    \"children\": [\n      {\n        \"text\": \"\"\n      },\n      {\n        \"text\": \"\"\n      },\n      {\n        \"type\": \"link\",\n        \"src\": \"auth.svg\",\n        \"url\": \"userAgent\",\n        \"data\": \"{{global.userAgent}}\",\n        \"tooltip\": \"{{global.userAgent}}\",\n        \"children\": [\n          {\n            \"text\": \"userAgent\"\n          }\n        ]\n      },\n      {\n        \"text\": \"\"\n      }\n    ]\n  }\n]"
              },
              "userId" : {
                "value" : "[\n  {\n    \"children\": [\n      {\n        \"text\": \"\"\n      },\n      {\n        \"text\": \"\"\n      },\n      {\n        \"type\": \"link\",\n        \"src\": \"variable.svg\",\n        \"url\": \"userId\",\n        \"data\": \"{{global.variables.userId}}\",\n        \"tooltip\": \"{{global.variables.userId}}\",\n        \"children\": [\n          {\n            \"text\": \"userId\"\n          }\n        ]\n      },\n      {\n        \"text\": \"\"\n      }\n    ]\n  }\n]"
              },
              "userName" : {
                "value" : "[\n  {\n    \"children\": [\n      {\n        \"text\": \"\"\n      },\n      {\n        \"text\": \"\"\n      },\n      {\n        \"type\": \"link\",\n        \"src\": \"http.svg\",\n        \"url\": \"username\",\n        \"data\": \"{{local.d9583hqcp9.payload.output.username}}\",\n        \"tooltip\": \"{{local.d9583hqcp9.payload.output.username}}\",\n        \"children\": [\n          {\n            \"text\": \"username\"\n          }\n        ]\n      },\n      {\n        \"text\": \"\"\n      }\n    ]\n  }\n]"
              },
              "userType" : {
                "value" : "PING_ONE"
              }
            })
          }
          position = {
            x = 2040
            y = 360
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
            connection_id   = pingone_davinci_connector_instance.pingone.id
            connector_id    = "pingOneSSOConnector"
            name            = "PingOne"
            label           = "PingOne"
            capability_name = "userLookup"
            type            = "action"
            status          = "configured"
            properties = jsonencode({
              "matchAttributes" : {
                "value" : [
                  "username"
                ]
              },
              "userIdentifierForFindUser" : {
                "value" : "[\n  {\n    \"children\": [\n      {\n        \"text\": \"\"\n      },\n      {\n        \"text\": \"\"\n      },\n      {\n        \"type\": \"link\",\n        \"src\": \"http.svg\",\n        \"url\": \"username\",\n        \"data\": \"{{local.d9583hqcp9.payload.output.username}}\",\n        \"tooltip\": \"{{local.d9583hqcp9.payload.output.username}}\",\n        \"children\": [\n          {\n            \"text\": \"username\"\n          }\n        ]\n      },\n      {\n        \"text\": \"\"\n      }\n    ]\n  }\n]"
              }
            })
          }
          position = {
            x = 577
            y = 296
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
              },
              "z7jrglflfx" : {
                "value" : "allTriggersFalse"
              }
            })
          }
          position = {
            x = 2527
            y = 296
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
        "n9qaul10jk" = {
          data = {
            id              = "n9qaul10jk"
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
                "value" : "[[[skcomponent###c2tjb21wb25lbnQgInNrcmlzayIgIGVudmlyb25tZW50SWQ9IiIgY29sbGVjdEJlaGF2aW9yYWxEYXRhPSJ0cnVlIiBwcm9wZXJ0eW5hbWU9InJpc2tmcCI=###eyJuYW1lIjoic2tyaXNrIiwib3B0aW9ucyI6eyJlbnZpcm9ubWVudElkIjoiIiwiY29sbGVjdEJlaGF2aW9yYWxEYXRhIjoidHJ1ZSIsInByb3BlcnR5bmFtZSI6InJpc2tmcCJ9LCJjb21wb25lbnRQcm9wcyI6eyJlbnZpcm9ubWVudElkIjp7Im5hbWUiOiJlbnZpcm9ubWVudElkIiwiZGlzcGxheU5hbWUiOiJFbnZpcm9ubWVudCBJRCJ9LCJjb2xsZWN0QmVoYXZpb3JhbERhdGEiOnsibmFtZSI6ImNvbGxlY3RCZWhhdmlvcmFsRGF0YSIsImRpc3BsYXlOYW1lIjoiQ29sbGVjdCBiZWhhdmlvcmFsIGRhdGEiLCJ0eXBlIjoic2VsZWN0IiwidmFsdWUiOiJ0cnVlIiwiaW5mbyI6IkJlaGF2aW9yYWwgZGF0YSBpcyB1c2VkIHRvIGRldGVjdCBIdW1hbi9Ob24gSHVtYW4gdXNlcnMuIEl0IGlzIHJlY29tbWVuZGVkIHRvIHNldCB0aGUgc2FtZSB2YWx1ZSB0aHJvdWdob3V0IHRoZSBmbG93LiIsIm9wdGlvbnMiOlt7Im5hbWUiOiJUcnVlIiwidmFsdWUiOiJ0cnVlIn0seyJuYW1lIjoiRmFsc2UiLCJ2YWx1ZSI6ImZhbHNlIn1dfSwicHJvcGVydHluYW1lIjp7Im5hbWUiOiJwcm9wZXJ0eW5hbWUiLCJkaXNwbGF5TmFtZSI6IlJpc2sgUHJvcGVydHkgTmFtZSIsInZhbHVlIjoicmlza2ZwIiwiaW5mbyI6Ik5hbWUgZm9yIHJlZmVyZW5jaW5nIHRoaXMgcmlzayBjb21wb25lbnQifX19]]]\n\u003cdiv\n  class=\"bg-light d-flex flex-column justify-content-center align-items-center position-absolute top-0 start-0 bottom-0 end-0 overflow-auto\"\u003e\n  \u003cdiv style=\"max-width: 400px; min-width: 400px; width: 100%\"\u003e\n    \u003cdiv class=\"card shadow mb-5\"\u003e\n      \u003cdiv class=\"card-body p-5 d-flex flex-column\"\u003e\n        \u003cimg class=\"companyLogo align-self-center mb-5\" alt=\"{{global.variables.companyName}}\" /\u003e\n        \u003ch1 class=\"text-center mb-4\"\u003eSign On\u003c/h1\u003e\n        \u003cp class=\"text-muted text-center\"\u003eWelcome to Ping Identity\u003c/p\u003e\n        \u003cp class=\"text-danger mdi mdi-alert-circle\" data-id=\"feedback\" data-skcomponent=\"skerror\"\u003e\u003c/p\u003e\n        \u003cform id=\"passwordForm\" data-id=\"passwordForm\"\u003e\n          \u003cdiv id=\"passwordDiv\" class=\"mb-4 form-floating\"\u003e\n            \u003cinput class=\"form-control\" type=\"password\" id=\"password\" name=\"password\" placeholder=\"Password\"\n              autocomplete=\"off\" value=\"\" data-id=\"password-input\" /\u003e\n            \u003clabel class=\"form-label\" for=\"password\"\u003ePassword\u003c/label\u003e\n            \u003cdiv data-skcomponent=\"skerrormessage\" class=\"text-danger validation-message\" data-skerrorid=\"password\"\u003e\u003c/div\u003e\n          \u003c/div\u003e\n          \u003cdiv class=\"d-flex flex-column\"\u003e\n            \u003cbutton data-id=\"button\" type=\"submit\" class=\"btn btn-primary mb-3\" data-skcomponent=\"skbutton\"\n              data-skbuttontype=\"form-submit\" data-skform=\"passwordForm\" id=\"btnSignIn\"\n              data-skbuttonvalue=\"SIGNON\"\u003e\n              Sign On\n            \u003c/button\u003e\n          \u003c/div\u003e\n        \u003c/form\u003e\n      \u003c/div\u003e\n    \u003c/div\u003e\n  \u003c/div\u003e\n\u003c/div\u003e"
              },
              "customScript" : {
                "value" : "// Focus on the first input element on the page\nconst focusOnFirstInputElement = () =\u003e {\n    const element = document.querySelector(\"input\");\n\n    // Set focus on the first input element, if it exists\n    if (element) {\n        element.focus();\n    }\n};\n\nfunction makePasswordToggle(id) {\n    var container = document.getElementById(id);\n    var password = container.getElementsByTagName(\"input\")[0];\n    var toggler = document.createElement(\"button\");\n    toggler.setAttribute(\"tabindex\", \"-1\");\n    toggler.setAttribute(\"type\", \"button\");\n    toggler.setAttribute(\"aria-label\", \"Show/Hide Password\");\n    toggler.className = \"btn mdi mdi-eye-off-outline position-absolute end-0 top-50 translate-middle-y\";\n    container.appendChild(toggler);\n     \n    function showHidePassword() {\n        if (password.type == \"password\") {\n            password.setAttribute(\"type\", \"text\");\n            toggler.classList.add(\"mdi-eye-outline\");\n            toggler.classList.remove(\"mdi-eye-off-outline\");\n        } else {\n            toggler.classList.add(\"mdi-eye-off-outline\");\n            toggler.classList.remove(\"mdi-eye-outline\");\n            password.setAttribute(\"type\", \"password\");\n        }\n        password.focus();\n    };\n \n    toggler.addEventListener(\"click\", showHidePassword);\n}\n \nfunction start() {\n    makePasswordToggle(\"passwordDiv\");\n    focusOnFirstInputElement();\n}\n \nif (document.readyState === \"loading\") {\n    // Loading hasn't finished yet\n    document.addEventListener(\"DOMContentLoaded\", start);\n} else {\n    // `DOMContentLoaded` has already fired\n    start();\n}"
              },
              "formFieldsList" : {
                "value" : [
                  {
                    "preferredControlType" : "textField",
                    "preferredDataType" : "string",
                    "propertyName" : "buttonValue"
                  },
                  {
                    "displayName" : "Risk Output",
                    "hashedVisibility" : false,
                    "preferredControlType" : "textField",
                    "preferredDataType" : "string",
                    "propertyName" : "riskSDKOutput",
                    "value" : "[\n  {\n    \"children\": [\n      {\n        \"text\": \"\"\n      }\n    ]\n  }\n]"
                  },
                  {
                    "displayName" : "Password",
                    "hashedVisibility" : true,
                    "preferredControlType" : "textField",
                    "preferredDataType" : "string",
                    "propertyName" : "password",
                    "value" : ""
                  }
                ]
              },
              "nodeTitle" : {
                "value" : "Password Form"
              },
              "validationRules" : {
                "value" : [
                  {
                    "propertyName" : "password",
                    "rules" : [
                      {
                        "message" : "Password is required",
                        "ruleName" : "presence"
                      }
                    ]
                  }
                ]
              }
            })
          }
          position = {
            x = 877
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
        "p53gq7n410" = {
          data = {
            id              = "p53gq7n410"
            node_type       = "CONNECTION"
            connection_id   = pingone_davinci_connector_instance.pingone.id
            connector_id    = "pingOneSSOConnector"
            name            = "PingOne"
            label           = "PingOne"
            capability_name = "checkPassword"
            type            = "action"
            status          = "configured"
            properties = jsonencode({
              "identifier" : {
                "value" : "[\n  {\n    \"children\": [\n      {\n        \"text\": \"\"\n      },\n      {\n        \"text\": \"\"\n      },\n      {\n        \"type\": \"link\",\n        \"src\": \"http.svg\",\n        \"url\": \"username\",\n        \"data\": \"{{local.d9583hqcp9.payload.output.username}}\",\n        \"tooltip\": \"{{local.d9583hqcp9.payload.output.username}}\",\n        \"children\": [\n          {\n            \"text\": \"username\"\n          }\n        ]\n      },\n      {\n        \"text\": \"\"\n      }\n    ]\n  }\n]"
              },
              "matchAttribute" : {
                "value" : "username"
              },
              "password" : {
                "value" : "[\n  {\n    \"children\": [\n      {\n        \"text\": \"\"\n      },\n      {\n        \"text\": \"\"\n      },\n      {\n        \"type\": \"link\",\n        \"src\": \"http.svg\",\n        \"url\": \"password\",\n        \"data\": \"{{local.n9qaul10jk.payload.output.password}}\",\n        \"tooltip\": \"{{local.n9qaul10jk.payload.output.password}}\",\n        \"children\": [\n          {\n            \"text\": \"password\"\n          }\n        ]\n      },\n      {\n        \"text\": \"\"\n      }\n    ]\n  }\n]"
              }
            })
          }
          position = {
            x = 1147
            y = 296
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
        "pausjqv615" = {
          data = {
            id              = "pausjqv615"
            node_type       = "CONNECTION"
            connection_id   = pingone_davinci_connector_instance.error_message.id
            connector_id    = "errorConnector"
            name            = "Error Message"
            label           = "Error Message"
            capability_name = "customErrorMessage"
            type            = "action"
            status          = "configured"
            properties = jsonencode({
              "errorMessage" : {
                "value" : "[\n  {\n    \"children\": [\n      {\n        \"text\": \"\"\n      },\n      {\n        \"text\": \"\"\n      },\n      {\n        \"type\": \"link\",\n        \"src\": \"pingIdentity.svg\",\n        \"url\": \"message\",\n        \"data\": \"{{local.m4sfmek769.payload.error.message}}\",\n        \"tooltip\": \"{{local.m4sfmek769.payload.error.message}}\",\n        \"children\": [\n          {\n            \"text\": \"message\"\n          }\n        ]\n      },\n      {\n        \"text\": \"\"\n      }\n    ]\n  }\n]"
              }
            })
          }
          position = {
            x = 1470
            y = 390
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
        "qslvlfzdu8" = {
          data = {
            id        = "qslvlfzdu8"
            node_type = "EVAL"
          }
          position = {
            x = 1012
            y = 491
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
                "value" : "[\n  {\n    \"children\": [\n      {\n        \"text\": \"\"\n      },\n      {\n        \"text\": \"\"\n      },\n      {\n        \"type\": \"link\",\n        \"src\": \"pingIdentity.svg\",\n        \"url\": \"id\",\n        \"data\": \"{{local.l9q5mxjjtm.payload.output.rawResponse.id}}\",\n        \"tooltip\": \"{{local.l9q5mxjjtm.payload.output.rawResponse.id}}\",\n        \"children\": [\n          {\n            \"text\": \"id\"\n          }\n        ]\n      },\n      {\n        \"text\": \"\"\n      },\n      {\n        \"text\": \"\"\n      }\n    ]\n  }\n]"
              }
            })
          }
          position = {
            x = 2377
            y = 296
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
        "viu1zp2fns" = {
          data = {
            id        = "viu1zp2fns"
            node_type = "EVAL"
          }
          position = {
            x = 1620
            y = 435
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
              "3a7vnut1c8" : {
                "value" : "allTriggersFalse"
              },
              "6i7lwwrw94" : {
                "value" : "allTriggersFalse"
              }
            })
          }
          position = {
            x = 727
            y = 296
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
        "z7jrglflfx" = {
          data = {
            id              = "z7jrglflfx"
            node_type       = "CONNECTION"
            connection_id   = pingone_davinci_connector_instance.error_message.id
            connector_id    = "errorConnector"
            name            = "Error Message"
            label           = "Error Message"
            capability_name = "customErrorMessage"
            type            = "action"
            status          = "configured"
            properties = jsonencode({
              "errorMessage" : {
                "value" : "[\n  {\n    \"children\": [\n      {\n        \"text\": \"\"\n      },\n      {\n        \"text\": \"\"\n      },\n      {\n        \"type\": \"link\",\n        \"src\": \"pingIdentity.svg\",\n        \"url\": \"message\",\n        \"data\": \"{{local.sxdpclcyko.payload.error.message}}\",\n        \"tooltip\": \"{{local.sxdpclcyko.payload.error.message}}\",\n        \"children\": [\n          {\n            \"text\": \"message\"\n          }\n        ]\n      },\n      {\n        \"text\": \"\"\n      }\n    ]\n  }\n]"
              }
            })
          }
          position = {
            x = 2767
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
        "0ik0wpytg2" = {
          data = {
            id     = "0ik0wpytg2"
            source = "75k6wc3j9i"
            target = "pausjqv615"
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
        "13v2fa2yqm" = {
          data = {
            id     = "13v2fa2yqm"
            source = "yqi3iaujxx"
            target = "n9qaul10jk"
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
        "1jrmekr9ps" = {
          data = {
            id     = "1jrmekr9ps"
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
        "1rxfrliq41" = {
          data = {
            id     = "1rxfrliq41"
            source = "1jf93tyrvi"
            target = "3m229em5w4"
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
        "6aerj84jbc" = {
          data = {
            id     = "6aerj84jbc"
            source = "yqi3iaujxx"
            target = "3a7vnut1c8"
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
        "6dn6y8sbmz" = {
          data = {
            id     = "6dn6y8sbmz"
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
        "6v6muvdyg5" = {
          data = {
            id     = "6v6muvdyg5"
            source = "3a7vnut1c8"
            target = "qslvlfzdu8"
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
        "87borumlys" = {
          data = {
            id     = "87borumlys"
            source = "87jn430mui"
            target = "hhj5mpkk0u"
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
        "9g8fums6ac" = {
          data = {
            id     = "9g8fums6ac"
            source = "09anefv002"
            target = "ij45fm4h76"
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
        "a9l6xkkwym" = {
          data = {
            id     = "a9l6xkkwym"
            source = "n6js2rcdqf"
            target = "z7jrglflfx"
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
        "ayri6v2nw9" = {
          data = {
            id     = "ayri6v2nw9"
            source = "qslvlfzdu8"
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
        "bx3fvewvcx" = {
          data = {
            id     = "bx3fvewvcx"
            source = "3m229em5w4"
            target = "5fy38889km"
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
        "dltb7qbive" = {
          data = {
            id     = "dltb7qbive"
            source = "viu1zp2fns"
            target = "5fy38889km"
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
        "fje1gztatq" = {
          data = {
            id     = "fje1gztatq"
            source = "n6js2rcdqf"
            target = "g6narytx9z"
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
        "iu9p9b3778" = {
          data = {
            id     = "iu9p9b3778"
            source = "9g690zq061"
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
        "p45lvaw565" = {
          data = {
            id     = "p45lvaw565"
            source = "0mqv2pv49t"
            target = "viu1zp2fns"
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
        "qtgsr59csk" = {
          data = {
            id     = "qtgsr59csk"
            source = "d9583hqcp9"
            target = "hbs3eh5iqo"
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
        "sl5km0w1by" = {
          data = {
            id     = "sl5km0w1by"
            source = "hbs3eh5iqo"
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
        "svn5c5hcf9" = {
          data = {
            id     = "svn5c5hcf9"
            source = "dwmluz6lew"
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
        "u6djy95ol3" = {
          data = {
            id     = "u6djy95ol3"
            source = "5fy38889km"
            target = "9g690zq061"
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
        "vkwfb1gipt" = {
          data = {
            id     = "vkwfb1gipt"
            source = "n9qaul10jk"
            target = "dwmluz6lew"
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

  trigger = {
    type = "AUTHENTICATION"
  }
}