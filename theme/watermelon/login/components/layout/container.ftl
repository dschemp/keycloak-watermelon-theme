<#import "./page-footer.ftl" as pageFooter>

<#macro kw>
  <div class="bg-secondary-200 bg-repeat bg-center flex flex-col items-center min-h-screen">
    <div class="sm:max-w-prose space-y-6 w-full py-0 grow sm:pt-24 pb-8">
      <#nested>
    </div>
    <div class="w-full p-4 text-center">
      <@pageFooter.kw />
    </div>
  </div>
</#macro>
