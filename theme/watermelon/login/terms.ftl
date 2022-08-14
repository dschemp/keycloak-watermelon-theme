<#import "template.ftl" as layout>
<#import "components/button/primary.ftl" as buttonPrimary>
<#import "components/button/secondary.ftl" as buttonSecondary>

<@layout.registrationLayout displayInfo=true displayMessage=false; section>
  <#if section="header">
    ${msg("termsTitle")}
  <#elseif section="form">
    <span>${kcSanitize(msg("termsText"))?no_esc}</span>
  <#elseif section="info">
    <form class="m-0 space-y-4" action="${url.loginAction}" method="POST">
      <@buttonPrimary.kw name="accept" type="submit">
        <span>${msg("doAccept")}</span>
      </@buttonPrimary.kw>
      <@buttonSecondary.kw name="cancel" type="submit">
        <span>${msg("doDecline")}</span>
      </@buttonSecondary.kw>
    </form>
  </#if>
</@layout.registrationLayout>
