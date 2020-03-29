<%--
  Created by IntelliJ IDEA.
  User: trist
  Date: 23/03/2020
  Time: 10:49
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Login Page</title>
</head>
<body>

<form name="loginForm" method="post" action="j_security_check">
    <table border = "0">
        <tr>
            <td>Login</td>
            <td><input type="text" name="j_username"></td>
        </tr>
        <tr>
            <td>Password</td>
            <td><input type="password" name="j_password"></td>
        </tr>
    </table>
    <input type="submit" value="Login">
</form>

</body>
</html>
