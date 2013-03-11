<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title></title>
    <meta name="layout" content="mobile"/>
</head>

<body>
<div data-role="page" id="page1">
    <div data-theme="a" data-role="header">
        <h3>
            Enter Score
        </h3>
        <a data-role="button" href="${g.createLink(action: "course", id: holeScore.eventHole.event.id)}"
           data-icon="arrow-l" data-iconpos="left" data-ajax="false"
           class="ui-btn-left">Back</a>
    </div>

    <div data-role="content">
        <h4>Golfer: ${user.firstName} ${user.lastName}</h4>
        <h4>Hole: ${holeScore.eventHole.pub.name}</h4>
        <h4>Par: ${holeScore.eventHole.par}</h4>
        <p><strong>Water Hazard?</strong> ${waterString} &nbsp; <strong>Bunker?</strong> ${bunkerString}</p>
        <g:form action="saveScore">
        %{--<div data-role="fieldcontain">--}%
        %{--<fieldset data-role="controlgroup">--}%
            <label for="score">Score:</label>
            <input name="score" id="score" placeholder="" value="${holeScore.score}" type="number" maxlength="2">
            <input type="hidden" value="${holeScore.id}" name="holeScoreId"/>
        %{--</fieldset>--}%
        %{--</div>--}%
            <input value="Save" data-theme="b" type="submit">
        </g:form>
    </div>

    <div data-theme="a" data-role="footer" data-position="fixed">
        <h3>&nbsp;</h3>

        <a data-role="button" href="#pub" data-icon="info" data-iconpos="left" data-ajax="false"
           class="ui-btn-text">Pub Info</a>
        <a data-role="button" href="#rules" data-icon="info" data-iconpos="left" data-ajax="false"
           class="ui-btn-text">Rules</a>
        <a data-role="button" href="#scoring" data-icon="info" data-iconpos="left" data-ajax="false"
           class="ui-btn-text">Scoring</a>
        <a data-role="button" href="${g.createLink(action: "course", id: holeScore.eventHole.event.id)}"
           data-icon="arrow-l" data-iconpos="left" data-ajax="false"
           class="ui-btn-left">Back</a>
    </div>
</div>

<div data-role="page" id="pub">
    <div data-role="header">
        <h1>Pub Golf</h1>
        <a data-role="button" href="#page1" data-icon="arrow-l" data-iconpos="left"
           class="ui-btn-left">Back</a>
    </div><!-- /header -->

    <div data-role="content">
        <h2>${holeScore.eventHole.pub.name}</h2>
        <address>
            ${holeScore.eventHole.pub.address.address1}<br>
            ${holeScore.eventHole.pub.address.city}, ${holeScore.eventHole.pub.address.state.stateCode} ${holeScore.eventHole.pub.address.zip}<br>
        </address>

        <p>Location:</p>

        <img src="${g.createLink(base: 'https://maps.googleapis.com/maps/api',
                controller: 'staticmap',
                action: '',

                params: [center: "${holeScore.eventHole.pub.address.address1} ${holeScore.eventHole.pub.address.city}, ${holeScore.eventHole.pub.address.state.stateCode}",
                        zoom: 15, size: '288x200',
                        markers: "${holeScore.eventHole.pub.address.address1} ${holeScore.eventHole.pub.address.city}, ${holeScore.eventHole.pub.address.state.stateCode} ${holeScore.eventHole.pub.address.zip}",
                        sensor: false])}"
             height="200" width="288">
    </div><!-- /content -->

    <div data-role="footer">
        <h4>&nbsp;</h4>
        <a data-role="button" href="#page1" data-icon="arrow-l" data-iconpos="left"
           class="ui-btn-left">Back</a>
    </div><!-- /footer -->

</div>

<div data-role="page" id="rules">

    <div data-role="header">
        <h1>Pub Golf - Rules</h1>
    </div><!-- /header -->

    <div data-role="content">
        <g:render template="/rules"/>
    </div><!-- /content -->

    <div data-role="footer">
    <a data-role="button" href="#page1" data-icon="arrow-l" data-iconpos="left"
       class="ui-btn-left">Back</a>
    </div><!-- /footer -->
</div><!-- /page -->

<div data-role="page" id="scoring">

    <div data-role="header">
        <h1>Pub Golf - Scoring</h1>
    </div><!-- /header -->

    <div data-role="content">
        <g:render template="/scoring"/>
    </div><!-- /content -->

    <div data-role="footer">
        <a data-role="button" href="#page1" data-icon="arrow-l" data-iconpos="left"
           class="ui-btn-left">Back</a>
    </div><!-- /footer -->
</div><!-- /page -->

</body>
</html>