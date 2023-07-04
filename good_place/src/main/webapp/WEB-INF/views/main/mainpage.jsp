<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
 <style>
  @import url('https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap');

  body{background:#fff;
		font-family: 'Noto Sans KR', sans-serif;
		font-size:14px;
		color: #000000;;
		line-height:100%;
		font-weight:normal;
		padding:0px; margin:0px; 
		letter-spacing:0px;
		overflow-x:hidden;
        background-image: url("/goodplace/src/main/webapp/resources/img/bg.jpg");}
  html, body{width:100%; height:100%; letter-spacing:0px;}
  img{border:0; vertical-align:middle; outline:none; }
  a{text-decoration:none;}
  a:hover{color:#000; text-decoration:underline;}
  
  .clearfix::after{content:""; display:block; clear:both;}
  
  nav li{float:right;
        z-index: 1;}
  .icon{float:left;}

  .content{text-align:center;
  			margin-top:250px;
			font-size:36px;
			color:#ff0;}
  </style>
 </head>
 <body>
  	<div class="header">
		<header class="clearfix">
			<div class="icon">
				<h1><a href="#">Good place</a></h1>
			</div>
			<nav>
				<ul class="clearfix">
					<li><a href="#" onclick="location.href = 'admin_list.do'"><img src="/goodplace/src/main/webapp/resources/img/admin_white.png" alt="관리자 아이콘"></a></li>
					<li><a href="#" onclick="location.href = 'map.do'"><img src="/goodplace/src/main/webapp/resources/img/share_white.png" alt="공유 아이콘"></a></li>
					<li><a href="#" onclick="location.href = 'login_list.do'"><img src="/goodplace/src/main/webapp/resources/img/account_white.png" alt="로그인 아이콘"></a></li>
					<li><a href="#" onclick="location.href = 'main.do'"><img src="/goodplace/src/main/webapp/resources/img/home_white.png" alt="홈 아이콘"></a></li>
				</ul>
			</nav>
		</header>
	</div>
	<section>
		<div class="content"><a href="#" onclick="location.href = 'map.do'">START!!!</a></div>
	</section>
	<footer></footer>		
</body>
</html>