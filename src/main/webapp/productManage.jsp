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
Statement stmt = null;
Connection conn = null;
ResultSet rs = null;

String dbURL = "jdbc:mysql://localhost:3306/SHOP?serverTimezone=UTC";
String dbID = "root";
String dbPassword = "Kjm0408^^";
Class.forName("com.mysql.cj.jdbc.Driver");

try{
	conn = DriverManager.getConnection(dbURL, dbID, dbPassword);    
	stmt = conn.createStatement();
	
	String SQL = "SELECT * FROM product";
	rs = stmt.executeQuery(SQL);
%>

<div class="jumbotron">
		<div class="container">
			<h1 class="display-3">
				상품 관리
			</h1>
		</div>
	</div>
	
	<form method="post" align="right">
	<select name="sort">
	<option value="1">가격</option>
	<option value="2">분류</option>
	<option value="3">회사</option>
	</select>
	<input type="submit" class="btn btn-primary" value="검색">
	</form>
<table border="1" cellspacing="0" align="center">
<tr>
<td>상품 번호</td>
<td>상품명</td>
<td>상품 분류</td>
<td>상품 가격</td>
<td>상품 회사</td>
<td>상품 수량</td>
<td>상품 이미지</td>
<td>상품 상세 정보</td>
<td>상품 수정</td>
<td>상품 삭제</td>
</tr>
<%
while(rs.next()){
%><tr>
<td><%= rs.getString("no") %></td>
<td><%= rs.getString("name") %></td>
<td><%= rs.getString("category") %></td>
<td><%= rs.getString("price") %></td>
<td><%= rs.getString("company") %></td>
<td><%= rs.getString("img") %></td>
<td><%= rs.getString("info") %></td>
<td><a href="<%= request.getContextPath()%>/editform.jsp?no=<%=rs.getString("no")%>">수정</a></td>
<td><a href="<%= request.getContextPath()%>/delete.jsp?no=<%=rs.getString("no")%>">삭제</a></td>
</tr>
<%
}
%>
</table>
<%
rs.close();
stmt.close();
conn.close();

}catch(SQLException e){
	out.println("err"+e.toString());
}
%>
</body>
</html>