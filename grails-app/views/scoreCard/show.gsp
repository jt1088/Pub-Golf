
<%@ page import="pubgulf.course.ScoreCard" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="bootstrap">
		<g:set var="entityName" value="${message(code: 'scoreCard.label', default: 'ScoreCard')}" />
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
				
					<g:if test="${scoreCardInstance?.dateCreated}">
						<dt><g:message code="scoreCard.dateCreated.label" default="Date Created" /></dt>
						
							<dd><g:formatDate date="${scoreCardInstance?.dateCreated}" /></dd>
						
					</g:if>
				
					<g:if test="${scoreCardInstance?.event}">
						<dt><g:message code="scoreCard.event.label" default="Event" /></dt>
						
							<dd><g:link controller="event" action="show" id="${scoreCardInstance?.event?.id}">${scoreCardInstance?.event?.encodeAsHTML()}</g:link></dd>
						
					</g:if>
				
					<g:if test="${scoreCardInstance?.holes}">
						<dt><g:message code="scoreCard.holes.label" default="Holes" /></dt>
						
							<g:each in="${scoreCardInstance.holes}" var="h">
							<dd><g:link controller="holeScore" action="show" id="${h.id}">${h?.encodeAsHTML()}</g:link></dd>
							</g:each>
						
					</g:if>
				
					<g:if test="${scoreCardInstance?.lastUpdated}">
						<dt><g:message code="scoreCard.lastUpdated.label" default="Last Updated" /></dt>
						
							<dd><g:formatDate date="${scoreCardInstance?.lastUpdated}" /></dd>
						
					</g:if>
				
					<g:if test="${scoreCardInstance?.user}">
						<dt><g:message code="scoreCard.user.label" default="User" /></dt>
						
							<dd><g:link controller="user" action="show" id="${scoreCardInstance?.user?.id}">${scoreCardInstance?.user?.encodeAsHTML()}</g:link></dd>
						
					</g:if>
				
				</dl>

				<g:form>
					<g:hiddenField name="id" value="${scoreCardInstance?.id}" />
					<div class="form-actions">
						<g:link class="btn" action="edit" id="${scoreCardInstance?.id}">
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
