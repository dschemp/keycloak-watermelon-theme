<#import "template.ftl" as layout>
<#import "components/button/primary.ftl" as buttonPrimary>
<#import "components/input/primary.ftl" as inputPrimary>

<@layout.registrationLayout
  displayMessage=!messagesPerField.existsError("email", "firstName", "lastName", "username")
  ;
  section
>
  <#if section="header">
    ${msg("loginProfileTitle")}
  <#elseif section="form">
    <form action="${url.loginAction}" class="m-0 space-y-4" method="post">
      <#if user.editUsernameAllowed>
        <div>
          <span>${msg("username")}</span>
          <@inputPrimary.kw
            autocomplete="username"
            autofocus=true
            invalid=["username"]
            name="username"
            type="text"
            value=(user.username)!''>
            ${msg("placeholderUsername")}
          </@inputPrimary.kw>
        </div>
      </#if>
      <div>
        <span>${msg("email")}</span>
        <@inputPrimary.kw
          autocomplete="email"
          invalid=["email"]
          name="email"
          type="email"
          value=(user.email)!''>
          ${msg("placeholderEmail")}
        </@inputPrimary.kw>
      </div>
      <div>
        <span>${msg("firstName")}</span>
        <@inputPrimary.kw
          autocomplete="given-name"
          invalid=["firstName"]
          name="firstName"
          type="text"
          value=(user.firstName)!''>
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
          value=(user.lastName)!''>
          ${msg("placeholderLastname")}
        </@inputPrimary.kw>
      </div>

      <#-- TODO isAppInitiatedAction -->

      <div class="pt-4">
        <@buttonPrimary.kw type="submit">
          ${msg("doSubmit")}
        </@buttonPrimary.kw>
      </div>
    </form>
  </#if>
</@layout.registrationLayout>
