<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" content="text/html; charset=UTF-8">
<title>관리자 로그인</title>
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
	
	String SQL = "SELECT * FROM user";
	rs = stmt.executeQuery(SQL);
%>
<%-- <jsp:include page="adminmenu.jsp" flush="false"/> --%>
<div class="jumbotron">
		<div class="container">
			<h1 class="display-3">
				고객 관리
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
<td>고객 아이디</td>
<td>고객 비밀번호</td>
<td>고객 이름</td>
<td>고객 전화번호</td>
<td>고객 이메일</td>
<td>고객 주소</td>
<td>고객 우편 번호</td>
<td>고객 상세주소</td>
<td>고객 성별</td>
<td>탈퇴</td>
</tr>
<%
while(rs.next()){
%><tr>
<td><%= rs.getString("userID") %></td>
<td><%= rs.getString("userPassword") %></td>
<td><%= rs.getString("userName") %></td>
<td><%= rs.getString("userPhone") %></td>
<td><%= rs.getString("userEmail") %></td>
<td><%= rs.getString("userAdress") %></td>
<td><%= rs.getString("userHousecode") %></td>
<td><%= rs.getString("userDetailAdress") %></td>
<td><%= rs.getString("userGender") %></td>
<td><a href="<%= request.getContextPath()%>/userout.jsp?userID=<%=rs.getString("userID")%>">회원 강제 탈퇴</a></td>
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