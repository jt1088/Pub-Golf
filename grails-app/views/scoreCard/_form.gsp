<%@ page import="pubgulf.course.ScoreCard" %>



<div class="fieldcontain ${hasErrors(bean: scoreCardInstance, field: 'event', 'error')} required">
	<label for="event">
		<g:message code="scoreCard.event.label" default="Event" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="event" name="event.id" from="${pubgulf.course.Event.list()}" optionKey="id" required="" value="${scoreCardInstance?.event?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: scoreCardInstance, field: 'holes', 'error')} ">
	<label for="holes">
		<g:message code="scoreCard.holes.label" default="Holes" />
		
	</label>
	<g:select name="holes" from="${pubgulf.course.HoleScore.list()}" multiple="multiple" optionKey="id" size="5" value="${scoreCardInstance?.holes*.id}" class="many-to-many"/>
</div>

<div class="fieldcontain ${hasErrors(bean: scoreCardInstance, field: 'user', 'error')} required">
	<label for="user">
		<g:message code="scoreCard.user.label" default="User" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="user" name="user.id" from="${pubgulf.user.User.list()}" optionKey="id" required="" value="${scoreCardInstance?.user?.id}" class="many-to-one"/>
</div>

