<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="admin.AdminDAO"%>
<%@ page import="java.io.PrintWriter"%>
<% request.setCharacterEncoding("UTF-8"); %>

<jsp:useBean id="admin" class="admin.Admin" scope="page"></jsp:useBean> 
<jsp:setProperty name="admin" property="adminID" />
<jsp:setProperty name="admin" property="adminPW" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" content="text/html; charset=UTF-8">
<title>관리자 로그인</title>
</head>
<body>

<%
        AdminDAO adminDAO = new AdminDAO();
        int result = adminDAO.adminlogin(admin.getAdminID(), admin.getAdminPW());
        if (result == 1){
            session.setAttribute("adminID",admin.getAdminID()); 
            PrintWriter script = response.getWriter();
            script.println("<script>");
            script.println("location.href = 'adminmenu.jsp'");
            script.println("</script>");
        } 
        else if (result == 0){
            PrintWriter script = response.getWriter();
            script.println("<script>");
            script.println("alert('비밀번호가 틀립니다.')");
            script.println("history.back()");    // 이전 페이지로 사용자를 보냄
            script.println("</script>");
        }
        else if (result == -1){
            PrintWriter script = response.getWriter();
            script.println("<script>");
            script.println("alert('존재하지 않는 아이디입니다.')");
            script.println("history.back()");    // 이전 페이지로 사용자를 보냄
            script.println("</script>");
        }
        else if (result == -2){
            PrintWriter script = response.getWriter();
            script.println("<script>");
            script.println("alert('DB 오류가 발생했습니다.')");
            script.println("history.back()");    // 이전 페이지로 사용자를 보냄
            script.println("</script>");
        }
        %>
</body>
</html>