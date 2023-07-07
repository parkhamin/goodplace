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

.rounded {
	width: 38px;
	height: 36px;
	border-radius: 50%;
	margin-top: 2px;
	margin-left: -15px;
	background-image: url("/goodplace/resources/img/star.gif");
}
</style>

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
	text-decoration: none;
}

a:hover {
	color: #000;
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


	<div id="cursor_div" class="cursor rounded"></div>

	<script>
	
	    const cursorRounded = document.querySelector('.rounded');
	    const moveCursor = (e) => {
	    	
		    const mouseY = e.clientY;
		    const mouseX = e.clientX;
		    cursorRounded.style.transform = `translate3d(${mouseX}px, ${mouseY}px, 0)`;
	   	 	console.log('${mouseX}px');
	    }
	    window.addEventListener('mousemove', moveCursor);

	</script>

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
					<a href="#">Good place</a>
				</h1>
			</div>
			<nav>
				<ul class="clearfix">
					<c:if test="${ not empty sessionScope.admin }">
						<li><a href="#" onclick="location.href = 'admin_list.do'">
								<img src="/goodplace/resources/img/admin_white.png"
								alt="관리자 아이콘">
						</a></li>
					</c:if>
					<li><img src="/goodplace/resources/img/share_white.png"
						onclick="copy_clip()" alt="공유 아이콘"></li>
					<c:choose>
						<c:when
							test="${ empty sessionScope.user and empty sessionScope.admin }">
							<li><a href="#" onclick="location.href = 'login_list.do'">
									<img src="/goodplace/resources/img/account_white.png"
									alt="로그인 아이콘">
							</a></li>
						</c:when>
						<c:otherwise>
							<li><a href="#" onclick="location.href = 'logout.do'"> <img
									src="/goodplace/resources/img/logout_white.png" alt="로그아웃 아이콘">
							</a></li>
						</c:otherwise>
					</c:choose>
					<li><a href="#" onclick="location.href = 'main.do'"> <img
							src="/goodplace/resources/img/home_white.png" alt="홈 아이콘">
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

	<script
		src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js"
		integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r"
		crossorigin="anonymous"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.min.js"
		integrity="sha384-fbbOQedDUMZZ5KreZpsbe1LCZPVmfTnH7ois6mU1QK+m14rQ1l2bGBq41eYeM/fS"
		crossorigin="anonymous"></script>
</body>
</html>