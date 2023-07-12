<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<head>

<style>
@import
	url('https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap');

body {
	background: #fff;
	font-family: 'Noto Sans KR', sans-serif;
	font-size: 14px;
	color: #000000;;
	line-height: 100%;
	font-weight: normal;
	padding: 0px;
	margin: 0px;
	letter-spacing: 0px;
	overflow-x: hidden;
	background-image: url("/goodplace/resources/img/bg.jpg");
}

html, body {
	width: 100%;
	height: 100%;
	letter-spacing: 0px;
}

img {
	border: 0;
	vertical-align: middle;
	outline: none;
}

a {
  	color: white;
	text-decoration: none;
}

a:hover {
	color: yellow;
	text-decoration: underline;
}

.clearfix::after {
	content: "";
	display: block;
	clear: both;
}

nav li {
	float: right;
	z-index: 1;
	margin: 0 15px;
}

.icon {
	float: left;
}

.content {
	text-align: center;
	margin-top: 250px;
	font-size: 36px;
	color: #ff0;
}
</style>

</head>

<body>

	<div class="header">

		<script>

        function copy_clip(){
            window.navigator.clipboard.writeText("http://127.0.0.1:5500/Untitled-2.html").then(()=>{
                alert("복사 완료!!!");
            });
        }

    	</script>

		<header class="clearfix">
			<div class="icon">
				<h1>
					<a href="#">&nbsp;&nbsp;&nbsp;&nbsp;Good place</a>
				</h1>
			</div>
			<nav>
				<ul class="clearfix">
					<c:if test="${ not empty sessionScope.admin }">
						<li><a href="#" onclick="location.href = 'admin_list.do'">
								<img src="/goodplace/resources/img/admin_white.png"
								alt="관리자 아이콘">관리자
						</a></li>
					</c:if>
					<li><img src="/goodplace/resources/img/share_white.png"
						onclick="copy_clip()" alt="공유 아이콘"></li>
					<c:choose>
						<c:when
							test="${ empty sessionScope.user and empty sessionScope.admin }">
							<li><a href="#" onclick="location.href = 'login_list.do'">
									<img src="/goodplace/resources/img/account_white.png"
									alt="로그인 아이콘">로그인
							</a></li>
						</c:when>
						<c:otherwise>
							<li><a href="#" onclick="location.href = 'logout.do'"><img
									src="/goodplace/resources/img/logout_white.png" alt="로그아웃 아이콘">로그아웃
							</a></li>
						</c:otherwise>
					</c:choose>
					<li><a href="#" onclick="location.href = 'main.do'"> <img
							src="/goodplace/resources/img/home_white.png" alt="홈 아이콘">홈
					</a></li>
				</ul>
			</nav>
		</header>
	</div>
	
	<section>
		<div class="content">
			<a href="#" onclick="location.href = 'map.do'">START!!!</a>
		</div>
	</section>
	
	<footer></footer>

</body>
</html>