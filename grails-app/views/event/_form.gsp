<%@ page import="pubgulf.course.Event" %>



<div class="fieldcontain ${hasErrors(bean: eventInstance, field: 'name', 'error')} ">
	<label for="name">
		<g:message code="event.name.label" default="Name" />
		
	</label>
	<g:textField name="name" value="${eventInstance?.name}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: eventInstance, field: 'eventDate', 'error')} required">
	<label for="eventDate">
		<g:message code="event.eventDate.label" default="Event Date" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="eventDate" precision="day"  value="${eventInstance?.eventDate}"  />
</div>

<div class="fieldcontain ${hasErrors(bean: eventInstance, field: 'holes', 'error')} ">
	<label for="holes">
		<g:message code="event.holes.label" default="Holes" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${eventInstance?.holes?}" var="h">
    <li><g:link controller="eventHole" action="show" id="${h.id}">${h?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="eventHole" action="create" params="['event.id': eventInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'eventHole.label', default: 'EventHole')])}</g:link>
</li>
</ul>

</div>

<div class="fieldcontain ${hasErrors(bean: eventInstance, field: 'isActive', 'error')} ">
	<label for="isActive">
		<g:message code="event.isActive.label" default="Is Active" />
		
	</label>
	<g:checkBox name="isActive" value="${eventInstance?.isActive}" />
</div>

<div class="fieldcontain ${hasErrors(bean: eventInstance, field: 'teams', 'error')} ">
	<label for="teams">
		<g:message code="event.teams.label" default="Teams" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${eventInstance?.teams?}" var="t">
    <li><g:link controller="eventTeam" action="show" id="${t.id}">${t?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="eventTeam" action="create" params="['event.id': eventInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'eventTeam.label', default: 'EventTeam')])}</g:link>
</li>
</ul>

</div>

