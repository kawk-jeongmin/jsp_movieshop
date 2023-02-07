<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
Connection conn = null;

String url = "jdbc:mysql://localhost:3306/shop?serverTimezone=UTC";
String user = "root";
String password = "Kjm0408^^";

Class.forName("com.mysql.cj.jdbc.Driver");
conn = DriverManager.getConnection(url,user,password);
%>
</body>
</html>