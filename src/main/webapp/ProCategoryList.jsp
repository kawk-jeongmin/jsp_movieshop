<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="product.ProductDAO"%>
<%@ page import="product.Product"%>
<%@ page import ="java.util.Vector"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
		int Category = Integer.parseInt(request.getParameter("category"));
		String temp = "";
		if(Category == 1) temp= "포스터";
		else if(Category == 2) temp= "인형";
		else if(Category == 3) temp= "기타";
	%>
	
<center>
	<table width="1000" border ="1" bordercolor="gray">
		<tr height="100">
			<td align="center"colspan="3">
				<font size="7" color="gray"><%=temp%> 상품</font>
			</td>
		</tr>
		</table>
		</center>
		
		
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
	
	String SQL = "SELECT * FROM product where category=s";
	rs = stmt.executeQuery(SQL);
%>

<table border="1" cellspacing="0" align="center">
<tr>
<td>상품 번호</td>
<td>상품명</td>
<td>상품 분류</td>
<td>상품 가격</td>
<td>상품 회사</td>
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
<td>
<a href="<%= request.getContextPath() %> update.jsp?send_no=<%= rs.getString("no")%>">수정</a>
                    <!-- **수정버튼 클릭시 해당no값을 가지고 수정화면으로 이동 -->
</td>
<td>
<a href="<%= request.getContextPath() %> delete.jsp?send_no<%= rs.getString("no")%>">삭제</a>    
                    <!-- **삭제버튼 클릭시 해당no값의 모든정보를 삭제-->        
</td>
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
		
<%-- 		
		
	<% 
		ProductDAO pdao = new ProductDAO();
		Vector<Product> v = pdao.getCategoryProduct(Category);
		int j = 0;
		for(int i = 0; i < v.size();i++){
			Product bean = v.get(i);
			if(j%3==0){
			%>	
			
			
			<!-- <tr height="220"> -->
			<table width="1000" border ="1" bordercolor="gray">
		<tr height="100">
			<td align="center"colspan="3">
				
			</td>
		</tr>
		</table>
	<% 
			}
	%>
	
	
<td width="333" align="center">
<a href="main.jsp?center=ProductReserveInfo.jsp?no=<%=bean.getNo()%>">
<img alt="" src="image/<%=bean.getImg()%>" width="300" height="200">
</a><p>
<font size="3" color="gray"> <b>상품명 <%=bean.getName() %></b></font></p></td>

	<% 		
			j = j+1;
		}
 	%> --%>

</body>
</html>