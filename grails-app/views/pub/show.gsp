
<%@ page import="pubgulf.Pub" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="bootstrap">
		<g:set var="entityName" value="${message(code: 'pub.label', default: 'Pub')}" />
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
				
					<g:if test="${pubInstance?.name}">
						<dt><g:message code="pub.name.label" default="Name" /></dt>
						
							<dd><g:fieldValue bean="${pubInstance}" field="name"/></dd>
						
					</g:if>
				
					<g:if test="${pubInstance?.address}">
						<dt><g:message code="pub.address.label" default="Address" /></dt>
						
							<dd><g:link controller="address" action="show" id="${pubInstance?.address?.id}">${pubInstance?.address?.encodeAsHTML()}</g:link></dd>
						
					</g:if>
				
					<g:if test="${pubInstance?.dateCreated}">
						<dt><g:message code="pub.dateCreated.label" default="Date Created" /></dt>
						
							<dd><g:formatDate date="${pubInstance?.dateCreated}" /></dd>
						
					</g:if>
				
					<g:if test="${pubInstance?.lastUpdated}">
						<dt><g:message code="pub.lastUpdated.label" default="Last Updated" /></dt>
						
							<dd><g:formatDate date="${pubInstance?.lastUpdated}" /></dd>
						
					</g:if>
				
				</dl>

				<g:form>
					<g:hiddenField name="id" value="${pubInstance?.id}" />
					<div class="form-actions">
						<g:link class="btn" action="edit" id="${pubInstance?.id}">
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
