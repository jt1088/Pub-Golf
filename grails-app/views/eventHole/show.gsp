
<%@ page import="pubgulf.course.EventHole" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="bootstrap">
		<g:set var="entityName" value="${message(code: 'eventHole.label', default: 'EventHole')}" />
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
				
					<g:if test="${eventHoleInstance?.holeNumber}">
						<dt><g:message code="eventHole.holeNumber.label" default="Hole Number" /></dt>
						
							<dd><g:fieldValue bean="${eventHoleInstance}" field="holeNumber"/></dd>
						
					</g:if>
				
					<g:if test="${eventHoleInstance?.pub}">
						<dt><g:message code="eventHole.pub.label" default="Pub" /></dt>
						
							<dd><g:link controller="pub" action="show" id="${eventHoleInstance?.pub?.id}">${eventHoleInstance?.pub?.encodeAsHTML()}</g:link></dd>
						
					</g:if>
				
					<g:if test="${eventHoleInstance?.par}">
						<dt><g:message code="eventHole.par.label" default="Par" /></dt>
						
							<dd><g:fieldValue bean="${eventHoleInstance}" field="par"/></dd>
						
					</g:if>
				
					<g:if test="${eventHoleInstance?.description}">
						<dt><g:message code="eventHole.description.label" default="Description" /></dt>
						
							<dd><g:fieldValue bean="${eventHoleInstance}" field="description"/></dd>
						
					</g:if>
				
					<g:if test="${eventHoleInstance?.event}">
						<dt><g:message code="eventHole.event.label" default="Event" /></dt>
						
							<dd><g:link controller="event" action="show" id="${eventHoleInstance?.event?.id}">${eventHoleInstance?.event?.encodeAsHTML()}</g:link></dd>
						
					</g:if>
				
					<g:if test="${eventHoleInstance?.hasBunker}">
						<dt><g:message code="eventHole.hasBunker.label" default="Has Bunker" /></dt>
						
							<dd><g:formatBoolean boolean="${eventHoleInstance?.hasBunker}" /></dd>
						
					</g:if>
				
					<g:if test="${eventHoleInstance?.hasWaterHazard}">
						<dt><g:message code="eventHole.hasWaterHazard.label" default="Has Water Hazard" /></dt>
						
							<dd><g:formatBoolean boolean="${eventHoleInstance?.hasWaterHazard}" /></dd>
						
					</g:if>
				
				</dl>

				<g:form>
					<g:hiddenField name="id" value="${eventHoleInstance?.id}" />
					<div class="form-actions">
						<g:link class="btn" action="edit" id="${eventHoleInstance?.id}">
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
