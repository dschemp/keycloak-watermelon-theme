<#macro kw component="a" rest...>
  <${component}
    class="bg-secondary-200 flex justify-center px-4 py-2 relative rounded-full text-sm text-secondary-600 w-full focus:outline-none focus:ring-2 focus:ring-secondary-600 focus:ring-offset-2 hover:bg-secondary-200 hover:bg-secondary-300"
    <#list rest as attrName, attrValue>
      ${attrName}="${attrValue}"
    </#list>
  >
    <#nested>
  </${component}>
</#macro>
