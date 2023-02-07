<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="reply.*" %>
<%@ page import="java.io.PrintWriter" %> <!-- 자바스크립트 문장사용 -->
<% request.setCharacterEncoding("UTF-8"); %> <!-- 건너오는 모든 파일을 UTF-8로 -->

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
<title>JSP게시판 웹사이트</title>
</head>
<body>
<!-- <script>
function btn(){
    alert('답글 작성이 완료되었습니다');
}
</script> -->
 <%
    String adminID = null; // 로그인이 된 사람들은 로그인정보를 담을 수 있도록한다
    if (session.getAttribute("adminID") != null)
    {
        adminID = (String)session.getAttribute("adminID");
    }
%>
<%
if(adminID != null){
%>
<%String bbsID = request.getParameter("bbsID");%>

<form method="post" action="replyAction.jsp">
<div class="form-group row">
				<label class="col-sm-2"><%=bbsID %>번 글에 관리자 답글</label>
				<div class="com-sm-3">
				<input type="hidden" name = "bbsID" value = "<%=bbsID %>">
				<input type ="text" style="width:1145px;height:200px;font-size:20px;" class="form-control" placeholder="답글을 입력하세요" name ="replyContent" maxlength='1000'><br>
			<input type="submit"  class="btn btn-primary pull-right" value="답글 남기기">
				</div>
				
			</div>
			</form>
<%} %>


<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
    <script src="js/bootstrap.js"></script>
</body>
</html> 

