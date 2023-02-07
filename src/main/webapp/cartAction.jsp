<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="cart.*"%>
<%@page import="product.*"%>
<%@page import="user.*"%>
<%@ page import="java.sql.*" %>
<%@page import="java.util.*"%>
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
<%
request.setCharacterEncoding("UTF-8");
String userID = session.getAttribute("userID").toString();
String no = (String)session.getAttribute("no");
String newPrice = null;
int newQnt = 0;
int total = 0;
%>
<h3><%=userID %>님의 장바구니 입니다</h3>
<hr>
<%
Connection conn= null;
ResultSet rs = null;
PreparedStatement pstmt = null;

String dbURL = "jdbc:mysql://localhost:3306/SHOP?serverTimezone=UTC";
String dbID = "root";
String dbPassword = "Kjm0408^^";
Class.forName("com.mysql.cj.jdbc.Driver");

int count=0;
ArrayList<Cart> cartList = new ArrayList<>();
try{
	conn = DriverManager.getConnection(dbURL,dbID,dbPassword);
	String sql = "select userID,no,name,price,orderQnt,count(*) from cart where userID=? group by userID,no,name,price,orderQnt,no";
	/* String sql = "select * from cart where userID = ? order by num desc"; */
	pstmt = conn.prepareStatement(sql);
	pstmt.setString(1,userID);
	rs = pstmt.executeQuery();
	
while(rs.next()){
	Cart cart = new Cart();
	/* cart.setSeq(rs.getInt("seq")); */
	cart.setUserID(rs.getString("userID"));
	cart.setNo(rs.getString("no"));
	cart.setName(rs.getString("name"));
	cart.setPrice(rs.getString("price"));
	cart.setOrderQnt(rs.getInt("count(*)"));
	cartList.add(cart);
}
%>

<!-- cartList에 선택한 상품 담기 -->
<%for(int i=0; i<cartList.size(); i++){%>
	<%=cartList.get(i).getNo() %>
	<%=cartList.get(i).getName() %><br>
	<%newPrice = cartList.get(i).getPrice(); %>
	<%=newPrice %>원<br>
	<%newQnt = cartList.get(i).getOrderQnt(); %>
	<%=newQnt %>개
	<a href="<%= request.getContextPath()%>/purchase.jsp?no=<%= cartList.get(i).getNo() %>
	&name=<%= cartList.get(i).getName() %>
	&price=<%= cartList.get(i).getPrice() %>" style="float: right;">상품 구매</a><br>
	
	<a href="<%= request.getContextPath()%>/cancel.jsp?no=<%= cartList.get(i).getNo() %>" style="float: right;">상품 삭제</a><br><hr>
	<% total += newQnt * Integer.parseInt(newPrice); %>
	
<% }%>
총액 : <%=total%>원<br><br><br>
<%
rs.close();
pstmt.close();
conn.close();
}catch(SQLException e){
	e.printStackTrace();
	out.println("err"+e.toString());
}%>

<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<script src="js/bootstrap.js"></script>
</html>