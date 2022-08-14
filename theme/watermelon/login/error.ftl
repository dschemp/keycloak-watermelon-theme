<#import "template.ftl" as layout>
<#import "components/link/buttonPrimary.ftl" as buttonLinkPrimary>
<#import "components/link/buttonSecondary.ftl" as buttonLinkSecondary>

<@layout.registrationLayout displayInfo=true displayMessage=false; section>
  <#if section="header">
    ${msg("errorTitle")}
  <#elseif section="form">
    <span>${kcSanitize(message.summary)}</span>
  <#elseif section="info">
    <div class="space-y-4">
      <@buttonLinkPrimary.kw href=client.baseUrl>
        <span>${kcSanitize(msg("backToApplication"))?no_esc}</span>
      </@buttonLinkPrimary.kw>
      <@buttonLinkSecondary.kw href=url.loginUrl>
        <span>${kcSanitize(msg("backToLogin"))?no_esc}</span>
      </@buttonLinkSecondary.kw>
    </div>
  </#if>
</@layout.registrationLayout>
