<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title></title>
    <meta name="layout" content="mobile"/>
</head>

<body>

<div data-role="page" id="availTeams">
    <div data-role="header">
        <h1>Find a Team</h1>
        <a data-role="button" href="#addTeam" data-icon="plus" data-iconpos="left"  data-ajax="false"
           class="ui-btn-left">Add Team</a>
    </div><!-- /header -->

    <div data-role="content">
        <ul data-role="listview">
            <g:each in="${teams}" var="team">
                <li><a href="${g.createLink(action: "joinTeam", id: team.id)}">${team.teamName}</a></li>
            </g:each>
        </ul>
    </div><!-- /content -->

    <div data-role="footer">
        <h4>&nbsp;</h4>
        <a data-role="button" href="#addTeam" data-icon="plus" data-iconpos="left"  data-ajax="false"
           class="ui-btn-left">Add Team</a>
    </div><!-- /footer -->
</div>

<div data-role="page" id="addTeam" data-ajax="false">
    <div data-role="header">
        <h1>Add a Team</h1>
    </div><!-- /header -->

    <div data-role="content">
        <g:form id="createTeamForm" action="addTeam" method="post">
            <label id="teamNameLbl" for="teamName">Team Name:</label>
            <input name="teamName" id="teamName" value="" type="text">
            <input name="eventId" value="${event.id}" type="hidden">
            <input value="Submit button" data-theme="b" type="submit">
        </g:form>
    </div><!-- /content -->

    <div data-role="footer">
        <h4>&nbsp;</h4>
        %{--<a data-role="button" href="#page1" data-icon="plus" data-iconpos="left"--}%
        %{--class="ui-btn-left">Add Team</a>--}%
    </div><!-- /footer -->
</div>

</body>
</html>