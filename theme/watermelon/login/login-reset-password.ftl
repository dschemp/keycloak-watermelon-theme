<#import "template.ftl" as layout>
<#import "components/button/primary.ftl" as buttonPrimary>
<#import "components/input/primary.ftl" as inputPrimary>
<#import "components/label/username.ftl" as labelUsername>
<#import "components/link/secondary.ftl" as linkSecondary>

<@layout.registrationLayout
  displayInfo=true
  displayMessage=!messagesPerField.existsError("username")
  ;
  section
>
  <#if section="header">
    ${msg("emailForgotTitle")}
  <#elseif section="form">
    <form action="${url.loginAction}" class="m-0 space-y-4" method="post">
      <div>
        <span><@labelUsername.kw /></span>
        <@inputPrimary.kw
          autocomplete=realm.loginWithEmailAllowed?string("email", "username")
          autofocus=true
          invalid=["username"]
          name="username"
          type="text"
          value=(auth?has_content && auth.showUsername())?then(auth.attemptedUsername, '')>
          <#if !realm.loginWithEmailAllowed>
            ${msg("placeholderUsername")}
          <#elseif !realm.registrationEmailAsUsername>
            ${msg("placeholderEmailOrUsername")}
          <#else>
            ${msg("placeholderEmail")}
          </#if>
        </@inputPrimary.kw>
      </div>
      <div class="pt-4">
        <@buttonPrimary.kw type="submit">
          ${msg("doSubmit")}
        </@buttonPrimary.kw>
      </div>
    </form>
  <#elseif section="info">
    <span class="text-sm">${msg("emailInstruction")}</span>
  <#elseif section="nav">
    <@linkSecondary.kw href=url.loginUrl>
      <span>${kcSanitize(msg("backToLogin"))?no_esc}</span>
    </@linkSecondary.kw>
  </#if>
</@layout.registrationLayout>
