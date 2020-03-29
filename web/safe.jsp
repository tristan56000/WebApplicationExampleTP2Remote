<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="fr.ensibs.files.Constants" %>
<%@ page import="fr.ensibs.files.Encryption" %>
<%@ page import="fr.ensibs.files.DatabaseConnection" %><%--
  Created by IntelliJ IDEA.
  User: trist
  Date: 17/03/2020
  Time: 10:54
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Safe page</title>
</head>
<body>
<br/>
<a href= "logout.jsp">Logout</a>
<div class="info">
    <% String id = request.getParameter("user");
        String table = Constants.table;
        ResultSet resultSet1= null;
        Connection connection = null;
        try {
            if(connection == null || connection.isClosed()){
                connection = DatabaseConnection.getConnection();
            }
            String sqlStatement = "select * from "+table+" where id = ?";
            PreparedStatement preparedStatement = connection.prepareStatement(sqlStatement);
            preparedStatement.setInt(1,Integer.parseInt(id));
            resultSet1 = preparedStatement.executeQuery();

            while (resultSet1.next()){
                out.println("<div><a>Details :</a>" +
                        "<div><a>ID :"+ resultSet1.getString("id")+"</a></div>" +
                        "<div><a>Name :"+resultSet1.getString("name")+"</a></div>" +
                        "<div><a>Password :"+resultSet1.getString("password")+"</a></div>" +
                        "<div><a>Salary :"+resultSet1.getString("salary")+"</a></div>" +
                        "<div><a>Age :"+resultSet1.getString("age")+"</a></div>" +
                        "<div><a>Role :"+resultSet1.getString("role")+"</a></div>" +
                        "</div>");
            }
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("error.jsp");
        }%>
</div>
</body>
</html>