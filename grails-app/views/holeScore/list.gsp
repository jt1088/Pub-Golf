
<%@ page import="pubgulf.course.HoleScore" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="bootstrap">
		<g:set var="entityName" value="${message(code: 'holeScore.label', default: 'HoleScore')}" />
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
						
							<g:sortableColumn property="dateCreated" title="${message(code: 'holeScore.dateCreated.label', default: 'Date Created')}" />
						
							<th class="header"><g:message code="holeScore.eventHole.label" default="Event Hole" /></th>
						
							<g:sortableColumn property="lastUpdated" title="${message(code: 'holeScore.lastUpdated.label', default: 'Last Updated')}" />
						
							<g:sortableColumn property="score" title="${message(code: 'holeScore.score.label', default: 'Score')}" />
						
							<th></th>
						</tr>
					</thead>
					<tbody>
					<g:each in="${holeScoreInstanceList}" var="holeScoreInstance">
						<tr>
						
							<td><g:formatDate date="${holeScoreInstance.dateCreated}" /></td>
						
							<td>${fieldValue(bean: holeScoreInstance, field: "eventHole")}</td>
						
							<td><g:formatDate date="${holeScoreInstance.lastUpdated}" /></td>
						
							<td>${fieldValue(bean: holeScoreInstance, field: "score")}</td>
						
							<td class="link">
								<g:link action="show" id="${holeScoreInstance.id}" class="btn btn-small">Show &raquo;</g:link>
							</td>
						</tr>
					</g:each>
					</tbody>
				</table>
				<div class="pagination">
					<bootstrap:paginate total="${holeScoreInstanceTotal}" />
				</div>
			</div>

		</div>
	</body>
</html>
