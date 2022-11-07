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
<jsp:include page="/menu.jsp" flush="false"/>
    
    <div class="container" align="center">
        <div class="col-lg-4"></div>
        <div class="col-lg-4">
            <div class ="jumbotron" style="padding-top:20px;">
                <form method = "post" action="loginAction.jsp">
                    <h3 style="text-align:center;">로그인</h3>
                    <div class ="form-group">
                        <input type ="text" class="form-control" placeholder="아이디" name ="userID" maxlength='20'>
                    </div>
                    <br>
                    <div class ="form-group">
                        <input type ="password" class="form-control" placeholder="비밀번호" name ="userPassword" maxlength='20'>
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