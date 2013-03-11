
<%@ page import="pubgulf.course.EventHole" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="bootstrap">
		<g:set var="entityName" value="${message(code: 'eventHole.label', default: 'EventHole')}" />
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
						
							<g:sortableColumn property="holeNumber" title="${message(code: 'eventHole.holeNumber.label', default: 'Hole Number')}" />
						
							<th class="header"><g:message code="eventHole.pub.label" default="Pub" /></th>
						
							<g:sortableColumn property="par" title="${message(code: 'eventHole.par.label', default: 'Par')}" />
						
							<g:sortableColumn property="description" title="${message(code: 'eventHole.description.label', default: 'Description')}" />
						
							<th class="header"><g:message code="eventHole.event.label" default="Event" /></th>
						
							<g:sortableColumn property="hasBunker" title="${message(code: 'eventHole.hasBunker.label', default: 'Has Bunker')}" />
						
							<th></th>
						</tr>
					</thead>
					<tbody>
					<g:each in="${eventHoleInstanceList}" var="eventHoleInstance">
						<tr>
						
							<td>${fieldValue(bean: eventHoleInstance, field: "holeNumber")}</td>
						
							<td>${fieldValue(bean: eventHoleInstance, field: "pub")}</td>
						
							<td>${fieldValue(bean: eventHoleInstance, field: "par")}</td>
						
							<td>${fieldValue(bean: eventHoleInstance, field: "description")}</td>
						
							<td>${fieldValue(bean: eventHoleInstance, field: "event")}</td>
						
							<td><g:formatBoolean boolean="${eventHoleInstance.hasBunker}" /></td>
						
							<td class="link">
								<g:link action="show" id="${eventHoleInstance.id}" class="btn btn-small">Show &raquo;</g:link>
							</td>
						</tr>
					</g:each>
					</tbody>
				</table>
				<div class="pagination">
					<bootstrap:paginate total="${eventHoleInstanceTotal}" />
				</div>
			</div>

		</div>
	</body>
</html>
