<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width", initial-scale="1" >  <!-- 반응형 웹에 사용하는 메타태그 -->
<link rel="stylesheet" href="css/bootstrap.css">
<link rel="stylesheet" href="css/custom.css">
        <title>관리자 로그인</title>
</head>
<body>
<div class="container" align="center">
        <div class="col-lg-4"></div>
        <div class="col-lg-4">
            <div class ="jumbotron" style="padding-top:20px;">
                <form method = "post" action="adminloginAction.jsp">
                    <h3 style="text-align:center;">관리자 페이지 로그인</h3>
                    <div class ="form-group">
                        <input type ="text" class="form-control" placeholder="아이디" name ="adminID" maxlength='20'>
                    </div>
                    <br>
                    <div class ="form-group">
                        <input type ="password" class="form-control" placeholder="비밀번호" name ="adminPW" maxlength='20'>
                    </div>
                    <br>
                    <input type="submit" class="btn btn-primary form-control" value="로그인">
                </form>
            </div> 
        </div> 
        <div class="col-lg-4"></div>
    </div>
    
    <script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
    <script src="js/bootstrap.js"></script>
</body>
</html>