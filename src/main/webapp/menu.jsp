<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>movie shop</title>

        <link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet" />
        <link href="css/styles.css" rel="stylesheet" />
</head>
<body>
<%
    String userID = null;// 로그인이 된 사람들은 로그인정보를 담을 수 있도록한다
    if (session.getAttribute("userID") != null)
    {
        userID = (String)session.getAttribute("userID");
    }
%>
    <nav class="navbar navbar-expand-lg navbar-light bg-light">
    <div class="container-fluid">
    <a class="navbar-brand" href="main.jsp">movie shop</a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#collapsibleNavbar">
        <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse justify-content-between" id="collapsibleNavbar">
        <ul class="navbar-nav">
            <li class="nav-item">
                <a class="nav-link" href="zutopia.jsp">주토피아</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="toystory.jsp">토이스토리</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="avengers.jsp">어벤져스</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="jusul.jsp">주술회전</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="knife.jsp">귀멸의 칼날</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="harrypotter.jsp">해리포터</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="callme.jsp">콜미바이유어네임</a>
            </li>
        </ul>
        
         <%
         if(userID == null){
         %>
        <ul class="navbar-nav">
            <li class="nav-item">
                <a class="nav-link" href="login.jsp">로그인</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="join.jsp">회원가입</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="adminlogin.jsp">관리자</a>
            </li>
        <li class="nav-item">
        <form action="searchAction.jsp" method="post">
        <input type="text" name="search">
        <input type="button" value="검색">
        </form>
        </li>
        </ul>
        <%
         } else{
        %>
        <ul class="navbar-nav">
            <li class="nav-item">
                <a class="nav-link" href="logoutAction.jsp">로그아웃</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="memberoutAction.jsp">회원탈퇴</a>
            </li>
             <li class="nav-item">
                <a class="nav-link" href="cartAction.jsp">장바구니</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="myPage.jsp">마이페이지</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="qna.jsp">문의하기</a>
            </li>
        <li class="nav-item">
        <form action="searchAction.jsp" method="post">
        <input type="text" name="search">
        <input type="button" value="검색">
        </form>
        </li>
        </ul>
        <%
         }
        %>
    </div>
    </div>
</nav>
                        
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
        <script src="js/scripts.js"></script>
                        
</body>
</html>