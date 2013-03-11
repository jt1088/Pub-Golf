
<%@ page import="pubgulf.State" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="bootstrap">
		<g:set var="entityName" value="${message(code: 'state.label', default: 'State')}" />
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
				
					<g:if test="${stateInstance?.stateName}">
						<dt><g:message code="state.stateName.label" default="State Name" /></dt>
						
							<dd><g:fieldValue bean="${stateInstance}" field="stateName"/></dd>
						
					</g:if>
				
					<g:if test="${stateInstance?.dateCreated}">
						<dt><g:message code="state.dateCreated.label" default="Date Created" /></dt>
						
							<dd><g:formatDate date="${stateInstance?.dateCreated}" /></dd>
						
					</g:if>
				
					<g:if test="${stateInstance?.lastUpdated}">
						<dt><g:message code="state.lastUpdated.label" default="Last Updated" /></dt>
						
							<dd><g:formatDate date="${stateInstance?.lastUpdated}" /></dd>
						
					</g:if>
				
					<g:if test="${stateInstance?.stateCode}">
						<dt><g:message code="state.stateCode.label" default="State Code" /></dt>
						
							<dd><g:fieldValue bean="${stateInstance}" field="stateCode"/></dd>
						
					</g:if>
				
				</dl>

				<g:form>
					<g:hiddenField name="id" value="${stateInstance?.id}" />
					<div class="form-actions">
						<g:link class="btn" action="edit" id="${stateInstance?.id}">
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
