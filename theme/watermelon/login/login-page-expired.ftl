<#import "template.ftl" as layout>
<#import "components/link/accent.ftl" as linkAccent>

<@layout.registrationLayout displayInfo=true displayMessage=false; section>
  <#if section="header">
    ${msg("pageExpiredTitle")}
  <#elseif section="info">
    <div class="space-y-4">
      <div class="flex space-x-2">
        <span>${msg("pageExpiredMsg1")}:</span>
        <@linkAccent.kw href=url.loginRestartFlowUrl>
          <span>${msg("doClickHere")}</span>
        </@linkAccent.kw>
      </div>
      <div class="flex space-x-2">
        <span>${msg("pageExpiredMsg2")}:</span>
        <@linkAccent.kw href=url.loginAction>
          <span>${msg("doClickHere")}</span>
        </@linkAccent.kw>
      </div>
    </div>
  </#if>
</@layout.registrationLayout>
