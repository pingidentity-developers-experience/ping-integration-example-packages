# Ping Integration Example Packages

As the start of a new initiative called "The Developers' Experience", we are creating case-specific integration example packages. They are focused on integration and best practices, and are deployed and integrated with your PingOne tenant using Terraform from Hashicorp. This additionally demonstrates how you can manage your PingOne tenant following IaC best practices.

We are not a custom app vendor for your line of business. That is your expertise. So the example app UI, and our demo use cases are 2nd class citizens to the purpose of this project. They are merely a conduit to the goal; Ping integration examples.

The example application source code is the most basic HTML and Javascript implementation to not muddy the source with artifacts irrelevant to the package.

## What's Inside

**Table of content:**
1. [davinci_api-oidc_sdk-ciam_passwordless_solution-pkg](#item-three)
1. [davinci_api-oidc_sdk-pingone_protect-sso-pkg](#item-five)
1. [davinci_api-pingone_protect-registration-pkg](#item-two)
1. [davinci_api-registration-pkg](#item-one)
1. [davinci_widget-registration-pkg](#item-four)
1. [oidc_sdk-registration-pkg](#item-six)
1. [pingone_protect_api-pkg](#item-seven)

<!-- TOC headings -->
<a id="item-three"></a>
#### davinci_api-oidc_sdk-ciam_passwordless_solution-pkg
This integration package combines Terraform, DaVinci, PingOne SSO, PingOne MFA, the OIDC SDK, and the CIAM Passwordless Solution to demonstrate passwordless registration and authentication.

<a id="item-five"></a>
#### davinci_api-oidc_sdk-pingone_protect-sso-pkg
This integration package combines Terraform, DaVinci, PingOne SSO, PingOne Protect, the Signals SDK, and the OIDC SDK to demonstrate user registration and authentication, as well as threat protection.

<a id="item-two"></a>
#### davinci_api-pingone_protect-registration-pkg
This integration package combines Terraform, DaVinci, PingOne Protect, and the Signals SDK to demonstrate user registration and authentication, as well as threat protection.

<a id="item-one"></a>
#### davinci_api-registration-pkg
This integration package combines Terraform, DaVinci, and PingOne Directory to demonstrate user registration and authentication.

<a id="item-four"></a>
#### davinci_widget-registration-pkg
This integration package combines Terraform, DaVinci, and PingOne Directory to demonstrate user registration and authentication.

<a id="item-six"></a>
#### oidc_sdk-registration-pkg
This integration package combines Terraform, PingOne, and the OIDC SDK to demonstrate user registration and authentication.

<a id="item-seven"></a>
#### pingone_protect_api-pkg
This integration package combines Terraform, PingOne Protect, and the Signals SDK to demonstrate threat detection capabilities.


Disclaimer
THIS DEMO AND SAMPLE CODE IS PROVIDED "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL PING IDENTITY OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) SUSTAINED BY YOU OR A THIRD PARTY, HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT ARISING IN ANY WAY OUT OF THE USE OF THIS DEMO AND SAMPLE CODE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.