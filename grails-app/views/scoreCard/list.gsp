
<%@ page import="pubgulf.course.ScoreCard" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="bootstrap">
		<g:set var="entityName" value="${message(code: 'scoreCard.label', default: 'ScoreCard')}" />
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
						
							<g:sortableColumn property="dateCreated" title="${message(code: 'scoreCard.dateCreated.label', default: 'Date Created')}" />
						
							<th class="header"><g:message code="scoreCard.event.label" default="Event" /></th>
						
							<g:sortableColumn property="lastUpdated" title="${message(code: 'scoreCard.lastUpdated.label', default: 'Last Updated')}" />
						
							<th class="header"><g:message code="scoreCard.user.label" default="User" /></th>
						
							<th></th>
						</tr>
					</thead>
					<tbody>
					<g:each in="${scoreCardInstanceList}" var="scoreCardInstance">
						<tr>
						
							<td><g:formatDate date="${scoreCardInstance.dateCreated}" /></td>
						
							<td>${fieldValue(bean: scoreCardInstance, field: "event")}</td>
						
							<td><g:formatDate date="${scoreCardInstance.lastUpdated}" /></td>
						
							<td>${fieldValue(bean: scoreCardInstance, field: "user")}</td>
						
							<td class="link">
								<g:link action="show" id="${scoreCardInstance.id}" class="btn btn-small">Show &raquo;</g:link>
							</td>
						</tr>
					</g:each>
					</tbody>
				</table>
				<div class="pagination">
					<bootstrap:paginate total="${scoreCardInstanceTotal}" />
				</div>
			</div>

		</div>
	</body>
</html>
