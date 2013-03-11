<%--
  Created by IntelliJ IDEA.
  User: jt
  Date: 2/28/13
  Time: 9:48 AM
  To change this template use File | Settings | File Templates.
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title></title>
    <meta name="layout" content="mobile"/>
</head>

<body>
<div data-role="header">
    <a data-role="button" href="${g.createLink(action: "teams", id: team.event.id)}" data-icon="star"  data-ajax="false"
       data-iconpos="left"
       class="ui-btn-left">Score Board</a>
    <h1>Pub Golf</h1>
</div><!-- /header -->

<div data-role="content">
    <h2 style="margin-top: 5px; margin-bottom: 5px;">Team: ${team.teamName}</h2>

    <h3 style="margin-left: 10px; margin-bottom: 0; margin-top: 0;">${userScoreCard.user.firstName} ${userScoreCard.user.lastName} - ${userScoreCard.totalScore()}</h3>
    <p style="margin-left: 20px; margin-top: 0; margin-bottom: 15px; font-size: 75% "><strong>Holes Played:</strong> ${userScoreCard.holesPlayed()}
        <strong>Over/Under: </strong>  ${userScoreCard.overUnder()}</p>
    <g:if test="${partnerScoreCard}">
        <h3 style="margin-left: 10px; margin-bottom: 0; margin-top: 0;">${partnerScoreCard?.user?.firstName} ${partnerScoreCard?.user?.lastName} - ${partnerScoreCard?.totalScore()}</h3>
        <p style="margin-left: 20px; margin-top: 0; margin-bottom: 15px; font-size: 75%;"><strong>Holes Played:</strong> ${partnerScoreCard.holesPlayed()}
            <strong>Over/Under: </strong>  ${partnerScoreCard.overUnder()}</p>
    </g:if>
    <g:else>
        <h3 style="margin-left: 10px;">Unassigned - 0</h3>
    </g:else>
    <ul data-role="listview">
        <g:each in="${teamScoreCard}" var="hole">
            <li><a href="${g.createLink(action: "holeScore", id: hole.userScore.id)}" data-ajax="false">${hole.userScore.holeNumber + " " + hole.userScore.eventHole.pub.name}</a>

                <div style="margin-left: 15px;"><p>${hole.userScore?.scoreCard?.user?.firstName}: ${hole.userScore.score}
                ${hole.partnerScore?.scoreCard?.user?.firstName}: ${hole.partnerScore?.score}
                </p></div>
            </li>
        </g:each>
    </ul>
</div><!-- /content -->

<div data-role="footer">
    <h3></h3>
    <a data-role="button" href="${g.createLink(action: "teams", id: team.event.id)}" data-icon="star"  data-ajax="false"
       data-iconpos="left"
       class="ui-btn-left">Score Board</a>
    <a data-role="button" href="${g.createLink (uri: '/logout')}" data-icon="delete" data-iconpos="left"
       class="ui-btn-right">
        Logout
    </a>
</div><!-- /footer -->




</body>
</html>