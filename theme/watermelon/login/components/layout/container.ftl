<#import "./page-footer.ftl" as pageFooter>

<#macro kw>
  <div class="bg-secondary-200 flex flex-col items-center justify-center min-h-screen">
    <div class="sm:max-w-prose space-y-6 w-full grow sm:pt-16 pb-8">
      <#nested>
    </div>
    <div class="w-full p-4 text-center">
      <@pageFooter.kw />
    </div>
  </div>
</#macro>
