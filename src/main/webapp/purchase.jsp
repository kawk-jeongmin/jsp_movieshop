<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.sql.*" %>
    <%@page import="java.util.*"%>
    <%@page import="product.*"%>
    <%@page import="user.*"%>
    <%@page import="cart.*"%>
<!DOCTYPE html>
<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width", initial-scale="1" >  <!-- 반응형 웹에 사용하는 메타태그 -->
<link rel="stylesheet" href="css/bootstrap.css">
<link rel="stylesheet" href="css/custom.css">
<title>Insert title here</title>
</head>
<body>
<jsp:include page="/menu.jsp" flush="false"/>
<script>
function btn(){
    alert('구매가 확정되었습니다');
}
</script>
<!-- <form action="buyAction.jsp"> -->

<%
String no = request.getParameter("no");
String name = request.getParameter("name");
String price = request.getParameter("price");
String userID = session.getAttribute("userID").toString();
Connection conn= null;
ResultSet rs = null;
PreparedStatement pstmt = null;

String dbURL = "jdbc:mysql://localhost:3306/SHOP?serverTimezone=UTC";
String dbID = "root";
String dbPassword = "Kjm0408^^";
Class.forName("com.mysql.cj.jdbc.Driver");

ArrayList<User> userList = new ArrayList<>();
try{
	conn = DriverManager.getConnection(dbURL,dbID,dbPassword);
	String sql = "select * from user where userID = ?";
	pstmt = conn.prepareStatement(sql);
	pstmt.setString(1,userID);
	rs = pstmt.executeQuery();
	
while(rs.next()){
	User user = new User();
	user.setUserID(rs.getString("userID"));
	user.setUserName(rs.getString("userName"));
	user.setUserPhone(rs.getString("userPhone"));
	user.setUserAdress(rs.getString("userAdress"));
	user.setUserHousecode(rs.getString("userHousecode"));
	user.setUserDetailAdress(rs.getString("userDetailAdress"));
	userList.add(user);
}
	%>
<h3>구매할 상품</h3><br>

상품 번호 : <%=no %><br>
상품명 : <%=name %><br>
상품 가격 : <%=price %><hr>

<h3>내 정보</h3><br>
<%for(int i=0; i<userList.size(); i++){ %>
이름 : <%=userList.get(i).getUserName() %><br>
전화번호 : <%=userList.get(i).getUserPhone() %><br>
주소 : <%=userList.get(i).getUserAdress() %>
<%=userList.get(i).getUserHousecode() %>
<%=userList.get(i).getUserDetailAdress() %><hr>

	<a href="<%= request.getContextPath()%>/buyAction.jsp?userID=<%= userList.get(i).getUserID() %>
	&userName=<%= userList.get(i).getUserName() %>
	&userPhone=<%= userList.get(i).getUserPhone() %>
	&userAdress=<%= userList.get(i).getUserAdress() %>
	&userHousecode=<%= userList.get(i).getUserHousecode() %>
	&userDetailAdress<%= userList.get(i).getUserDetailAdress() %>
	&no=<%= no %>
	&name=<%= name %>
	&price=<%= price %>" onclick="javascript:btn()" style="float: right;">상품 구매</a><br><hr>
<%} %>
<%
rs.close();
pstmt.close();
conn.close();

}catch(SQLException e){
	out.println("err"+e.toString());
}
%>

<%-- <h3>구매할 상품</h3><br>
상품 번호 : <%=no %><br>
상품명 : <%=name %><br>
상품 가격 : <%=price %><hr> --%>

<br><br>

<!-- <button type="submit" onclick="javascript:btn()"> 구매하기 </button> -->
<!-- </form> -->

					
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<script src="js/bootstrap.js"></script>
</body>
</html>