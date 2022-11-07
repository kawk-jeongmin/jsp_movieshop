<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%
Calendar cal = Calendar.getInstance();
String format = "yyyy년 MM월 dd일";
SimpleDateFormat sdf = new SimpleDateFormat(format);
cal.add(cal.DATE, +1); //날짜를 하루 더한다.
String date = sdf.format(cal.getTime());
%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width", initial-scale="1" >  <!-- 반응형 웹에 사용하는 메타태그 -->
<link rel="stylesheet" href="css/bootstrap.css"> <!-- 참조  -->

        <title>movie shop</title>
        
        <link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet" />
        <link href="css/styles.css" rel="stylesheet" />
    </head>
    <body>
    <jsp:include page="/menu.jsp" flush="false"/>
    
    <div style="width:500px; height:700px; border:3px solid black; position: absolute; right: 150px; top: 100px;">
    <table border = "1">
    <div style="width:450px; height:400px; border:3px solid black; position: absolute; right: 20px; top: 250px;">
    <p>가격 : 10000원<br>
    예상 배송일 : 내일 (<%=date %>)<br>
    어쩌구 저쩌구 상품 정보<br>
    </table>
    </div>
    </div>
    <div style="width:500px; height:700px; border:3px solid black; position: relative; left: 150px; top: 44px;">상품 사진
    <img src="a.img" alt="영화 이미지">
    </div>
    
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
        <script src="js/scripts.js"></script>
</body>
</html>