<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter" %> 
<%@page import="user.UserDAO" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
 <%
 
 		request.setCharacterEncoding("utf-8");
        String userID = null;
        if(session.getAttribute("userID") != null )
        {
            userID = (String) session.getAttribute("userID");
        }
        if(userID == null)
        {
            PrintWriter script = response.getWriter();
            script.println("<script>");
            script.println("alert('로그인을 하세요')");
            script.println("location.href = 'login.jsp'");
            script.println("</script>");
                }
                else {
                	String productNo = request.getParameter("proNo");
                	String productCompany = request.getParameter("proCompany");
%>
 					<jsp:forward page="addCart.jsp">
					<jsp:param name = "proNo" value = "<%=productNo %>"/>
					<jsp:param name = "proCompany" value = "<%=productCompany %>"/>
					</jsp:forward>
<%                    
                    
                    }
%>
</body>
</html>