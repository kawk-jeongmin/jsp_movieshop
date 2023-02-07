<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.util.*"%>
<%@ page import="java.sql.*" %>
<%@page import="cart.*"%>
<%@page import="product.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
int seq = 0;
String productCompany = request.getParameter("proCompany");
String productNo = request.getParameter("proNo");
String productName = null;
String productPrice = null;
int productOrderQnt = 0;
String userID = (String)session.getAttribute("userID");
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
	String SQL1 = "select * from product where no = ?";
	conn = DriverManager.getConnection(dbURL, dbID, dbPassword); 
	pstmt = conn.prepareStatement(SQL1);
	pstmt.setString(1, productNo);
	rs = pstmt.executeQuery();
	if(rs.next()){
		productName = rs.getString("name");
		productPrice = rs.getString("price");
		productOrderQnt = rs.getInt("orderQnt");
	}
	rs.close();
	pstmt.close();
	conn.close();
}catch(Exception e){
	out.println("err"+e.toString());
}
//1. product 에 맞는 정보들 select
try{
	conn = DriverManager.getConnection(dbURL, dbID, dbPassword); 
	String SQL2 = "insert into cart values(?, ?, ?, ?, ?, ?)";   
	pstmt = conn.prepareStatement(SQL2);
	pstmt.setInt(1, seq);
	pstmt.setString(2, userID);
	pstmt.setString(3, productNo);
	pstmt.setString(4, productName);
	pstmt.setString(5, productPrice);
	pstmt.setInt(6, productOrderQnt);
	pstmt.executeUpdate();
}catch(SQLException e){
	out.println("err"+e.toString());
}
%>

<%
request.setCharacterEncoding("utf-8");

%>
<script>alert("장바구니에 <%=productName%>가 추가되었습니다 ");</script>
<jsp:forward page="cartAction.jsp"/>

</body>
</html>