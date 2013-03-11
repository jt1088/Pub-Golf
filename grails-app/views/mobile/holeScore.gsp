<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title></title>
    <meta name="layout" content="mobile"/>
    <style type="text/css">
    h4 {
        margin-top: 5px;
        margin-bottom: 0;
    }

    p {
        margin-top: 5px;
        margin-bottom: 0;
    }

    .ui-content {
        padding-top: 5px;
    }
    </style>
</head>

<body>
<div data-role="page" id="page1">
    <div data-theme="a" data-role="header">
        <div data-role="navbar" data-iconpos="left">
            <ul>
                <li>
                    <a href="${g.createLink(action: "course", id: holeScore.eventHole.event.id)}" data-transition="fade" data-theme="a" data-icon="arrow-l" data-ajax="false">
                        Back
                    </a>
                </li>
                <li>
                    <a href="#rules" data-transition="fade" data-theme="a" data-icon="gear" data-ajax="false">
                        Rules
                    </a>
                </li>
                <li>
                    <a href="#scoring" data-transition="fade" data-theme="a" data-icon="check" data-ajax="false">
                        Scoring
                    </a>
                </li>
            </ul>
        </div>

        %{--<h3>--}%
            %{--Enter Score--}%
        %{--</h3>--}%
    </div>

    <div data-role="content">
        <h4 style="margin-top: 0;">Golfer: ${user.firstName} ${user.lastName}</h4>
        <h4>Hole: ${holeScore.eventHole.pub.name}</h4>
        <h4>Par: ${holeScore.eventHole.par}</h4>

        <p><strong>Water Hazard?</strong> ${waterString} &nbsp; <strong>Bunker?</strong> ${bunkerString}</p>
        <g:form action="saveScore">
        %{--<div data-role="fieldcontain">--}%
        %{--<fieldset data-role="controlgroup">--}%
            <div style="margin-top: 0; margin-bottom: 0" data-role="fieldcontain">
                <label for="score">Score:</label>

                <input name="score" id="score" placeholder="" value="${holeScore.score}"
                       type="number" maxlength="2" size="2" autofocus="true" data-mini="true">
                <input type="hidden" value="${holeScore.id}" name="holeScoreId"/>
            </div>
        %{--</fieldset>--}%
        %{--</div>--}%
            <input value="Save" data-theme="b" type="submit">
        </g:form>

        <div style="width: 150px; height: 150px; position: relative; ">
            <img src="${g.createLink(uri: '/images/RFBGolfBall150x150.png')}" alt="image"
                 style="position: absolute; top: 5%; left: 10%; margin-left: 50px; margin-top: -18px">
        </div>

    </div>

    <div data-theme="a" data-role="footer" data-position="fixed">
        <h3>&nbsp;</h3>

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
        <a data-role="button" href="#page1" data-icon="arrow-l" data-iconpos="left"
           class="ui-btn-left">Back</a>
        <h1>Pub Golf - Rules</h1>
    </div><!-- /header -->

    <div data-role="content">
        <g:render template="/rules"/>
    </div><!-- /content -->

    <div data-role="footer">
        <a data-role="button" href="#page1" data-icon="arrow-l" data-iconpos="left"
           class="ui-btn-left">Back</a>
    <h3>&nbsp;</h3>
    </div><!-- /footer -->
</div><!-- /page -->

<div data-role="page" id="scoring">

    <div data-role="header">

        <a data-role="button" href="#page1" data-icon="arrow-l" data-iconpos="left"
           class="ui-btn-left">Back</a>
        <h1>Pub Golf - Scoring</h1>
    </div><!-- /header -->

    <div data-role="content">
        <g:render template="/scoring"/>
    </div><!-- /content -->

    <div data-role="footer">
        <a data-role="button" href="#page1" data-icon="arrow-l" data-iconpos="left"
           class="ui-btn-left">Back</a>
        <h3>&nbsp;</h3>
    </div><!-- /footer -->
</div><!-- /page -->

</body>
</html>