<#import "template.ftl" as layout>
<#import "components/provider.ftl" as provider>
<#import "components/button/primary.ftl" as buttonPrimary>
<#import "components/checkbox/accent.ftl" as checkboxAccent>
<#import "components/input/primary.ftl" as inputPrimary>
<#import "components/label/username.ftl" as labelUsername>
<#import "components/link/accent.ftl" as linkAccent>
<#import "components/link/buttonSecondary.ftl" as buttonLinkSecondary>

<@layout.registrationLayout
  displayInfo=realm.password && realm.registrationAllowed && !registrationDisabled??
  displayMessage=!messagesPerField.existsError("username", "password")
  ;
  section
>
  <#if section="header">
    ${msg("loginAccountTitle")}
  <#elseif section="form">
    <#if realm.password>
      <form action="${url.loginAction}"
        class="m-0 space-y-4"
        method="post"
        onsubmit="login.disabled = true; return true;">
        <input name="credentialId"
          type="hidden"
          value="<#if auth.selectedCredential?has_content>${auth.selectedCredential}</#if>">
        <div>
          <span><@labelUsername.kw /></span>
          <@inputPrimary.kw
            autocomplete=realm.loginWithEmailAllowed?string("email", "username")
            autofocus=true
            disabled=usernameEditDisabled??
            invalid=["username", "password"]
            name="username"
            type="text"
            value=(login.username)!''>
            <#if !realm.loginWithEmailAllowed>
              ${msg("placeholderUsername")}
            <#elseif !realm.registrationEmailAsUsername>
              ${msg("placeholderEmailOrUsername")}
            <#else>
              ${msg("placeholderEmail")}
            </#if>
          </@inputPrimary.kw>
        </div>
        <div>
        <span>${msg("password")}</span>
          <@inputPrimary.kw
            invalid=["username", "password"]
            message=false
            name="password"
            type="password">
          </@inputPrimary.kw>
        </div>
        <div class="flex items-center justify-between">
          <#if realm.rememberMe && !usernameEditDisabled??>
            <@checkboxAccent.kw checked=login.rememberMe?? name="rememberMe">
              ${msg("rememberMe")}
            </@checkboxAccent.kw>
          </#if>
          <#if realm.resetPasswordAllowed>
            <@linkAccent.kw href=url.loginResetCredentialsUrl>
              <span class="text-sm">${msg("doForgotPassword")}</span>
            </@linkAccent.kw>
          </#if>
        </div>
        <div class="pt-4">
          <@buttonPrimary.kw name="login" type="submit">
            ${msg("doLogIn")}
          </@buttonPrimary.kw>
        </div>
      </form>
    </#if>
    <#if realm.password && social.providers??>
      <@provider.kw />
    </#if>
  <#elseif section="info">
    <#if realm.password && realm.registrationAllowed && !registrationDisabled??>
      <div class="text-center">
        <div class="separate">${msg("noAccount")}</div>
        <div class="pt-2">
          <@buttonLinkSecondary.kw href=url.registrationUrl>
            <span>${msg("doRegister")}</span>
          </@buttonLinkSecondary.kw>
        </div>
      </div>
    </#if>
  </#if>
</@layout.registrationLayout>
