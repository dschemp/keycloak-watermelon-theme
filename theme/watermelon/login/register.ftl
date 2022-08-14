<#import "template.ftl" as layout>
<#import "components/button/primary.ftl" as buttonPrimary>
<#import "components/input/primary.ftl" as inputPrimary>
<#import "components/link/secondary.ftl" as linkSecondary>

<@layout.registrationLayout
  displayMessage=!messagesPerField.existsError("firstName", "lastName", "email", "username", "password", "password-confirm")
  ;
  section
>
  <#if section="header">
    ${msg("registerTitle")}
  <#elseif section="form">
    <form action="${url.registrationAction}" class="m-0 space-y-4" method="post">
      <div>
      <span>${msg("firstName")}</span>
        <@inputPrimary.kw
          autocomplete="given-name"
          autofocus=true
          invalid=["firstName"]
          name="firstName"
          type="text"
          value=(register.formData.firstName)!''>
          ${msg("placeholderFirstname")}
        </@inputPrimary.kw>
      </div>
      <div>
        <span>${msg("lastName")}</span>
        <@inputPrimary.kw
          autocomplete="family-name"
          invalid=["lastName"]
          name="lastName"
          type="text"
          value=(register.formData.lastName)!''>
          ${msg("placeholderLastname")}
        </@inputPrimary.kw>
      </div>
      <div>
        <span>${msg("email")}</span>
        <@inputPrimary.kw
          autocomplete="email"
          invalid=["email"]
          name="email"
          type="email"
          value=(register.formData.email)!''>
          ${msg("placeholderEmail")}
        </@inputPrimary.kw>
      </div>
      <#if !realm.registrationEmailAsUsername>
        <div>
          <span>${msg("username")}</span>
          <@inputPrimary.kw
            autocomplete="username"
            invalid=["username"]
            name="username"
            type="text"
            value=(register.formData.username)!''>
            ${msg("placeholderUsername")}
          </@inputPrimary.kw>
        </div>
      </#if>
      <#if passwordRequired??>
        <div>
          <span>${msg("password")}</span>
          <@inputPrimary.kw
            autocomplete="new-password"
            invalid=["password", "password-confirm"]
            message=false
            name="password"
            type="password" />
        </div>
        <div>
          <span>${msg("passwordConfirm")}</span>
          <@inputPrimary.kw
            autocomplete="new-password"
            invalid=["password-confirm"]
            name="password-confirm"
            type="password" />
        </div>
      </#if>
      <#if recaptchaRequired??>
        <div>
          <div class="g-recaptcha" data-sitekey="${recaptchaSiteKey}" data-size="compact"></div>
        </div>
      </#if>
      <div class="pt-4">
        <@buttonPrimary.kw type="submit">
          ${msg("doRegister")}
        </@buttonPrimary.kw>
      </div>
    </form>
  <#elseif section="nav">
    <@linkSecondary.kw href=url.loginUrl>
      <span>${kcSanitize(msg("backToLogin"))?no_esc}</span>
    </@linkSecondary.kw>
  </#if>
</@layout.registrationLayout>
