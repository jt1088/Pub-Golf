
<%@ page import="pubgulf.course.EventTeam" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="bootstrap">
		<g:set var="entityName" value="${message(code: 'eventTeam.label', default: 'EventTeam')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<div class="row-fluid">
			
			<div class="span3">
				<div class="well">
					<ul class="nav nav-list">
						<li class="nav-header">${entityName}</li>
						<li class="active">
							<g:link class="list" action="list">
								<i class="icon-list icon-white"></i>
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
					<h1><g:message code="default.list.label" args="[entityName]" /></h1>
				</div>

				<g:if test="${flash.message}">
				<bootstrap:alert class="alert-info">${flash.message}</bootstrap:alert>
				</g:if>
				
				<table class="table table-striped">
					<thead>
						<tr>
						
							<g:sortableColumn property="teamName" title="${message(code: 'eventTeam.teamName.label', default: 'Team Name')}" />
						
							<th class="header"><g:message code="eventTeam.player1.label" default="Player1" /></th>
						
							<th class="header"><g:message code="eventTeam.player2.label" default="Player2" /></th>
						
							<g:sortableColumn property="dateCreated" title="${message(code: 'eventTeam.dateCreated.label', default: 'Date Created')}" />
						
							<th class="header"><g:message code="eventTeam.event.label" default="Event" /></th>
						
							<g:sortableColumn property="lastUpdated" title="${message(code: 'eventTeam.lastUpdated.label', default: 'Last Updated')}" />
						
							<th></th>
						</tr>
					</thead>
					<tbody>
					<g:each in="${eventTeamInstanceList}" var="eventTeamInstance">
						<tr>
						
							<td>${fieldValue(bean: eventTeamInstance, field: "teamName")}</td>
						
							<td>${fieldValue(bean: eventTeamInstance, field: "player1")}</td>
						
							<td>${fieldValue(bean: eventTeamInstance, field: "player2")}</td>
						
							<td><g:formatDate date="${eventTeamInstance.dateCreated}" /></td>
						
							<td>${fieldValue(bean: eventTeamInstance, field: "event")}</td>
						
							<td><g:formatDate date="${eventTeamInstance.lastUpdated}" /></td>
						
							<td class="link">
								<g:link action="show" id="${eventTeamInstance.id}" class="btn btn-small">Show &raquo;</g:link>
							</td>
						</tr>
					</g:each>
					</tbody>
				</table>
				<div class="pagination">
					<bootstrap:paginate total="${eventTeamInstanceTotal}" />
				</div>
			</div>

		</div>
	</body>
</html>
