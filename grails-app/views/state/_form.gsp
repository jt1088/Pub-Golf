<%@ page import="pubgulf.State" %>



<div class="fieldcontain ${hasErrors(bean: stateInstance, field: 'stateName', 'error')} required">
	<label for="stateName">
		<g:message code="state.stateName.label" default="State Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="stateName" required="" value="${stateInstance?.stateName}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: stateInstance, field: 'stateCode', 'error')} ">
	<label for="stateCode">
		<g:message code="state.stateCode.label" default="State Code" />
		
	</label>
	<g:textField name="stateCode" value="${stateInstance?.stateCode}"/>
</div>

