<#macro kw>
  <div class="pb-4">
    <#if properties.logoFileName?has_content>
      <div class="flex justify-center">
        <img class="max-h-[8rem]" src="${url.resourcesPath}/${properties.logoFileName}">
      </div>
    <#else>
      <div class="font-bold text-center text-2xl">
        ${kcSanitize(msg("loginTitleHtml", (realm.displayNameHtml!"")))?no_esc}
      </div>
    </#if>
  </div>
</#macro>
