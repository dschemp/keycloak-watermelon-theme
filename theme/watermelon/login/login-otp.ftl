<#import "template.ftl" as layout>
<#import "components/button/primary.ftl" as buttonPrimary>
<#import "components/input/primary.ftl" as inputPrimary>
<#import "components/label/totp.ftl" as labelTotp>
<#import "components/link/secondary.ftl" as linkSecondary>
<#import "components/radio/accent.ftl" as radioAccent>

<@layout.registrationLayout
  displayMessage=!messagesPerField.existsError("totp")
  ;
  section
>
  <#if section="header">
    ${msg("doLogIn")}
  <#elseif section="form">
    <form
      action="${url.loginAction}"
      class="m-0 space-y-4"
      method="post">
      <#if otpLogin.userOtpCredentials?size gt 1>
        <div class="flex items-center space-x-4">
          <#list otpLogin.userOtpCredentials as otpCredential>
            <@radioAccent.kw
              checked=(otpCredential.id == otpLogin.selectedCredentialId)
              id="kw-otp-credential-${otpCredential?index}"
              name="selectedCredentialId"
              tabIndex="${otpCredential?index}"
              value="${otpCredential.id}">
              ${otpCredential.userLabel}
            </@radioAccent.kw>
          </#list>
        </div>
      </#if>
      <div>
        <span><@labelTotp.kw /></span>
        <@inputPrimary.kw
          autocomplete="off"
          autofocus=true
          invalid=["totp"]
          monospace=true
          name="otp"
          type="text">
          ${msg("placeholderOTP")}
        </@inputPrimary.kw>
      </div>
      <div class="pt-4">
        <@buttonPrimary.kw
          name="submitAction"
          type="submit">
          ${msg("doLogIn")}
        </@buttonPrimary.kw>
      </div>
    </form>
  </#if>
</@layout.registrationLayout>
