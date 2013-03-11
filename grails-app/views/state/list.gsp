
<%@ page import="pubgulf.State" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="bootstrap">
		<g:set var="entityName" value="${message(code: 'state.label', default: 'State')}" />
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
						
							<g:sortableColumn property="stateName" title="${message(code: 'state.stateName.label', default: 'State Name')}" />
						
							<g:sortableColumn property="dateCreated" title="${message(code: 'state.dateCreated.label', default: 'Date Created')}" />
						
							<g:sortableColumn property="lastUpdated" title="${message(code: 'state.lastUpdated.label', default: 'Last Updated')}" />
						
							<g:sortableColumn property="stateCode" title="${message(code: 'state.stateCode.label', default: 'State Code')}" />
						
							<th></th>
						</tr>
					</thead>
					<tbody>
					<g:each in="${stateInstanceList}" var="stateInstance">
						<tr>
						
							<td>${fieldValue(bean: stateInstance, field: "stateName")}</td>
						
							<td><g:formatDate date="${stateInstance.dateCreated}" /></td>
						
							<td><g:formatDate date="${stateInstance.lastUpdated}" /></td>
						
							<td>${fieldValue(bean: stateInstance, field: "stateCode")}</td>
						
							<td class="link">
								<g:link action="show" id="${stateInstance.id}" class="btn btn-small">Show &raquo;</g:link>
							</td>
						</tr>
					</g:each>
					</tbody>
				</table>
				<div class="pagination">
					<bootstrap:paginate total="${stateInstanceTotal}" />
				</div>
			</div>

		</div>
	</body>
</html>
