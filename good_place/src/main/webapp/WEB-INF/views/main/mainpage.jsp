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
		color:#111111;
		line-height:100%;
		font-weight:normal;
		padding:0px; margin:0px; 
		letter-spacing:0px;
		overflow-x:hidden;}
  html, body{width:100%; height:100%; letter-spacing:0px;}
  img{border:0; vertical-align:middle; outline:none;}
  a{text-decoration:none;}
  a:hover{color:#000; text-decoration:underline;}
  
  .clearfix::after{content:""; display:block; clear:both;}
  
  nav li{float:right;}
  .icon{float:left;}

  .content{text-align:center;
  			margin-top:250px;
			font-size:36px;
			color:#ff0;
			background-image: url( "img/bg.jpg" );}
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
					<li><a href="mainpage.jsp"><img src="img/home.png" alt="홈 아이콘"></a></li>
					<li><a href="login_form.jsp"><img src="img/count.png" alt="로그인 아이콘"></a></li>
					<li><a href="#"><img src="img/share.png" alt="공유 아이콘"></a></li>
				</ul>
			</nav>
		</header>
	</div>
	<section>
		<div class="content">START!!!</div>
	</section>
	<footer></footer>		
</body>
</html>