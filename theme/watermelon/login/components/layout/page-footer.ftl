<#import "../link/secondary.ftl" as linkSecondary>
<#import "../icon/external-link.ftl" as iconExternalLink>

<#macro kw>
  <div class="text-secondary-600 flex flex-nowrap justify-center space-x-8">
    <#if properties.helpUrl?has_content>
      <@linkSecondary.kw target="_blank" href="${properties.helpUrl}">
        <div class="flex items-center space-x-1">
          <span>${msg("help")}</span>
          <@iconExternalLink.kw /></span>
        </div>
      </@linkSecondary.kw>
    </#if>
    <#if properties.accountManagementUrl?has_content>
      <@linkSecondary.kw target="_blank" href="${properties.accountManagementUrl}">
        <div class="flex items-center space-x-1">
          <span>${msg("accountManagement")}</span>
          <@iconExternalLink.kw />
        </div>
      </@linkSecondary.kw>
    </#if>
  </div>
</#macro>
