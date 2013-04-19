<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title></title>
    <meta name="layout" content="mobile"/>
</head>

<body>

<div data-role="page" id="addTeam" data-ajax="false">
    <div data-role="header">
        <h1>Add a Team</h1>
    </div><!-- /header -->

    <div data-role="content">
        <g:form id="createTeamForm" action="addTeamSave" method="post">
            <label id="teamNameLbl" for="teamName">Team Name:</label>
            <input name="teamName" id="teamName" value="" type="text">
            <input name="eventId" value="${event?.id}" type="hidden">
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