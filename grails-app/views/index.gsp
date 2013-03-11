<!DOCTYPE html>
<html>
<head>
    <title>RFB Pub Golf</title>
    <meta name="layout" content="bootstrap"/>
</head>

<body>
<g:render template="/navBar"/>

<div class="container">

    <div class="row">
        <div class="span10">
            <div class="hero-unit" style="padding: 15px;">
                <g:img uri="/images/PubGolfHeader.png"/>
                <h2>Pub Golf Challenge</h2>

                <p>Want to go on a golf outing without bringing your golf clubs? Then join us for an awesome bar crawl
                adventure with a golf twist.  The RFB Golf Challenge has two extremely strict requirements;
                you must wear your best golf-themed costume, and you must be able to drink.
                Now grab a friend, create team and earn points to win some awesome prizes.
                Check out the Rules & Scoring below. Thanks and drink em hard out there!</p>

                <p><strong>A golf outing with a drinking attitude!!</strong></p>

                <p><a href="${g.createLink(controller: "mobile")}"
                      class="btn btn-primary btn-large">Go Mobile &raquo;</a></p>
            </div>
        </div>
    </div>


    <!-- Example row of columns -->
    <div class="row">
        <div class="span5 offset1">
            <h2>Rules</h2>

            <p>Just like regular golf, pub golf has rules to play by! On each hole, each player must 'shoot' par by completing drinks.
            Failure to shoot par is a penalty.  Blowing chunks on the hole, penalty!</p>

            <p><a class="btn" href="${g.createLink(mapping: "rules")}">View Rules &raquo;</a></p>
        </div>

        <div class="span5">
            <h2>Scoring</h2>

            <p>Are all clubs created equal? Nope! Neither are drinks, the stronger the drink, the more it counts towards par.</p>

            <p><a class="btn" href="${g.createLink(mapping: "scoring")}">Scoring &raquo;</a></p>
        </div>
    </div>

</div> <!-- /container -->
</body>
</html>