<%@ page import="pubgulf.course.HoleScore" %>



<div class="fieldcontain ${hasErrors(bean: holeScoreInstance, field: 'eventHole', 'error')} required">
	<label for="eventHole">
		<g:message code="holeScore.eventHole.label" default="Event Hole" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="eventHole" name="eventHole.id" from="${pubgulf.course.EventHole.list()}" optionKey="id" required="" value="${holeScoreInstance?.eventHole?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: holeScoreInstance, field: 'score', 'error')} required">
	<label for="score">
		<g:message code="holeScore.score.label" default="Score" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="score" type="number" value="${holeScoreInstance.score}" required=""/>
</div>

