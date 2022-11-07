<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<script type="text/javascript">
	//확인 누르면
	if (confirm("장바구니에 추가되었습니다!\n장바구니로 이동하시겠습니까?")) { 
		location.href = "${pageContext.request.contextPath}/front?command=cartview"	
	} else { // 취소 누르면
		location.href = "${pageContext.request.contextPath}/front?command=home"	
	}
</script>
</body>
</html>