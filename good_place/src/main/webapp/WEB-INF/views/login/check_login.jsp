<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
   
<!-- 로그인 여부를 판단하는 jsp -->
<!-- if( sessionScope.user == null) { code...} -->
<c:if test="${ empty sessionScope.user }">
	<script>
		alert("로그인 후 이용해주세요");
		location.href="list.do";
	</script>
</c:if>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	
</body>
</html>