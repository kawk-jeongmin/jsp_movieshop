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
<script>
function btn(){
    alert('배송이 시작됩니다');
}
</script>
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
	
	String SQL = "SELECT * FROM buy";
	rs = stmt.executeQuery(SQL);
%>
<div class="jumbotron">
		<div class="container">
			<h1 class="display-3">
				주문 상품 관리
			</h1>
		</div>
	</div>
	
	
<table border="1" cellspacing="0" align="center">
<tr>
<td>상품 번호</td>
<td>상품명</td>
<td>상품 가격</td>
<td>고객 아이디</td>
<td>고객 이름</td>
<td>고객 전회번호</td>
<td>고객 주소</td>
<td>배송</td>
</tr>
<%
while(rs.next()){
%><tr>
<td><%= rs.getString("no") %></td>
<td><%= rs.getString("name") %></td>
<td><%= rs.getString("price") %></td>
<td><%= rs.getString("userID") %></td>
<td><%= rs.getString("userName") %></td>
<td><%= rs.getString("userPhone") %></td>
<td><%= rs.getString("userAdress") %><%= rs.getString("userHousecode") %></td>
<td><button type="submit" onclick="javascript:btn()"> 배송시작 </button> </td>
<%-- <td><a href="<%= request.getContextPath()%>/editform.jsp?no=<%=rs.getString("no")%>">배송시작</a></td> --%>
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