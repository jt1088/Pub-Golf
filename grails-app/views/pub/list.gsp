
<%@ page import="pubgulf.Pub" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="bootstrap">
		<g:set var="entityName" value="${message(code: 'pub.label', default: 'Pub')}" />
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
						
							<g:sortableColumn property="name" title="${message(code: 'pub.name.label', default: 'Name')}" />
						
							<th class="header"><g:message code="pub.address.label" default="Address" /></th>
						
							<g:sortableColumn property="dateCreated" title="${message(code: 'pub.dateCreated.label', default: 'Date Created')}" />
						
							<g:sortableColumn property="lastUpdated" title="${message(code: 'pub.lastUpdated.label', default: 'Last Updated')}" />
						
							<th></th>
						</tr>
					</thead>
					<tbody>
					<g:each in="${pubInstanceList}" var="pubInstance">
						<tr>
						
							<td>${fieldValue(bean: pubInstance, field: "name")}</td>
						
							<td>${fieldValue(bean: pubInstance, field: "address")}</td>
						
							<td><g:formatDate date="${pubInstance.dateCreated}" /></td>
						
							<td><g:formatDate date="${pubInstance.lastUpdated}" /></td>
						
							<td class="link">
								<g:link action="show" id="${pubInstance.id}" class="btn btn-small">Show &raquo;</g:link>
							</td>
						</tr>
					</g:each>
					</tbody>
				</table>
				<div class="pagination">
					<bootstrap:paginate total="${pubInstanceTotal}" />
				</div>
			</div>

		</div>
	</body>
</html>
