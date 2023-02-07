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
request.setCharacterEncoding("utf-8");
Connection conn = null;
PreparedStatement pstmt = null;

String no = request.getParameter("no");
String name = request.getParameter("name");
String category = request.getParameter("category");
String price = request.getParameter("price");
String company = request.getParameter("company");
int amount = Integer.parseInt(request.getParameter("amount"));
String img = request.getParameter("img");
String info = request.getParameter("info");


Class.forName("com.mysql.cj.jdbc.Driver");

try{
	String dbURL = "jdbc:mysql://localhost:3306/SHOP?serverTimezone=UTC";
	String dbID = "root";
	String dbPassword = "Kjm0408^^";
	
	conn = DriverManager.getConnection(dbURL, dbID, dbPassword);   
	pstmt = conn.prepareStatement("UPDATE product SET name=?, category=?, price=?, company=?, amount=?, img=?, info=? WHERE no=?");
	
	pstmt.setString(1,name);
	pstmt.setString(2,category);
	pstmt.setString(3,price);
	pstmt.setString(4,company);
	pstmt.setInt(5,amount);
	pstmt.setString(6,img);
	pstmt.setString(7,info);
	pstmt.setString(8,no);
	
	pstmt.executeUpdate();
	%>
	<jsp:forward page="productManage.jsp"></jsp:forward>>
	<%
}finally{
	if(pstmt != null) try{pstmt.close();} catch(SQLException ex) {}
	if(conn != null) try{pstmt.close();} catch(SQLException ex) {}
}
%>
</body>
</html>