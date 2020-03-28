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
    String table = Constants.tableEncrypted;
    Connection connection = null;

    try {
        String nameForm = request.getParameter("name");
        String passwordForm = request.getParameter("password");
        String salaryForm = request.getParameter("salary");
        String ageForm = request.getParameter("age");

        if(connection == null || connection.isClosed()){
            connection = DatabaseConnection.getConnection();
        }

        String sqlStatement = "INSERT INTO "+db+"."+table+"(name,password,salary,age) values(?, ?, ?, ?)";
        PreparedStatement preparedStatement = connection.prepareStatement(sqlStatement);
        try{preparedStatement.setString(1,Encryption.encrypt(nameForm,Constants.AESKey));}catch (Exception e){preparedStatement.setString(1, Encryption.encrypt("",Constants.AESKey));}
        try{preparedStatement.setString(2,Encryption.encrypt(passwordForm,Constants.AESKey));}catch (Exception e){preparedStatement.setString(2,Encryption.encrypt("",Constants.AESKey));}
        try{preparedStatement.setString(3,Encryption.encrypt(salaryForm,Constants.AESKey));}catch (Exception e){preparedStatement.setString(3,Encryption.encrypt("0",Constants.AESKey));}
        try{preparedStatement.setString(4,Encryption.encrypt(ageForm,Constants.AESKey));}catch (Exception e){preparedStatement.setString(4,Encryption.encrypt("0",Constants.AESKey));}
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