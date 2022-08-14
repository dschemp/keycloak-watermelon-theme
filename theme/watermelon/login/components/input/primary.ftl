<#macro kw invalid name autofocus=false disabled=false monospace=false message=true required=false rest...>
  <label class="sr-only" for="${name}">
    <#nested>
  </label>
  <input
    <#if autofocus>autofocus</#if>
    <#if disabled>disabled</#if>
    <#if required>required</#if>
    aria-invalid="${messagesPerField.existsError(invalid)?c}"
    class="block border-gray-300 mt-1 rounded-md w-full focus:ring focus:ring-opacity-50
    <#if monospace>font-mono</#if>
    <#if message && messagesPerField.existsError(invalid)>
      focus:ring-accent-200 border-accent-300
    <#else>
      focus:border-primary-400 focus:ring-primary-300
    </#if>
    "
    id="${name}"
    name="${name}"
    placeholder="<#compress><#nested></#compress>"
    <#list rest as attrName, attrValue>
      ${attrName}="${attrValue}"
    </#list>
  >
  <#if message && messagesPerField.existsError(invalid)>
    <div class="mt-2 text-accent-600 text-sm">
      ${kcSanitize(messagesPerField.getFirstError(invalid))?no_esc}
    </div>
  </#if>
</#macro>
