# Ping Integration Example Packages

As the start of a new initiative called "The Developers' Experience", we are creating case-specific integration example packages. They are focused on integration and best practices, and are deployed and integrated with your PingOne tenant using Terraform from Hashicorp. This additionally demonstrates how you can manage your PingOne tenant following IaC best practices.

We are not a custom app vendor for your line of business. That is your expertise. So the example app UI, and our demo use cases are 2nd class citizens to the purpose of this project. They are merely a conduit to the goal; Ping integration examples.

The example application source code is the most basic HTML and Javascript implementation to not muddy the source with artifacts irrelevant to the package.

## What's Inside

**Table of content:**

*Naming convention:*
`product_[service_]implementation-useCase-pkg`
*Each group can have multiple items.*
`product_[service_]implementation-product_[service_]implementation-useCase-[useCase-]pkg`
*Implementation type refers to API vs. widget vs. other.*
*Use cases may be abbreviated:*
> registration --> reg
> authentication --> authn
> authorization --> authz

<!-- TOC headings -->
#### davinci-oidc_sdk-ciam_passwordless_solution-pkg
This integration package combines Terraform, DaVinci, PingOne SSO, PingOne MFA, the OIDC SDK, and the CIAM Passwordless Solution to demonstrate passwordless registration and authentication.

#### davinci-oidc_sdk-pingone_protect-reg-authn-pkg
This integration package combines Terraform, DaVinci, PingOne SSO, PingOne Protect, the Signals SDK, and the OIDC SDK to demonstrate user registration and authentication, as well as threat protection.

#### davinci_api-pingone_protect-reg-authn-pkg
This integration package combines Terraform, DaVinci, PingOne Protect, and the Signals SDK to demonstrate user registration and authentication, as well as threat protection.

#### davinci_api-reg-authn-pkg
This integration package combines Terraform, DaVinci, and PingOne Directory to demonstrate user registration and authentication.

#### davinci_widget-reg-authn-pkg
This integration package combines Terraform, DaVinci, and PingOne Directory to demonstrate user registration and authentication.

#### oidc_sdk-reg-authn-pkg
This integration package combines Terraform, PingOne, and the OIDC SDK to demonstrate user registration and authentication.

#### pingone_protect_api-pkg
This integration package combines Terraform, PingOne Protect, and the Signals SDK to demonstrate threat detection capabilities.


Disclaimer
THIS DEMO AND SAMPLE CODE IS PROVIDED "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL PING IDENTITY OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) SUSTAINED BY YOU OR A THIRD PARTY, HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT ARISING IN ANY WAY OUT OF THE USE OF THIS DEMO AND SAMPLE CODE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.