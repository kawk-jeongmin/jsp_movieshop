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
String userID = request.getParameter("userID");
request.setCharacterEncoding("utf-8");
Connection conn = null;
PreparedStatement pstmt = null;
Class.forName("com.mysql.cj.jdbc.Driver");
try{
	String dbURL = "jdbc:mysql://localhost:3306/SHOP?serverTimezone=UTC";
	String dbID = "root";
	String dbPassword = "Kjm0408^^";
	conn = DriverManager.getConnection(dbURL, dbID, dbPassword);   
	pstmt = conn.prepareStatement("DELETE FROM user WHERE userID=?");
	pstmt.setString(1,userID);
	pstmt.executeUpdate();
}finally{
	if(pstmt != null) try{pstmt.close();} catch(SQLException ex) {}
	if(conn != null) try{pstmt.close();} catch(SQLException ex) {}
}
%>
</body>
</html>