
<%@ page import="pubgulf.course.EventTeam" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="bootstrap">
		<g:set var="entityName" value="${message(code: 'eventTeam.label', default: 'EventTeam')}" />
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
				
					<g:if test="${eventTeamInstance?.teamName}">
						<dt><g:message code="eventTeam.teamName.label" default="Team Name" /></dt>
						
							<dd><g:fieldValue bean="${eventTeamInstance}" field="teamName"/></dd>
						
					</g:if>
				
					<g:if test="${eventTeamInstance?.player1}">
						<dt><g:message code="eventTeam.player1.label" default="Player1" /></dt>
						
							<dd><g:link controller="user" action="show" id="${eventTeamInstance?.player1?.id}">${eventTeamInstance?.player1?.encodeAsHTML()}</g:link></dd>
						
					</g:if>
				
					<g:if test="${eventTeamInstance?.player2}">
						<dt><g:message code="eventTeam.player2.label" default="Player2" /></dt>
						
							<dd><g:link controller="user" action="show" id="${eventTeamInstance?.player2?.id}">${eventTeamInstance?.player2?.encodeAsHTML()}</g:link></dd>
						
					</g:if>
				
					<g:if test="${eventTeamInstance?.dateCreated}">
						<dt><g:message code="eventTeam.dateCreated.label" default="Date Created" /></dt>
						
							<dd><g:formatDate date="${eventTeamInstance?.dateCreated}" /></dd>
						
					</g:if>
				
					<g:if test="${eventTeamInstance?.event}">
						<dt><g:message code="eventTeam.event.label" default="Event" /></dt>
						
							<dd><g:link controller="event" action="show" id="${eventTeamInstance?.event?.id}">${eventTeamInstance?.event?.encodeAsHTML()}</g:link></dd>
						
					</g:if>
				
					<g:if test="${eventTeamInstance?.lastUpdated}">
						<dt><g:message code="eventTeam.lastUpdated.label" default="Last Updated" /></dt>
						
							<dd><g:formatDate date="${eventTeamInstance?.lastUpdated}" /></dd>
						
					</g:if>
				
				</dl>

				<g:form>
					<g:hiddenField name="id" value="${eventTeamInstance?.id}" />
					<div class="form-actions">
						<g:link class="btn" action="edit" id="${eventTeamInstance?.id}">
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
