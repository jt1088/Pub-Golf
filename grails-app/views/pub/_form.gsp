<%@ page import="pubgulf.Pub" %>



<div class="fieldcontain ${hasErrors(bean: pubInstance, field: 'name', 'error')} ">
	<label for="name">
		<g:message code="pub.name.label" default="Name" />
		
	</label>
	<g:textField name="name" value="${pubInstance?.name}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: pubInstance, field: 'address', 'error')} required">
	<label for="address">
		<g:message code="pub.address.label" default="Address" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="address" name="address.id" from="${pubgulf.Address.list()}" optionKey="id" required="" value="${pubInstance?.address?.id}" class="many-to-one"/>
</div>

