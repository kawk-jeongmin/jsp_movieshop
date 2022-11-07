<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
    String userID = null; // 로그인이 된 사람들은 로그인정보를 담을 수 있도록한다
    if (session.getAttribute("userID") != null)
    {
        userID = (String)session.getAttribute("userID");
    }
%>
<nav class="navbar navbar-expand-lg navbar-light bg-light">
            <div class="container px-4 px-lg-5">
                <a class="navbar-brand" href="main.jsp">Get Movie</a>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse"
                data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false"
                aria-label="Toggle navigation"><span class="navbar-toggler-icon"></span></button>
                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <ul class="navbar-nav me-auto mb-2 mb-lg-0 ms-lg-4">
                        
                        
                                <li><a class="dropdown-item" href="zutopia.jsp">주토피아</a></li>
                                <li><a class="dropdown-item" href="toystory.jsp">토이스토리</a></li>
                                <li><a class="dropdown-item" href="avengers.jsp">어벤져스</a></li>
                                <li><a class="dropdown-item" href="jusul.jsp">주술회전</a></li>
                                <li><a class="dropdown-item" href="knife.jsp">귀멸의 칼날</a></li>
                                <li><a class="dropdown-item" href="harrypotter.jsp">해리포터</a></li>
                                <li><a class="dropdown-item" href="callme.jsp">콜미바이유어네임</a></li>
                                <li><a class="dropdown-item" href="qna.jsp">문의하기</a></li>
                       <%
                       if(userID == null){
                       %>
                        <a class="navbar-brand"></a>
                       <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle" id="navbarDropdown" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">접속하기</a>
                            <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
                                <li><a class="dropdown-item" href="login.jsp">로그인</a></li>
                                <li><a class="dropdown-item" href="join.jsp">회원가입</a></li>
                                </ul>
                        </li>
                        <%
                       }else {
                        %>
                        <a class="navbar-brand"></a>
                       <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle" id="navbarDropdown" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">정보관리</a>
                            <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
                                <li><a class="dropdown-item" href="logoutAction.jsp">로그아웃</a></li>
                                <li><a class="dropdown-item" href="memberoutAction.jsp">회원탈퇴</a></li>
                                </ul>
                        </li>
                        <%
                       }
                        %>
                        <form method="post" action="ProCategoryList.jsp">
                        <select name="category">
                        <option value="1">포스터</option>
                        <option value="2">인형</option>
                        <option value="3">기타</option>
                        </select>&nbsp;&nbsp;
                        <input type="submit" class="btn btn-primary" value="검색">&nbsp;&nbsp;
                        </form>
                        
                        
                        <button type="button" class="btn btn-primary" onclick="location.href='searchaction.jsp'">전체 검색</button>	
                        
                        </div>
                        </div>
                        </nav>
                        
</body>
</html>