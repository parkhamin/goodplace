<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=IBM+Plex+Sans+KR:wght@300&family=Nanum+Brush+Script&display=swap"
	rel="stylesheet">

<style>
* {
	font-family: 'IBM Plex Sans KR', sans-serif;
	font-size: 30px;
	color: yellow;
	background: url("/goodplace/resources/img/bg.jpg");
}
#kakao img{width:105%;}
#naver img{width:25%;}

</style>

<!-- <script src="${pageContext.request.contextPath}/resources/js/httpRequest.js"></script> -->
<script src="/goodplace/resources/js/httpRequest.js"></script>
<script>
	function send(f) {
		let id = f.id.value;
		let pwd = f.pwd.value;

		//유효성 체크
		if (id == '') {
			alert('아이디를 입력하세요')
			return;
		}

		if (pwd == '') {
			alert('비밀번호를 입력하세요')
			return;
		}

		let url = "login.do";
		let param = "id=" + f.id.value + "&pwd="
				+ encodeURIComponent(f.pwd.value);
		//login.do?id=aaa&pwd=1111
		sendRequest(url, param, resFn, "post");
		alert("로그인에 성공하셨습니다");
	}

	function resFn() {
		if (xhr.readyState == 4 & xhr.status == 200) {

			var data = xhr.responseText;

			//data를 JSON구조로 파싱
			let json = eval(data);

			//json = [{'res':'no_id'}]
			if (json[0].res == 'no_id') {
				alert("아이디가 존재하지 않습니다");

			} else if (json[0].res == 'no_pwd') {
				alert("비밀번호가 일치하지 않습니다");

			} else {
				location.href = "main.do";
			}
		}
	}
</script>

<!-- 카카오 로그인 -->
<script type="text/javascript"
	src="https://developers.kakao.com/sdk/js/kakao.min.js" charset="utf-8"></script>
<script type="text/javascript">
	$(document).ready(function() {
		Kakao.init('53a6f26cc6fe1512c80966886411c412');
		Kakao.isInitialized();
	});

	function loginWithKakao() {
		Kakao.Auth.authorize({
			redirectUri : 'http://localhost:9090/goodplace/kakao_callback'
		}); // 등록한 리다이렉트uri 입력
	}
</script>


</head>
<body>
	<form>
		<table border="1" align="center">
			<caption>로그인하기</caption>

			<tr>
				<th>아이디</th>
				<td><input name="id" placeholder="아이디를 입력해주세요"></td>
			</tr>

			<tr>
				<th>비밀번호</th>
				<td><input name="pwd" type="password"
					placeholder="비밀번호를 입력해주세요"></td>
			</tr>

			<tr>
				<td colspan="2" align="center"><input type="button" value="로그인"
					onclick="send(this.form)"> <input type="reset" value="취소"
					onclick="location.href='main.do'"></td>
			</tr>
			<tr>
				<th>회원가입</th>
				<td><input type="button" value="회원가입"
					onclick="location.href='signup_insert_form.do'"></td>
			</tr>

			<!-- 카카오 로그인 -->
			<tr>
				<td colspan="2" align="center">
					<button onclick="#">
						<a id="kakao" href="#"> <img
							src="/goodplace/resources/img/kakao_login.png">
						</a>
					</button>
				</td>
			</tr>
			<tr>
				<td colspan="2" align="center">
					<button onclick="#">
						<a id="naver" href="#"> <img
							src="/goodplace/resources/img/naver_login.png">
						</a>
					</button>
				</td>
			</tr>
		</table>
	</form>
</body>
</html>