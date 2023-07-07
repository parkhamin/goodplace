<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

	<script src="/ajax/resources/js/httpRequest.js"></script>
	<!-- <script src="${pageContext.request.contextPath}/resources/js/httpRequest.js"></script> -->
	
	<script>
		function del(idx){
			//idx -> 삭제하고싶은 회원의 번호
			if( !confirm("정말로 선택한 회원을 추방하시겠습니까?") ){
				return;
			}
			
			let url = "admin_delete.do";
			let param = "idx=" + idx;
			sendRequest(url, param, resultFn, "GET");
		}
		
		//콜백메서드
		function resultFn(){
			
			if( xhr.readyState==4 && xhr.status == 200 ){
				
				let data = xhr.responseText;

				if( data == "1" ){
					alert("회원 추방 성공");
				}else{
					alert("회원 추방 실패");
				}
				
				location.href="admin_list.do";
				
			}
			
		}
	</script>

</head>
<body>
	<table border="1" align="center">
		<caption>회원 목록</caption>
		
		<tr>
			<th>회원번호</th>
			<th>아이디</th>
			<th>비밀번호</th>
			<th>이름</th>
			<th>성별</th>
			<th colspan="2">이메일</th>
			<th colspan="2">생일</th>
		</tr>
		
		<c:forEach var="vo" items="${ list }">
			<tr>
				<td>${vo.idx }</td>
				<td>${vo.id }</td>
				<td>${vo.pwd }</td>
				<td>${vo.name }</td>
				<td>${vo.gender }</td>
				<td>${vo.email }</td>
				<td>${vo.birth }</td>
				
				<td>
					<input type="button" value="추방하기" onclick="del('${vo.idx}')"/>
				</td>				
			</tr>
		</c:forEach>
		
	</table>
</body>
</html>



