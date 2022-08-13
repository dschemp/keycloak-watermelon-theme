<#macro kw component="a" rest...>
  <${component}
    class="flex text-accent-600 hover:text-accent-500"
    <#list rest as attrName, attrValue>
      ${attrName}="${attrValue}"
    </#list>
  >
    <#nested>
  </${component}>
</#macro>
