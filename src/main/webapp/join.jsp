<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width", initial-scale="1" >  <!-- 반응형 웹에 사용하는 메타태그 -->
<link rel="stylesheet" href="css/bootstrap.css">
<title>Insert title here</title>
<link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet" />
        <link href="css/styles.css" rel="stylesheet" />
</head>


<body>
<jsp:include page="/menu.jsp" flush="false"/>
<body>
<div class="container" align="center">
        <div class="col-lg-4"></div>
        <div class="col-lg-4">
            <div class ="jumbotron" style="padding-top:20px;">
                <form method = "post" action="joinAction.jsp">
                    <h3 style="text-align:center;">회원가입</h3>
                    <div class ="form-group">
                        <input type ="text" class="form-control" placeholder="아이디" name ="userID" maxlength='20'>
                    </div>
                    <br>
                    <div class ="form-group">
                        <input type ="password" class="form-control" placeholder="비밀번호" name ="userPassword" maxlength='20'>
                    </div>
                    <br>
                    <div class ="form-group">
                        <input type ="text" class="form-control" placeholder="이름" name ="userName" maxlength='20'>
                    </div>
                    <br>
                    <div class ="form-group">
                        <input type ="text" class="form-control" placeholder="전화번호" name ="userPhone" maxlength='20'>
                    </div>
                    <br>
                    <div class ="form-group">
                        <input type ="text" class="form-control" placeholder="이메일" name ="userEmail" maxlength='20'>
                    </div>
                    <br>
                    
                        <!-- <div class="d-flex-justify-content-end"> -->
                        <!-- <input type="text" name="address" class="form-control" placeholder="Enter Adress" required readonly/><br>
                        <button type="button" class="btn btn-info">주소 검색</button> -->
                        <jsp:include page="findAdress.jsp" flush="false"/>
                        </div>
                        <br>
                    </div>
                    <br>
                    <div class ="form-group" style="text-align: center;">
                        <div class="btn-group" data-toggle="buttons">
                            <label class="btn btn-primary active">
                                <input type="radio" name="userGender" autocomplete="off" value="남자" checked>남자
                            </label>
                            <label class="btn btn-primary">
                                <input type="radio" name="userGender" autocomplete="off" value="여자" checked>여자
                            </label>
                            </div>    
                    </div>
                    <br>                
                    <input type="submit" class="btn btn-primary form-control" value="회원가입">
                </form>
            </div> 
        </div> 
        <div class="col-lg-4"></div>
    </div> 
   
    <script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
    <script src="js/bootstrap.js"></script>
    <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
</body>
</html>