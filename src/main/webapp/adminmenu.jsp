<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<nav>
    <h1>관리자 페이지</h1> 
 	<ul class="menu">
        <li><a href="usermanage.jsp" target="iframe">회원관리</a></li>
        <li><a href="productRegister.jsp" target="iframe">상품등록</a></li>
        <li><a href="productManage.jsp" target="iframe">상품관리</a></li>
        <li><a href="qnamanage.jsp" target="iframe">문의</a></li>
        <li><a href="paymanage.jsp" target="iframe">결제처리</a></li>
        <li><a href="pointmanage.jsp" target="iframe">포인트</a></li>
    </ul>
</nav>
<style>
    nav{ 
        width:200px; 
        background-color:#eee; 
        border-right:1px solid #ddd;
        /* height:100% 그냥 적용 안됨. 부모개념이 있어야 채워질 수 있음 */

        position:fixed; /*공중에 떠서 공간을 차지하지 않음*/
        height:100% /*fixed를 해서 높이 100%가 가능해짐*/
    }
    h1{ font-size:18px;  padding:20px; }
    .menu {}
    .menu li {}

    /*메뉴*/
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
</body>
</html>