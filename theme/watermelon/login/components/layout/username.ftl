<#import "../icon/refresh.ftl" as iconRefresh>
<#import "../link/accent.ftl" as linkAccent>

<#macro kw>
  <#nested "show-username">
  <div class="flex items-center justify-center mb-4 space-x-2 text-2xl">
    <span>${auth.attemptedUsername}</span>
    <@linkAccent.kw
      href="${url.loginRestartFlowUrl}"
      title="${msg('restartLoginTooltip')}"
    >
      <@iconRefresh.kw />
    </@linkAccent.kw>
  </div>
</#macro>
