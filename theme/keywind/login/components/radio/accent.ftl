<#macro kw id tabIndex checked=false rest...>
  <div>
    <input
      <#if checked>checked</#if>
      class="border-gray-300 text-accent-600 focus:ring-accent-200 focus:ring-opacity-50"
      id="${id}"
      type="radio"
      <#list rest as attrName, attrValue>
        ${attrName}="${attrValue}"
      </#list>
    >
    <label
      class="font-medium ml-2 text-sm"
      for="${id}"
      tabindex="${tabIndex}">
      <#nested>
    </label>
  </div>
</#macro>
