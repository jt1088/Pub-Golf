<%@ page import="pubgulf.Address" %>



<div class="fieldcontain ${hasErrors(bean: addressInstance, field: 'address1', 'error')} required">
	<label for="address1">
		<g:message code="address.address1.label" default="Address1" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="address1" required="" value="${addressInstance?.address1}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: addressInstance, field: 'address2', 'error')} ">
	<label for="address2">
		<g:message code="address.address2.label" default="Address2" />
		
	</label>
	<g:textField name="address2" value="${addressInstance?.address2}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: addressInstance, field: 'city', 'error')} required">
	<label for="city">
		<g:message code="address.city.label" default="City" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="city" required="" value="${addressInstance?.city}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: addressInstance, field: 'state', 'error')} required">
	<label for="state">
		<g:message code="address.state.label" default="State" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="state" name="state.id" from="${pubgulf.State.list()}" optionKey="id" required="" value="${addressInstance?.state?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: addressInstance, field: 'zip', 'error')} required">
	<label for="zip">
		<g:message code="address.zip.label" default="Zip" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="zip" required="" value="${addressInstance?.zip}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: addressInstance, field: 'country', 'error')} ">
	<label for="country">
		<g:message code="address.country.label" default="Country" />
		
	</label>
	<g:textField name="country" value="${addressInstance?.country}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: addressInstance, field: 'latitude', 'error')} ">
	<label for="latitude">
		<g:message code="address.latitude.label" default="Latitude" />
		
	</label>
	<g:textField name="latitude" value="${addressInstance?.latitude}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: addressInstance, field: 'longitude', 'error')} ">
	<label for="longitude">
		<g:message code="address.longitude.label" default="Longitude" />
		
	</label>
	<g:textField name="longitude" value="${addressInstance?.longitude}"/>
</div>

