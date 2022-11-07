<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form method="post" align="right">
	<select name="sort">
	<option value="1">가격</option>
	<option value="2">분류</option>
	<option value="3">회사</option>
	</select>
	<input type="submit" class="btn btn-primary" value="검색">
	</form>
	
	<%
	int page = 10;
	int totalPage = bdcnt/page;
	if(bdcnt%page>0){
		++totalPage;
	}
	%>
</body>
</html>