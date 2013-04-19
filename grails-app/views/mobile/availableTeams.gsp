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
        <a data-role="button" href="${g.createLink(action: "addTeam", id: event.id)}" data-icon="plus" data-iconpos="left"  data-ajax="false"
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
        <a data-role="button" href="${g.createLink(action: "addTeam", id: event.id)}" data-icon="plus" data-iconpos="left"  data-ajax="false"
           class="ui-btn-left">Add Team</a>
    </div><!-- /footer -->
</div>

</body>
</html>