
<%@ page import="pubgulf.course.Event" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="bootstrap">
		<g:set var="entityName" value="${message(code: 'event.label', default: 'Event')}" />
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
				
					<g:if test="${eventInstance?.name}">
						<dt><g:message code="event.name.label" default="Name" /></dt>
						
							<dd><g:fieldValue bean="${eventInstance}" field="name"/></dd>
						
					</g:if>
				
					<g:if test="${eventInstance?.eventDate}">
						<dt><g:message code="event.eventDate.label" default="Event Date" /></dt>
						
							<dd><g:formatDate date="${eventInstance?.eventDate}" /></dd>
						
					</g:if>
				
					<g:if test="${eventInstance?.lastUpdated}">
						<dt><g:message code="event.lastUpdated.label" default="Last Updated" /></dt>
						
							<dd><g:formatDate date="${eventInstance?.lastUpdated}" /></dd>
						
					</g:if>
				
					<g:if test="${eventInstance?.dateCreated}">
						<dt><g:message code="event.dateCreated.label" default="Date Created" /></dt>
						
							<dd><g:formatDate date="${eventInstance?.dateCreated}" /></dd>
						
					</g:if>
				
					<g:if test="${eventInstance?.holes}">
						<dt><g:message code="event.holes.label" default="Holes" /></dt>
						
							<g:each in="${eventInstance.holes}" var="h">
							<dd><g:link controller="eventHole" action="show" id="${h.id}">${h?.encodeAsHTML()}</g:link></dd>
							</g:each>
						
					</g:if>
				
					<g:if test="${eventInstance?.isActive}">
						<dt><g:message code="event.isActive.label" default="Is Active" /></dt>
						
							<dd><g:formatBoolean boolean="${eventInstance?.isActive}" /></dd>
						
					</g:if>
				
					<g:if test="${eventInstance?.teams}">
						<dt><g:message code="event.teams.label" default="Teams" /></dt>
						
							<g:each in="${eventInstance.teams}" var="t">
							<dd><g:link controller="eventTeam" action="show" id="${t.id}">${t?.encodeAsHTML()}</g:link></dd>
							</g:each>
						
					</g:if>
				
				</dl>

				<g:form>
					<g:hiddenField name="id" value="${eventInstance?.id}" />
					<div class="form-actions">
						<g:link class="btn" action="edit" id="${eventInstance?.id}">
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
