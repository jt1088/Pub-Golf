<%@ page import="pubgulf.course.EventHole" %>



<div class="fieldcontain ${hasErrors(bean: eventHoleInstance, field: 'holeNumber', 'error')} required">
	<label for="holeNumber">
		<g:message code="eventHole.holeNumber.label" default="Hole Number" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="holeNumber" type="number" value="${eventHoleInstance.holeNumber}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: eventHoleInstance, field: 'pub', 'error')} required">
	<label for="pub">
		<g:message code="eventHole.pub.label" default="Pub" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="pub" name="pub.id" from="${pubgulf.Pub.list()}" optionKey="id" required="" value="${eventHoleInstance?.pub?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: eventHoleInstance, field: 'par', 'error')} required">
	<label for="par">
		<g:message code="eventHole.par.label" default="Par" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="par" type="number" value="${eventHoleInstance.par}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: eventHoleInstance, field: 'description', 'error')} ">
	<label for="description">
		<g:message code="eventHole.description.label" default="Description" />
		
	</label>
	<g:textField name="description" value="${eventHoleInstance?.description}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: eventHoleInstance, field: 'event', 'error')} required">
	<label for="event">
		<g:message code="eventHole.event.label" default="Event" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="event" name="event.id" from="${pubgulf.course.Event.list()}" optionKey="id" required="" value="${eventHoleInstance?.event?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: eventHoleInstance, field: 'hasBunker', 'error')} ">
	<label for="hasBunker">
		<g:message code="eventHole.hasBunker.label" default="Has Bunker" />
		
	</label>
	<g:checkBox name="hasBunker" value="${eventHoleInstance?.hasBunker}" />
</div>

<div class="fieldcontain ${hasErrors(bean: eventHoleInstance, field: 'hasWaterHazard', 'error')} ">
	<label for="hasWaterHazard">
		<g:message code="eventHole.hasWaterHazard.label" default="Has Water Hazard" />
		
	</label>
	<g:checkBox name="hasWaterHazard" value="${eventHoleInstance?.hasWaterHazard}" />
</div>

