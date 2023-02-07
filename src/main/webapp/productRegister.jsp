<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">

<script type="text/javascript" src="./resources/js/validation.js"></script>

<title>상품 등록</title>
</head>
<body>

	<div class="jumbotron">
		<div class="container">
			<h1 class="display-3">
				상품 등록
			</h1>
		</div>
	</div>
	
	<div class="container">
		
		
		<form method = "post" action="RegisterAction.jsp">
		
			
			<div class="form-group row">
				<label class="col-sm-2">상품 번호</label>
				<div class="com-sm-3">
					<input type ="text" class="form-control" placeholder="상품 번호" name ="no" maxlength='20'>
				</div>
			</div>
			
			<div class="form-group row">
				<label class="col-sm-2">상품 이름</label>
				<div class="com-sm-3">
					<input type ="text" class="form-control" placeholder="상품 이름" name ="name" maxlength='20'>
				</div>
			</div>
			
			<div class="form-group row">
				<label class="col-sm-2">분류</label>
				<div class="com-sm-3">
					<input type ="text" class="form-control" placeholder="분류" name ="category" maxlength='20'>
				</div>
			</div>
			
			<div class="form-group row">
				<label class="col-sm-2">가격</label>
				<div class="com-sm-3">
					<input type ="text" class="form-control" placeholder="가격" name ="price" maxlength='20'>
				</div>
			</div>
			
			<div class="form-group row">
				<label class="col-sm-2">회사</label>
				<div class="com-sm-3">
					<input type ="text" class="form-control" placeholder="회사" name ="company" maxlength='20'>
				</div>
			</div>
			
			<div class="form-group row">
				<label class="col-sm-2">상세 내용</label>
				<div class="com-sm-5">
					<input type ="text" class="form-control" placeholder="상세 내용" name ="info" maxlength='20'>
				</div>
			</div>
			
			<div class="form-group row">
				<label class="col-sm-2">상품 이미지</label>
				<div>
					<input type="file" name="img" class="form-control">
				</div>
			</div>
				
			<div class="form-group row">
				<div class="col-sm-offset-2 col-sm-10">
					<input type="submit" class="btn btn-primary" value="등록" onclick="CheckAddProduct()">
				</div>
			</div>
			
		</form>
	</div>
</body>
</html>