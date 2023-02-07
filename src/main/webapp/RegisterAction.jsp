<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="product.ProductDAO" %>
<%@ page import="java.io.PrintWriter" %> <!-- 자바스크립트 문장사용 -->
<% request.setCharacterEncoding("UTF-8"); %>
<jsp:useBean id="product" class="product.Product" scope="page"/>
<jsp:setProperty name="product" property="no" />
<jsp:setProperty name="product" property="name" />
<jsp:setProperty name="product" property="category" />
<jsp:setProperty name="product" property="price" />
<jsp:setProperty name="product" property="company" />
<jsp:setProperty name="product" property="img" />
<jsp:setProperty name="product" property="info" />

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
 <%
        if(product.getNo() == null || product.getName() == null || product.getCategory() == null ||
        	product.getPrice() == null || product.getCompany() == null ||
           product.getImg() == null || product.getInfo() == null) { 
            PrintWriter script = response.getWriter();
            script.println("<script>");
            script.println("alert('입력이 안된 사항이 있습니다.')");
            script.println("history.back()");
            script.println("</script>");
    } else {
        ProductDAO productDAO = new ProductDAO();
        int result = productDAO.register(product);
            if(result == -1){
                PrintWriter script = response.getWriter();
                script.println("<script>");
                script.println("alert('이미 존재하는 상품 입니다.')");
                script.println("history.back()");
                script.println("</script>");
            }
            else {
                session.setAttribute("no", product.getNo());
                PrintWriter script = response.getWriter();
                script.println("<script>");
                script.println("location.href= 'productManage.jsp'");
                script.println("</script>");
                }
        }
    %>
</body>
</html>