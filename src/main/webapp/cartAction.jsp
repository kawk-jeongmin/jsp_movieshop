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
<<script type="text/javascript">
	function deleteItemBtn() {
		if(confirm("장바구니에서 해당 상품을 삭제하시겠습니까?")){
			//javascript form submit
			document.getElementById("deleteItemForm").submit();
			//command(deleteCart)와 itemNo(${item.itemNo})이 front로 제출된다.
		} else {
			return;
		}
	}
</script>

<c:choose>

	<c:when test="${empty sessionScope.User.cart.itemList}">
		장바구니에 담긴 상품이 없습니다.
	</c:when>
	
	<c:otherwise>
		<table class = "table table-hover table-bordered">
			<caption>  <h3> 장바구니 </h3> </caption>
			
			<thead>
				<tr>
					<th>번호</th>
					<th>이름</th>
					<th>가격</th>
					<th></th>
				</tr>
			</thead>
			
			<tbody>
			<c:forEach items="${sessionScope.User.cart.itemList}" var="item">
				<tr>
					<td>${item.no}</td>
					<td>${item.name}</td>
					<td>${item.price}</td>
					<td>
					<form action="front" method="POST" id="deleteItemForm">
						<input type="hidden" name="command" value="deleteCart">
						<input type="hidden" name="no" value="${item.no}">
						<input type="button" onclick="deleteItemBtn()" value="삭제">
					</form>
					</td>
				</tr>
			</c:forEach>
			<%-- 총 금액 
				: session에서 dto를 가져와서, 그 안에서 cart를 가져와서,
				  CartBean에 있는 totalPrice method를 이용
			--%>
			<%-- <tr>
				<td colspan="5" align="center">
					총 금액 : ${sessionScope.User.cart.totalPrice}
				</td>
			</tr> --%>
			</tbody>
		</table>
	</c:otherwise>
</c:choose>
</body>
</html>