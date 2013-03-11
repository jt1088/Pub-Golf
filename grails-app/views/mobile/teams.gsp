<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title></title>
    <meta name="layout" content="mobile"/>
</head>

<body>
<div data-role="header">
    <h1>Pub Golf</h1>
    <a data-role="button" href="${g.createLink (action:"course", id: event.id)}" data-icon="arrow-l" data-iconpos="left"
       class="ui-btn-left">
        Score Card
    </a>
</div><!-- /header -->

<div data-role="content">
    <ul data-role="listview">
        <g:each in="${event.teams}" var="team">
            <li data-role="list-divider">${team.teamName}</li>
            <li><a href="${g.createLink (action:"teamScoreCard", id: team.id)}">
                <h3>${team.player1.firstName} ${team.player1.lastName}</h3>
                <p style="margin-left: 10px; "><strong>Holes Played:</strong> ${team.player1ScoreCard?.holesPlayed()} <strong>Score: </strong>${team.player1ScoreCard?.totalScore()}
                <strong>Over/Under: </strong>  ${team?.player1ScoreCard?.overUnder()}</p>

                <g:if test="${team?.player2}">
                    <h3>${team?.player2?.firstName} ${team?.player2?.lastName}</h3>
                    %{--<p style="margin-left: 10px;"><strong>Score: </strong>${team?.player2ScoreCard?.totalScore()}</p>--}%
                    <p style="margin-left: 10px;"><strong>Holes Played:</strong> ${team?.player2ScoreCard?.holesPlayed()} <strong>Score: </strong>${team.player2ScoreCard?.totalScore()}
                        <strong>Over/Under: </strong>  ${team?.player2ScoreCard?.overUnder()}</p>
                </g:if>
                <g:else>
                    <h3>Unassigned</h3>
                    <p style="margin-left: 10px;"><strong>Score: </strong>0</p>
                </g:else>
                </a>
            </li>
        </g:each>
    </ul>
</div><!-- /content -->

<div data-role="footer">
    <h3>&nbsp;</h3>
    <a data-role="button" href="${g.createLink (action:"course", id: event.id)}" data-icon="arrow-l" data-iconpos="left"
           class="ui-btn-left">
        Score Card
    </a>

</div><!-- /footer -->
</body>
</html>