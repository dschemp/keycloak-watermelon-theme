<#import "../icon/external-link.ftl" as iconExternalLink>
<#import "../link/accent.ftl" as linkAccent>

<#macro kw>
  <#nested "show-username">
  <div class="flex items-center justify-center mb-4 space-x-2">
    <b>${auth.attemptedUsername}</b>
    <@linkAccent.kw
      href="${url.loginRestartFlowUrl}"
      title="${msg('restartLoginTooltip')}"
    >
      <@iconExternalLink.kw />
    </@linkAccent.kw>
  </div>
</#macro>
