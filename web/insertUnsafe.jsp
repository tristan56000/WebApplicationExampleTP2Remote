<%@ page import="fr.ensibs.files.Constants" %>
<%@ page import="fr.ensibs.files.Encryption" %>
<%@ page import="fr.ensibs.files.DatabaseConnection" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.PreparedStatement" %><%--
  Created by IntelliJ IDEA.
  User: trist
  Date: 23/03/2020
  Time: 21:57
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Insertion unsafe</title>
</head>
<body>
<br/>
<a href= "logout.jsp">Logout</a>
<%
    String db = Constants.database;
    String table = Constants.table;
    Connection connection = null;

    try {
        String nameForm = request.getParameter("name");
        String passwordForm = request.getParameter("password");
        String salaryForm = request.getParameter("salary");
        String ageForm = request.getParameter("age");
        String roleForm = request.getParameter("role");

        if(connection == null || connection.isClosed()){
            connection = DatabaseConnection.getConnection();
        }

        String sqlStatement = "INSERT INTO "+db+"."+table+"(name,password,salary,age,role) values(?, ?, ?, ?, ?)";
        PreparedStatement preparedStatement = connection.prepareStatement(sqlStatement);
        try{preparedStatement.setString(1,nameForm);}catch (Exception e){preparedStatement.setString(1,"");}
        try{preparedStatement.setString(2,Encryption.hashPassword(passwordForm));}catch (Exception e){preparedStatement.setString(2,"");}
        try{preparedStatement.setInt(3, Integer.parseInt(salaryForm));}catch (Exception e){preparedStatement.setInt(3,0);}
        try{preparedStatement.setInt(4, Integer.parseInt(ageForm));}catch (Exception e){preparedStatement.setInt(4,0);}
        try{preparedStatement.setString(5,roleForm);}catch (Exception e){preparedStatement.setString(5,"");}
        int result = preparedStatement.executeUpdate();
        preparedStatement.close();


        connection.close();
        %>
        <p>
            User created:<br/>
            Name:<%out.println(nameForm);%><br/>
            Password:<%out.println(passwordForm);%><br/>
            Salary:<%out.println(salaryForm);%><br/>
            Age:<%out.println(ageForm);%><br/>
            Role:<%out.println(roleForm);%><br/>
        </p>
        <%
    } catch (Exception e) {
        e.printStackTrace();
        response.sendRedirect("error.jsp");
    } finally {
        //response.sendRedirect("list.jsp");
    }
%>
</body>
</html>