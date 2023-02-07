<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="reply.*" %>
<%@ page import="admin.*" %>
<%@ page import="java.io.PrintWriter" %> <!-- 자바스크립트 문장사용 -->
<% request.setCharacterEncoding("UTF-8"); %> <!-- 건너오는 모든 파일을 UTF-8로 -->
<jsp:useBean id="reply" class="reply.Reply" scope="page"/>
<jsp:setProperty name="reply" property="replyContent" />
<jsp:setProperty name="reply" property="bbsID" />
 
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>JSP게시판 웹사이트</title>
</head>
<body>
<%
String adminID = null;
int bbsID = 0;
// 로그인 된 사람은 회원가입페이지에 들어갈수 없다
if(session.getAttribute("adminID") != null )
{
    adminID = (String) session.getAttribute("adminID");
    bbsID =  Integer.parseInt(request.getParameter("bbsID"));
    
}

if(adminID == null)
{
    PrintWriter script = response.getWriter();
    script.println("<script>");
    script.println("alert('로그인을 하세요')");
    script.println("location.href = 'login.jsp'");
    script.println("</script>");
} else {
if(reply.getReplyContent() == null) {
    PrintWriter script = response.getWriter();
    script.println("<script>");
    script.println("alert('입력이 안된 사항이 있습니다.')");
    script.println("history.back()");
    script.println("</script>");
} else {
    ReplyDAO replyDAO = new ReplyDAO();
    int result = replyDAO.reply(reply.getReplyContent(), bbsID);
        if(result == -1){
            PrintWriter script = response.getWriter();
            script.println("<script>");
            script.println("alert('글쓰기에 실패했습니다.')");
            script.println("history.back()");
            script.println("</script>");
        }
        else {
            PrintWriter script = response.getWriter();
            script.println("<script>");
            script.println("location.href= 'qnamanage.jsp'");
            script.println("</script>");
            }
    }
}
%>
        </body>
        </html>