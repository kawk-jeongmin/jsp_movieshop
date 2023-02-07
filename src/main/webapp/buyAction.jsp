<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.util.*"%>
<%@ page import="java.sql.*" %>
<%@page import="buy.*"%>
<%@ page import="java.io.PrintWriter" %> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
request.setCharacterEncoding("utf-8");
String userID = request.getParameter("userID");
String userName = request.getParameter("userName");
String userPhone = request.getParameter("userPhone");
String userAdress = request.getParameter("userAdress");
String userHousecode = request.getParameter("userHousecode");
String userDetailAdress = request.getParameter("userDetailAdress");
String no = request.getParameter("no");
String name = request.getParameter("name");
String price = request.getParameter("price");
%>
<%
Connection conn = null;
ResultSet rs = null;
PreparedStatement pstmt = null;

String dbURL = "jdbc:mysql://localhost:3306/SHOP?serverTimezone=UTC";
String dbID = "root";
String dbPassword = "Kjm0408^^";
Class.forName("com.mysql.cj.jdbc.Driver");

try{
	conn = DriverManager.getConnection(dbURL, dbID, dbPassword); 
	String sql = "insert into buy values(?, ?, ?, ?, ?, ?, ?, ?, ?)";   
	pstmt = conn.prepareStatement(sql);
	pstmt.setString(1, userID);
	pstmt.setString(2, userName);
	pstmt.setString(3, userPhone);
	pstmt.setString(4, userAdress);
	pstmt.setString(5, userHousecode);
	pstmt.setString(6, userDetailAdress);
	pstmt.setString(7, no);
	pstmt.setString(8, name);
	pstmt.setString(9, price);
	pstmt.executeUpdate();
}catch(SQLException e){
	out.println("err"+e.toString());
}
%> 
<jsp:forward page="purchase.jsp"/>
</body>
</html>