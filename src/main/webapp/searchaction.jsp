<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="product.Product" %>
<%@ page import="product.ProductDAO" %>
<%@ page import="java.util.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<center>
	<table width="400" border="1" cellpadding="0" cellspacing="0">
		<tr height="100">
			<td align="center"colspan="3">
					<font size="7" color="gray">전체 상품 보기</font>
			</td>
		</tr>
		</table>
		</center>
		

<%

ProductDAO pdao = new ProductDAO();
Vector<Product> v = pdao.getAllProduct();

int j=0;
for(int i=0; i<v.size(); i++){
	Product bean = v.get(i);
	if(j%3==0){
%>
<tr height="220">

<%
	}
%>

<td width="333" align="center">
<a href="main.jsp?center=ProductInfo.jsp?no=<%=bean.getNo()%>">
<img alt="" src="image/<%=bean.getImg()%>" width="300" height="200">
</a><p>
<font size="3" color="gray"> <b>상품명 <%=bean.getName() %></b></font></p></td>

<%
j=j+1;
}
%>
</body>
</html>