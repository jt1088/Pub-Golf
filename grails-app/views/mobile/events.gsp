
<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title></title>
    <meta name="layout" content="mobile"/>
</head>

<body>
<div data-role="header">
    <h1>Pub Golf</h1>
</div><!-- /header -->

<div data-role="content">
    <ul data-role="listview">
        <g:each in="${events}" var="event">
         <li><a href="${g.createLink (action:"availableTeams", id: event.id)}" data-ajax="false">${event.name}</a></li>
        </g:each>
    </ul>
</div><!-- /content -->

<div data-role="footer">
    <h4>Page Footer</h4>
</div><!-- /footer -->
</body>
</html>