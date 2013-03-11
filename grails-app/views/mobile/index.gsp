<%--
  Created by IntelliJ IDEA.
  User: jt
  Date: 2/28/13
  Time: 7:20 AM
  To change this template use File | Settings | File Templates.
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title></title>
    <meta name="layout" content="mobile"/>
</head>

<body>

<div data-role="page" id="login">

    <div data-role="header">
        <h1>Pub Golf</h1>
    </div><!-- /header -->

    <div data-role="content">
        <form action="${postUrl}" method="post" data-ajax="false">
            <label for="userName">User Name:</label>
            <input name="j_username" id="username" value="" type="text" autocorrect="off" autocapitalize="off">
            <label for="password">Password:</label>
            <input name="j_password" id="password" value="" type="password">
            <input value="Submit button" data-theme="b" type="submit">
        </form>

        <div style="width: 250px; height: 250px; position: relative; ">
            <img src="${g.createLink(uri: '/images/RFBLogo250.jpg')}" alt="image"
                 style="position: absolute; top: 5%; left: 10%; margin-left: -16px; margin-top: -18px">
        </div>
    </div><!-- /content -->

    <div data-role="footer">
        <a href="#createAccount" data-role="button" data-icon="plus" data-ajax="false">Create New Account</a>
    </div><!-- /footer -->
</div><!-- /page -->

<div data-role="page" id="createAccount">

    <div data-role="header">
        <h1>Pub Golf</h1>
    </div><!-- /header -->

    <div data-role="content">
        <g:form id="createAccount" action="createAccount" method="post">
            <label id="firstNameLbl" for="firstName">First Name:</label>
            <input name="firstName" id="firstName" value="" type="text">

            <label id="lastNameLbl" for="lastName">Last Name:</label>
            <input name="lastName" id="lastName" value="" type="text">

            <label id="userNameLbl" for="userNameId">User Name:</label>
            <input name="userName" id="userNameId" value="" type="text">

            <label id="passwordLbl" for="passwordId">Password:</label>
            <input name="password" id="passwordId" value="" type="password">

            <label id="passwordConfLbl" for="passwordConf">Conf Password:</label>
            <input name="passwordConf" id="passwordConf" value="" type="password">

        %{--<input name="_spring_security_remember_me" type="hidden" value="on"/>--}%
            <input value="Submit button" data-theme="b" type="submit">
        </g:form>
    </div><!-- /content -->

    <script type="text/javascript">
        $('#createAccount').submit(function () {
            var err = false;

            //clear highlighted fields
            var firstName = $('#firstName');
            firstName.removeClass('missing');
            var lastName = $('#lastName');
            lastName.removeClass('missing');
            var userName = $('#userNameId');
            userName.removeClass('missing');
            var password = $('#passwordId');
            password.removeClass('missing');
            var passwordConf = $('#passwordConf');
            passwordConf.removeClass('missing');

            var firstNameLbl = $('#firstNameLbl');
            firstNameLbl.removeClass('missing');
            var lastNameLbl = $('#lastNameLbl');
            lastNameLbl.removeClass('missing');
            var userNameLbl = $('#userNameLbl');
            userNameLbl.removeClass('missing');
            var passwordLbl = $('#passwordLbl');
            passwordLbl.removeClass('missing');
            var passwordConfLbl = $('#passwordConfLbl');
            passwordConfLbl.removeClass('missing');

            //field validation
            if (firstName.val() == null || firstName.val() == '') {
                firstNameLbl.addClass('missing');
                err = true;
            }

            if (lastName.val() == null || lastName.val() == '') {
                lastNameLbl.addClass('missing');
                err = true;
            }

            if (userName.val() == null || userName.val() == '') {
                console.log('asdfasdf');
                console.log(userName);

                userNameLbl.addClass('missing');
                err = true;
            }

            if (password.val() == null || password.val() == '') {
                passwordLbl.addClass('missing');
                err = true;
            }

            if (passwordConf.val() == null || passwordConf.val() == '') {
                passwordConfLbl.addClass('missing');
                err = true;
            }

            if (password.val() != passwordConf.val()) {
                passwordLbl.addClass('missing');
                passwordConfLbl.addClass('missing');
                err = true;
            }

            if (err == true) {
                return false;
            }

        });

    </script>

    <div data-role="footer">
        <a href="#login" data-role="button" data-icon="plus">Login</a>
    </div><!-- /footer -->
</div><!-- /page -->

</body>
</html>