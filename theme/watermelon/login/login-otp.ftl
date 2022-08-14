<#import "template.ftl" as layout>
<#import "components/button/primary.ftl" as buttonPrimary>
<#import "components/input/primary.ftl" as inputPrimary>
<#import "components/link/buttonSecondary.ftl" as buttonLinkSecondary>
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
        <div class="flex items-center justify-around space-x-4 pb-2">
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
        <span>${msg("authenticatorCode")}</span>
        <@inputPrimary.kw
          autocomplete="off"
          autofocus=true
          invalid=["totp"]
          monospace=true
          minlength="6"
          maxlength="6"
          name="otp"
          type="text">
          ${msg("placeholderOTP")}
        </@inputPrimary.kw>
      </div>
      <div class="pt-4 space-y-4">
        <div>
          <@buttonPrimary.kw
            name="submitAction"
            type="submit">
            ${msg("doLogIn")}
          </@buttonPrimary.kw>
        </div>
        <div>
          <@buttonLinkSecondary.kw
            href="${url.loginRestartFlowUrl}"
            title="${msg('restartLoginTooltip')}">
            ${msg("restartLoginTooltip")}
          </@buttonLinkSecondary.kw>
        </div>
      </div>
    </form>
  </#if>
</@layout.registrationLayout>
