<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="user.UserDAO" %>
<%@ page import="java.io.PrintWriter" %> <!-- 자바스크립트 문장사용 -->
<% request.setCharacterEncoding("UTF-8"); %> <!-- 건너오는 모든 파일을 UTF-8로 -->
<jsp:useBean id="user" class="user.User" scope="page"/>
<jsp:setProperty name="user" property="userID" />
<jsp:setProperty name="user" property="userPassword" />
<jsp:setProperty name="user" property="userName" />
<jsp:setProperty name="user" property="userPhone" />
<jsp:setProperty name="user" property="userEmail" />
<jsp:setProperty name="user" property="userAdress" />
<jsp:setProperty name="user" property="userGender" />
<jsp:setProperty name="user" property="userHousecode" />
<jsp:setProperty name="user" property="userDetailAdress" />
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>회원 가입</title>
</head>
<body>
    <%
        if(user.getUserID() == null || user.getUserPassword() == null || user.getUserName() == null ||
        	user.getUserPhone() == null || user.getUserEmail() == null ||
            user.getUserAdress() == null || user.getUserGender() == null ||
            user.getUserHousecode() == null || user.getUserDetailAdress() == null) {
            PrintWriter script = response.getWriter();
            script.println("<script>");
            script.println("alert('입력이 안된 사항이 있습니다.')");
            script.println("history.back()");
            script.println("</script>");
    } else {
        UserDAO userDAO = new UserDAO();
        int result = userDAO.join(user);
            if(result == -1){
                PrintWriter script = response.getWriter();
                script.println("<script>");
                script.println("alert('이미 존재하는 아이디 입니다.')");
                script.println("history.back()");
                script.println("</script>");
            }
            else {
                session.setAttribute("userID", user.getUserID());
                PrintWriter script = response.getWriter();
                script.println("<script>");
                script.println("location.href= 'main.jsp'");
                script.println("</script>");
                }
        }
    %>
</body>
</html>