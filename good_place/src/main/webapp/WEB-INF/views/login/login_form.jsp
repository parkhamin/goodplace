<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	
<!-- <script src="${pageContext.request.contextPath}/resources/js/httpRequest.js"></script> -->
 	<script src="/session/resources/js/httpRequest.js"></script> 
	<script>
		function send(f){
			let id = f.id.value;
			let pwd = f.pwd.value;
			
			//유효성 체크
			if( id == '' ){
				alert('아이디를 입력하세요')
				return;
			}
			
			if( pwd == '' ){
				alert('비밀번호를 입력하세요')
				return;
			}
			
			f.action = "insert.do";
			f.submit();//전송

			let url = "login.do";
			let param = "id=" +f.id.value+"&pwd="+encodeURIComponent(f.pwd.value);
			
			//login.do?id=aaa&pwd=1111
			sendRequest(url, param, resFn, "post");
		}
		
		function resFn(){
			if( xhr.readyState==4 & xhr.status == 200 ){
				
				var data = xhr.responseText;

				//data를 JSON구조로 파싱
				let json = eval(data);
				
				//json = [{'res':'no_id'}]
				if( json[0].res == 'no_id' ){
					alert("아이디가 존재하지 않습니다");
					
				}else if( json[0].res == 'no_pwd' ){
					alert("비밀번호가 일치하지 않습니다");
					
				}else{
					location.href="clear.do";
				}
			}
		}
	</script>

</head>
<body>
	<form>
		<table border="1" align="center">
			<caption>로그인하기</caption>
			
			<tr>
				<th>아이디</th>
				<td><input name="id"></td>
			</tr>
			
			<tr>
				<th>비밀번호</th>
				<td><input name="pwd" type="password"></td>
			</tr>
			
			<tr>
				<td colspan="2" align="center">
					<input type="button" value="로그인" onclick="send(this.form)">
					<input type="reset" value="취소">
				</td>
			</tr>
			<tr>
				<th>회원가입</th>
				<td><input type="button" value="회원가입" onclick="location.href='signup_insert_form.do'">></td>
			</tr>
			
		</table>
	</form>
</body>
</html>