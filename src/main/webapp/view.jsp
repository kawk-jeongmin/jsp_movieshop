<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>
<%@ page import="bbs.*" %>
<%@ page import="reply.*" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width", initial-scale="1" >  <!-- 반응형 웹에 사용하는 메타태그 -->
<link rel="stylesheet" href="css/bootstrap.css">
<link rel="stylesheet" href="css/custom.css">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width", initial-scale="1" >  <!-- 반응형 웹에 사용하는 메타태그 -->
<link rel="stylesheet" href="css/bootstrap.css">
<title>JSP 게시판 웹 사이트</title>
</head>
<body>
<jsp:include page="/menu.jsp" flush="false"/>
<%
    String userID = null; // 로그인이 된 사람들은 로그인정보를 담을 수 있도록한다
    if (session.getAttribute("userID") != null)
    {
        userID = (String)session.getAttribute("userID");
    }
    int bbsID = 0;
    if(request.getParameter("bbsID") != null){
    	bbsID = Integer.parseInt(request.getParameter("bbsID"));
    }
    if(bbsID==0){
    	PrintWriter script = response.getWriter();
        script.println("<script>");
        script.println("alert('유효하지 않은 글입니다.')");
        script.println("location.href = 'bbs.jsp'");
        script.println("</script>");
    }
    Bbs bbs = new BbsDAO().getBbs(bbsID);
%>
    
    <div class="container">
        <div class="row">
            <table class="table table-striped" style="text-align:center; border:1px solid #dddddd">
                <thead>
                    <tr>
                        <th colspan="3" style="background-color:#eeeeee; text-align:center;">문의사항 보기</th>
 
                    </tr>
                </thead>
                <tbody>
                    <tr>
                    <td style="width: 20%;">글 제목</td>
                    <td colspan="2"><%=bbs.getBbsTitle().replaceAll(" ","&nbsp;").replaceAll("<","&lt;").replaceAll(">","&gt;").replaceAll("\n", "<br>") %></td>
                    </tr>
                    <tr>
                    <td>작성자</td>
                    <td colspan="2"><%=bbs.getUserID()%></td>
                    </tr>
                     <tr>
                    <td>작성일자</td>
                    <td colspan="2"><%=bbs.getBbsDate().substring(0,11) + bbs.getBbsDate().substring(11, 13) + "시" 
                            + bbs.getBbsDate().substring(14,16) + "분" %></td>
                    </tr>
                    <tr>
                    <td>내용</td>
                    <td colspan="2" style="min-height: 200px; text-align: left;"><%=bbs.getBbsContent().replaceAll(" ","&nbsp;").replaceAll("<","&lt;").replaceAll(">","&gt;").replaceAll("\n", "<br>") %></td>
                    </tr>
                </tbody>
            </table>
            <a href="qna.jsp" class="btn btn-primary">목록</a>
        </div><br>
<jsp:include page="reply.jsp"></jsp:include>
</div>

<%
ReplyDAO replyDAO = new ReplyDAO();
List<Reply> replyList = null;
replyList = replyDAO.getReply(bbsID);
for(int i=0; i<replyList.size(); i++){
%>
<div class="container">
        <div class="row">
            <table class="table table-striped" style="text-align:center; border:1px solid #dddddd">
                <thead>
                    <tr>
                        <th colspan="3" style="background-color:#eeeeee; text-align:center;">관리자 답글 보기</th>
 
                    </tr>
                </thead>
                <tbody>
                    <tr>
                    <td>관리자 답글</td>
                    <td colspan="2"><%=replyList.get(i).getReplyContent()%></td>
                    </tr>
                     <tr>
                    <td>작성 일자</td>
                    <td colspan="2"><%=replyList.get(i).getReplyDate().substring(0,11) + bbs.getBbsDate().substring(11, 13) + "시" 
                            + bbs.getBbsDate().substring(14,16) + "분" %></td>
                    </tr>
                </tbody>
            </table> 
            </div>
            </div>
<%}%>

    <script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
    <script src="js/bootstrap.js"></script>
</body>
</html>
