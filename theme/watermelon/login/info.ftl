<#import "template.ftl" as layout>
<#import "components/link/buttonPrimary.ftl" as buttonLinkPrimary>

<@layout.registrationLayout displayInfo=true displayMessage=false; section>
  <#if section="header">
    <#if messageHeader??>
      ${messageHeader}
    <#else>
      ${message.summary}
    </#if>
  <#elseif section="form">
    <div>
      <span>${message.summary}</span>
      <#if requiredActions??>
        <#list requiredActions>
          <ul class="list-square pl-6 py-2 space-y-2">
            <#items as reqActionItem>
              <li>${msg("requiredAction.${reqActionItem}")}</li>
            </#items>
          </ul>
        </#list>
      <#else>
      </#if>
    </div>
  <#elseif section="info">
    <#if skipLink??>
    <#else>
      <#if pageRedirectUri?has_content>
        <@buttonLinkPrimary.kw href=pageRedirectUri>
          <span>${kcSanitize(msg("backToApplication"))?no_esc}</span>
        </@buttonLinkPrimary.kw>
      <#elseif actionUri?has_content>
        <@buttonLinkPrimary.kw href=actionUri>
          <span>${kcSanitize(msg("proceedWithAction"))?no_esc}</span>
        </@buttonLinkPrimary.kw>
      <#elseif (client.baseUrl)?has_content>
        <@buttonLinkPrimary.kw href=client.baseUrl>
          <span>${kcSanitize(msg("backToApplication"))?no_esc}</span>
        </@buttonLinkPrimary.kw>
      </#if>
    </#if>
  </#if>
</@layout.registrationLayout>
