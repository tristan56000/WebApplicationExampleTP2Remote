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
    <title>Creation unsafe</title>
</head>
<body>
<br/>
<a href= "logout.jsp">Logout</a>
<form action="insertUnsafe.jsp" method="post" class="form-example">
    <div class="form-example">
        <label>Enter your name: </label>
        <input type="text" name="name"><br/>
        <label>Enter your password: </label>
        <input type="password" name="password"><br/>
        <label>Enter your salary: </label>
        <input type="text" name="salary"><br/>
        <label>Enter your age: </label>
        <input type="text" name="age"><br/>
        <label>Enter your role: </label>
        <input type="text" name="role"><br/>
        <input type="submit" value="Register">
    </div>
</form>

</body>
</html>