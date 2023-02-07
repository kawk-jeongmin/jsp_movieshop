<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width", initial-scale="1" >  <!-- 반응형 웹에 사용하는 메타태그 -->
<link rel="stylesheet" href="css/bootstrap.css">
<link rel="stylesheet" href="css/custom.css"> <!-- 참조  -->
<title>JSP 게시판 웹 사이트</title>
    </head>
    <body>
    
        <jsp:include page="/menu.jsp" flush="false"/>
        
        <header class="bg-dark py-5">
            <div class="container px-4 px-lg-5 my-5">
                <div class="text-center text-white">
                    <h1 class="display-4 fw-bolder">Movie shop</h1>
                    <p class="lead fw-normal text-white-50 mb-0">--</p>
                </div>
            </div>
        </header>
        
        <footer class="py-5 bg-dark">
            <div class="container"><p class="m-0 text-center text-white">Copyright &copy; movie shop</p></div>
        </footer>
        
        <!-- <a href="adminlogin.jsp">관리자 페이지</a> -->
        
        <script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
    <script src="js/bootstrap.js"></script>
    </body>
</html>
