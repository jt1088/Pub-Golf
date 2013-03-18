<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title></title>
    <meta name="layout" content="mobile"/>
</head>

<body>
<div data-role="header">
    <h1>Pub Golf</h1>
    <a data-role="button" href="${g.createLink (action:"teams", id: team.event.id)}" data-icon="arrow-l" data-iconpos="left"
       class="ui-btn-left">
        Teams
    </a>
</div><!-- /header -->

<div data-role="content">
    <ul data-role="listview">
        <g:each in="${team?.player1ScoreCard?.holes}" var="p1Hole">
            <li data-role="list-divider">${p1Hole.eventHole.holeNumber} - ${p1Hole.eventHole.pub.name}</li>
            <li>
                <h3>${p1Hole.scoreCard.user.firstName} ${p1Hole.scoreCard.user.lastName}</h3>
                <p style="margin-left: 10px;"><strong>Score: </strong>${p1Hole.score}</p>
                <g:if test="${team.player2ScoreCard}">
                    <h3>${team?.player2ScoreCard?.holes?.find{it.eventHole == p1Hole.eventHole}?.scoreCard?.user?.firstName}
                        ${team.player2ScoreCard.holes.find{it.eventHole == p1Hole.eventHole}.scoreCard?.user?.lastName}</h3>
                </g:if>
                <g:else>
                    <h3>Unassigned</h3>
                </g:else>
                <p style="margin-left: 10px;"><strong>Score: </strong>${team?.player2ScoreCard?.holes?.find{it.holeNumber == p1Hole.holeNumber}?.score}</p>
            </li>
        </g:each>
    </ul>
</div><!-- /content -->

<div data-role="footer">
    <h3>&nbsp;</h3>
    <a data-role="button" href="${g.createLink (action:"teams", id: team.event.id)}" data-icon="arrow-l" data-iconpos="left"
       class="ui-btn-left">
        Teams
    </a>
</div><!-- /footer -->
</body>
</html>