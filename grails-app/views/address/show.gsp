
<%@ page import="pubgulf.Address" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="bootstrap">
		<g:set var="entityName" value="${message(code: 'address.label', default: 'Address')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<div class="row-fluid">
			
			<div class="span3">
				<div class="well">
					<ul class="nav nav-list">
						<li class="nav-header">${entityName}</li>
						<li>
							<g:link class="list" action="list">
								<i class="icon-list"></i>
								<g:message code="default.list.label" args="[entityName]" />
							</g:link>
						</li>
						<li>
							<g:link class="create" action="create">
								<i class="icon-plus"></i>
								<g:message code="default.create.label" args="[entityName]" />
							</g:link>
						</li>
					</ul>
				</div>
			</div>
			
			<div class="span9">

				<div class="page-header">
					<h1><g:message code="default.show.label" args="[entityName]" /></h1>
				</div>

				<g:if test="${flash.message}">
				<bootstrap:alert class="alert-info">${flash.message}</bootstrap:alert>
				</g:if>

				<dl>
				
					<g:if test="${addressInstance?.address1}">
						<dt><g:message code="address.address1.label" default="Address1" /></dt>
						
							<dd><g:fieldValue bean="${addressInstance}" field="address1"/></dd>
						
					</g:if>
				
					<g:if test="${addressInstance?.address2}">
						<dt><g:message code="address.address2.label" default="Address2" /></dt>
						
							<dd><g:fieldValue bean="${addressInstance}" field="address2"/></dd>
						
					</g:if>
				
					<g:if test="${addressInstance?.city}">
						<dt><g:message code="address.city.label" default="City" /></dt>
						
							<dd><g:fieldValue bean="${addressInstance}" field="city"/></dd>
						
					</g:if>
				
					<g:if test="${addressInstance?.state}">
						<dt><g:message code="address.state.label" default="State" /></dt>
						
							<dd><g:link controller="state" action="show" id="${addressInstance?.state?.id}">${addressInstance?.state?.encodeAsHTML()}</g:link></dd>
						
					</g:if>
				
					<g:if test="${addressInstance?.zip}">
						<dt><g:message code="address.zip.label" default="Zip" /></dt>
						
							<dd><g:fieldValue bean="${addressInstance}" field="zip"/></dd>
						
					</g:if>
				
					<g:if test="${addressInstance?.country}">
						<dt><g:message code="address.country.label" default="Country" /></dt>
						
							<dd><g:fieldValue bean="${addressInstance}" field="country"/></dd>
						
					</g:if>
				
					<g:if test="${addressInstance?.latitude}">
						<dt><g:message code="address.latitude.label" default="Latitude" /></dt>
						
							<dd><g:fieldValue bean="${addressInstance}" field="latitude"/></dd>
						
					</g:if>
				
					<g:if test="${addressInstance?.longitude}">
						<dt><g:message code="address.longitude.label" default="Longitude" /></dt>
						
							<dd><g:fieldValue bean="${addressInstance}" field="longitude"/></dd>
						
					</g:if>
				
					<g:if test="${addressInstance?.dateCreated}">
						<dt><g:message code="address.dateCreated.label" default="Date Created" /></dt>
						
							<dd><g:formatDate date="${addressInstance?.dateCreated}" /></dd>
						
					</g:if>
				
					<g:if test="${addressInstance?.lastUpdated}">
						<dt><g:message code="address.lastUpdated.label" default="Last Updated" /></dt>
						
							<dd><g:formatDate date="${addressInstance?.lastUpdated}" /></dd>
						
					</g:if>
				
				</dl>

				<g:form>
					<g:hiddenField name="id" value="${addressInstance?.id}" />
					<div class="form-actions">
						<g:link class="btn" action="edit" id="${addressInstance?.id}">
							<i class="icon-pencil"></i>
							<g:message code="default.button.edit.label" default="Edit" />
						</g:link>
						<button class="btn btn-danger" type="submit" name="_action_delete">
							<i class="icon-trash icon-white"></i>
							<g:message code="default.button.delete.label" default="Delete" />
						</button>
					</div>
				</g:form>

			</div>

		</div>
	</body>
</html>
