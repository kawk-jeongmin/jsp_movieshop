<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width", initial-scale="1" >  <!-- 반응형 웹에 사용하는 메타태그 -->
<link rel="stylesheet" href="css/bootstrap.css"> <!-- 참조  -->

        <title>movie shop</title>

        <link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet" />
        <link href="css/styles.css" rel="stylesheet" />
    </head>
    <body>
        <jsp:include page="/menu.jsp" flush="false"/>
        
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
	
	String SQL = "SELECT * FROM product WHERE company='콜미바이유어네임'";
	rs = stmt.executeQuery(SQL);
%>

<table border="1" cellspacing="0">
    
<%
while(rs.next()){
%>
<tr><th><%= rs.getString("img") %></th></tr>
<tr><td><%= rs.getString("name") %></td></tr>
<tr><td><%= rs.getString("price") +"원" %></td></tr>
<tr><td>
<input type="button" value="장바구니" onclick="location.href='cart.jsp'">
<input type="button" value="바로결제" onclick="location.href='purchase.jsp'">
</td></tr>
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