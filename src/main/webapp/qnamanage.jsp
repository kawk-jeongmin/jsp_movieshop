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
	
	String SQL = "SELECT * FROM bbs";
	rs = stmt.executeQuery(SQL);
%>

<div class="jumbotron">
		<div class="container">
			<h1 class="display-3">
				문의사항 관리
			</h1>
		</div>
	</div>
	
	
<table border="1" cellspacing="0" align="center">
<tr>
<td>번호</td>
<td>고객 아이디</td>
<td>제목</td>
<td>내용</td>
<td>작성일</td>
<td>답글</td>
</tr>
<%
while(rs.next()){
%><tr>
<td><%= rs.getString("bbsID") %></td>
<td><%= rs.getString("userID") %></td>
<td><%= rs.getString("bbsTitle") %></td>
<td><%= rs.getString("bbsContent") %></td>
<td><%= rs.getString("bbsDate") %></td>
<td><button type="button" class="btn btn-sm btn-outline-secondary"
onclick="location.href='board.jsp?bbsID=<%=rs.getString("bbsID")%>'">글 보기</button></td>
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