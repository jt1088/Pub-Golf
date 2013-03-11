<%@ page import="pubgulf.course.EventTeam" %>



<div class="fieldcontain ${hasErrors(bean: eventTeamInstance, field: 'teamName', 'error')} ">
	<label for="teamName">
		<g:message code="eventTeam.teamName.label" default="Team Name" />
		
	</label>
	<g:textField name="teamName" value="${eventTeamInstance?.teamName}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: eventTeamInstance, field: 'player1', 'error')} required">
	<label for="player1">
		<g:message code="eventTeam.player1.label" default="Player1" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="player1" name="player1.id" from="${pubgulf.user.User.list()}" optionKey="id" required="" value="${eventTeamInstance?.player1?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: eventTeamInstance, field: 'player2', 'error')} ">
	<label for="player2">
		<g:message code="eventTeam.player2.label" default="Player2" />
		
	</label>
	<g:select id="player2" name="player2.id" from="${pubgulf.user.User.list()}" optionKey="id" value="${eventTeamInstance?.player2?.id}" class="many-to-one" noSelection="['null': '']"/>
</div>

<div class="fieldcontain ${hasErrors(bean: eventTeamInstance, field: 'event', 'error')} required">
	<label for="event">
		<g:message code="eventTeam.event.label" default="Event" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="event" name="event.id" from="${pubgulf.course.Event.list()}" optionKey="id" required="" value="${eventTeamInstance?.event?.id}" class="many-to-one"/>
</div>

