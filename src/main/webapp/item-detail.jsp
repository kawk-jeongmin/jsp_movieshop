<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>     
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<script type="text/javascript">
	function addCartBtn(){
		if (confirm("쇼핑카트에 담으시겠습니까?")){ //확인
			//javascript form submit
			document.getElementById("addCartForm").submit();
			//command:addcart가 전송되어 AddCartController가 실행됨
		} else { //취소
			return;
		}
	}
</script>

<c:set var="product" value="${requestScope.Product}"></c:set>


<table class="table table-hover table-bordered detailTable">
	<tr>
		<td>NO</td>
		<td>${Product.no}</td>
	</tr>
	<tr>
		<td>Name</td>
		<td>${Product.name}</td>
	</tr>
	<tr>
		<td>Price</td>
		<td>${Product.price}</td>
	</tr>
	
	<%-- 로그인 상태일 떄 '장바구니 담기' 기능 추가됨 --%>
	<c:if test="${sessionScope.User != null}">
	<tr>
		<td colspan="2" align="center">
		<form action="front" method="post" id="addCartForm">
			<input type="hidden" name="command" value="addcart">
			<%-- AddCartController에 보내줄 itemNo --%>
			<input type="hidden" name="itemNo" value="${requestScope.Product.no}">
			<input type="button" onclick="addCartBtn()" value="장바구니 담기">
		</form>
		</td>
	</tr>
	</c:if>
</table>
</body>
</html>