<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
    nav{ 
        width:200px; 
        background-color:#eee; 
        border-right:1px solid #ddd;

        position:fixed;
        height:100%
    }
    h1{ font-size:18px;  padding:20px; }
    .menu {}
    .menu li {}

    .menu li a {
        height:30px;
        line-height:30px;
        display:block;
        padding:0 20px;
        font-size:12px;
        color:#555;
    }
    .menu li a:hover { background-color:yellowgreen; color:white;}
</style>
</head>
<body>
<nav>
    <h1>관리자 페이지</h1> 
 	<ul class="menu">
        <li><a href="usermanage.jsp">회원관리</a></li>
        <li><a href="productRegister.jsp">상품등록</a></li>
        <li><a href="productManage.jsp">상품관리</a></li>
        <li><a href="qnamanage.jsp">문의</a></li>
        <li><a href="paymanage.jsp">결제처리</a></li>
        <li><a href="adminLogout.jsp">로그아웃</a></li>
    </ul>
</nav>
</body>
</html>