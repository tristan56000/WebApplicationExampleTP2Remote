<%@ page import="java.util.regex.Pattern" %>
<%@ page import="fr.ensibs.files.Constants" %>
<%@ page import="fr.ensibs.files.Encryption" %>
<%@ page import="fr.ensibs.files.DatabaseConnection" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.Connection" %><%--
  Created by IntelliJ IDEA.
  User: trist
  Date: 23/03/2020
  Time: 21:57
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Insertion safe</title>
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

        String regexName = "([a-zA-Z])*";
        if(!Pattern.matches(regexName,nameForm)){
            throw new Exception("Regex error on the name in the form");
        }
        String regexPassword = "(.)*(<(.)*>){1,}(.)*";
        if(Pattern.matches(regexPassword,passwordForm)){
            throw new Exception("Regex error on the password in the form");
        }
        String regexInt = "[0-9]{1,}";
        if(!Pattern.matches(regexInt,salaryForm)){
            throw new Exception("Regex error on the salary in the form");
        }
        if(!Pattern.matches(regexInt,ageForm)){
            throw new Exception("Regex error on the age in the form");
        }
        if(!Pattern.matches(regexName,roleForm)){
            throw new Exception("Regex error on the role in the form");
        }


        if(connection == null || connection.isClosed()){
            connection = DatabaseConnection.getConnection();
        }
        String sqlStatement = "INSERT INTO "+db+"."+table+"(name,password,salary,age,role) values(?, ?, ?, ?, ?)";
        PreparedStatement preparedStatement = connection.prepareStatement(sqlStatement);
        preparedStatement.setString(1, nameForm);
        preparedStatement.setString(2,Encryption.hashPassword(passwordForm));
        preparedStatement.setInt(3, Integer.parseInt(salaryForm));
        preparedStatement.setInt(4, Integer.parseInt(ageForm));
        preparedStatement.setString(5,roleForm);
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