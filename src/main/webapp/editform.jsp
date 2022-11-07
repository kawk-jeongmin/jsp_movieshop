<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">

<script type="text/javascript" src="./resources/js/validation.js"></script>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
String no = request.getParameter("no");
Connection conn = null;
PreparedStatement pstmt = null;
ResultSet rs = null;

Class.forName("com.mysql.cj.jdbc.Driver");
String dbno = null;
String dbname = null;
String dbcategory = null;
String dbprice = null;
String dbcompany = null;
String dbimg = null;
String dbinfo = null;

try{
	String dbURL = "jdbc:mysql://localhost:3306/SHOP?serverTimezone=UTC";
	String dbID = "root";
	String dbPassword = "Kjm0408^^";
	conn = DriverManager.getConnection(dbURL, dbID, dbPassword);   
	pstmt = conn.prepareStatement("SELECT * FROM product WHERE no=?");
	pstmt.setString(1,no);
	
	rs = pstmt.executeQuery();
	if(rs.next()){
		dbno = rs.getString("no");
		dbname = rs.getString("name");
		dbcategory = rs.getString("category");
		dbprice = rs.getString("price");
		dbcompany = rs.getString("company");
		dbimg = rs.getString("img");
		dbinfo = rs.getString("info");
	}
	}catch(SQLException ex){
		out.println(ex.getMessage());
		ex.printStackTrace();
	}finally{
		if(rs != null) try{rs.close();} catch(SQLException ex) {}
		if(pstmt != null) try{pstmt.close();} catch(SQLException ex) {}
		if(conn != null) try{conn.close();} catch(SQLException ex) {}
}
%>
<form action="edit.jsp" method="post">
<table border="1">
<tr>
<td>상품 번호</td>
<td><input type="hidden" name="no" size="20" value="<%=dbno %>"></td>
<tr>
<tr>
<td>상품 이름</td>
<td><input type="text" name="name" size="20" value="<%=dbname %>"></td>
<tr>
<tr>
<td>상품 분류</td>
<td><input type="text" name="category" size="20" value="<%=dbcategory %>"></td>
<tr>
<tr>
<td>상품 가격</td>
<td><input type="text" name="price" size="20" value="<%=dbprice %>"></td>
<tr>
<tr>
<td>상품 회사</td>
<td><input type="text" name="company" size="20" value="<%=dbcompany %>"></td>
<tr>
<tr>
<td>상품 이미지</td>
<td><input type="file" name="img" size="20" value="<%=dbimg %>"></td>
<tr>
<tr>
<td>상품 정보</td>
<td><input type="text" name="info" size="20" value="<%=dbinfo %>"></td>
<tr>
<tr>
<td><input type="submit" value="수정 완료"></td>
</tr>
</table>
</form>
</body>
</html>