<#import "template.ftl" as layout>
<#import "components/button/danger.ftl" as buttonPrimary>
<#import "components/button/secondary.ftl" as buttonSecondary>
<#import "components/layout/alerts.ftl" as alerts>

<@layout.registrationLayout displayInfo=true displayMessage=false; section>
  <#if section="header">
    ${msg("deleteAccountConfirm")}
  <#elseif section="form">
    ${msg("irreversibleAction")}

    <p>${msg("deletingImplies")}</p>
    <ul class="list-square pl-6 py-2 space-y-2">
      <li>${msg("loggingOutImmediately")}</li>
      <li>${msg("errasingData")}</li>
    </ul>
  <#elseif section="info">
    <form class="m-0 space-y-4" action="${url.loginAction}" method="POST">
      <@buttonPrimary.kw name="accept" type="submit">
        <span>${msg("doConfirmDelete")}</span>
      </@buttonPrimary.kw>
      <#if triggered_from_aia>
        <@buttonSecondary.kw type="submit" name="cancel-aia" value="true">
          <span>${msg("doCancel")}</span>
        </@buttonSecondary.kw>
      </#if>
    </form>
  </#if>
</@layout.registrationLayout>
