<#import "./page-footer.ftl" as pageFooter>

<#macro kw>
  <div class="bg-secondary-200 bg-repeat bg-center flex flex-col items-center min-h-screen"
    style="background-image: url('${url.resourcesPath}/static/background.png')">
    <div class="sm:max-w-prose space-y-6 w-full py-0 grow sm:pt-24 pb-8">
      <#nested>
    </div>
    <div class="w-full bg-secondary-300 py-2 px-4 text-center">
      <@pageFooter.kw />
    </div>
  </div>
</#macro>
