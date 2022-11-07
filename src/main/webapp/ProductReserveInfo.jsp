<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="product.ProductDAO"%>
<%@ page import="product.Product"%>
<%@ page import ="java.util.Vector"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<% 
		int no = Integer.parseInt(request.getParameter("no"));
	
		//데이터 베이스에 접근
		ProductDAO pdao  = new ProductDAO();
		
		//렌트카 하나에 대한 정보를 얻어옴 
		Product bean = pdao.getOneProduct(no);

		
		int Category = bean.getCategory();
		String temp ="";
		if(Category == 1) temp= "포스터";
		else if(Category == 2) temp= "인형";
		else if(Category == 3) temp= "기타";
	%>
	
	<center>
	<form action = "RentcarMain.jsp?center=ProductOptionSelect.jsp" method="post">
		<table width="1000">
			<tr height="100">
				<td align="center"colspan="3">
					<font size="7" color="gray"><%=bean.getName() %> 상품 선택</font>
				</td>
			</tr>
			
			<tr height="100">
				<td rowspan="6" width="500">
					<img alt = "" src="images/<%=bean.getImg()%>" width="450">	
				</td>
				<td width="250" align="center">상품 이름</td>
				<td width="250" align="center"><%=bean.getName()%></td>
			</tr>	
				
			<tr>
				<td width="250" align="center">상품 수량</td>
				<td width="250" align="center">
					<select name="qty">
						<option value ="1">1</option>
						<option value ="2">2</option>
						<option value ="3">3</option>
					</select>
				</td>
			</tr>	
			
			<tr>
				<td width="250" align="center">상품 분류</td>
				<td width="250" align="center"><%=temp%></td>
				</td>
			</tr>	
			
			
			
			<tr>
				<td width="250" align="center">상품 회사</td>
				<td width="250" align="center"><%=bean.getCompany()%></td>
				</td>
			</tr>	
			
			<tr>
				<td colspan="2" align="center">
					<input type = "hidden" name="no" value="<%=bean.getNo()%>">
					<input type = "hidden" name="img" value="<%=bean.getImg()%>">
					<input type="submit" value="옵션 선택 후 구매하기">
				</td>
			</tr>	
		</table>
			<br><br><br>
			<font size="5" color="gray"> 상품 정보 보기</font>
			<p>
			<%=bean.getInfo()%>
	</form>
</center>
</body>
</html>