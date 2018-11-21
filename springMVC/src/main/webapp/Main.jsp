<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메인화면</title>
<style>
	*{
		margin:0;
		padding:0;
		list-style: none;
	}
	#menu{
		width: 80%;
		margin: 0 auto;
	}
	.logo{
		width: 20%;
		float:left;
	}
	img{
		width:100%;
		overflow : hidden;
	}
	.menu{
		width:70%;
		float:left;
		margin: 0 auto;
	}
	nav{
		margin-top: 30px;
	}
	nav ul li{
		font : bold;
		float:left;
		padding-top: 5px;
		padding-bottom:5px;
		width: 25%;
		position: relative;
		text-align: center;
	}
	nav ul li:hover{
		background-color: #FF0000;
		color: white;
		cursor: pointer;
	}
	nav ul li:hover ul{
		display:block;
		background:#47C83E;
		color:white;
		cursor: pointer;
	}
	ul li ul{
		position: absolute;
		width:100%;
		display:none;
	}
	ul li ul li{
		width : 100%;
		text-align: center;
	}
	
	.clear{
		clear: both;
	}
	.LoginMenu{
		float:right;
	}
	#body{
		width:80%;
		margin: 0 auto;
	}	
	.background{
		width:100%;
	}
	.banner {
		position: relative; 
		width: 1000px; 
		height: 500px; 
		top: 50px; 
		margin:0 auto; 
		padding:0; 
		overflow: hidden;
	}
	.banner ul {
		position: absolute; 
		margin: 0px; 
		padding:0; 
		list-style: none;
	}
	.banner ul li {
		float: left; 
		width: 1000px; 
		height: 500px; 
		margin:0; 
		padding:0;
	}
	#MovieSelect{
		width:80%;
		margin: 0 auto;
	}
	.title{
		text-align: center;
	}
	.videoselect{
		width:80%;
		margin: 0 auto;
	}
	.video{
		float:left;
		width:60%;
		margin: 0 auto;
	}
	.explain{
		float:left;
		width: 40%;
		margin: 0 auto;
	}
	.poster{
		margin-left: 20px;
		height: 420px;
		width:80%;
	}
	footer{
		width: 100%;
		background-color: #ccc;
	}
	.footer{
		padding: 10px;
		width:100%;
		text-align: center;
	}
	.footer ul li{
		display: inline-block;
	}
	.footer3{
		width: 80%;
		margin:0 auto;
	}
	.footer1{
		margin-left: 80px;
		float:left;
		width: 60%;
	}
	.footer2{
		float: left;
		width: 20%;
	}
</style>
<script src="http://code.jquery.com/jquery-1.10.2.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<script language="JavaScript">
	$(document).ready(function() {
		var $banner = $(".banner").find("ul");

		var $bannerWidth = $banner.children().outerWidth();//이미지의 폭
		var $bannerHeight = $banner.children().outerHeight(); // 높이
		var $length = $banner.children().length;//이미지의 갯수
		var rollingId;

		//정해진 초마다 함수 실행
		rollingId = setInterval(function() { rollingStart(); }, 6000);//다음 이미지로 롤링 애니메이션 할 시간차
    
		function rollingStart() {
			$banner.css("width", $bannerWidth * $length + "px");
			$banner.css("height", $bannerHeight + "px");
			//alert(bannerHeight);
			//배너의 좌측 위치를 옮겨 준다.
			$banner.animate({left: - $bannerWidth + "px"}, 1500, function() { //숫자는 롤링 진행되는 시간이다.
				//첫번째 이미지를 마지막 끝에 복사(이동이 아니라 복사)해서 추가한다.
				$(this).append("<li>" + $(this).find("li:first").html() + "</li>");
				//뒤로 복사된 첫번재 이미지는 필요 없으니 삭제한다.
				$(this).find("li:first").remove();
				//다음 움직임을 위해서 배너 좌측의 위치값을 초기화 한다.
				$(this).css("left", 0);
				//이 과정을 반복하면서 계속 롤링하는 배너를 만들 수 있다.
			});
		}
	}); 
//
</script>

</head>
<body>
	<div id="menu">
		<div class="logo">
			<a href="Main.jsp"><img src="images/logo12.jpg"></a>
		</div>
		<div class="LoginMenu">
			<jsp:include page="LoginMenu.jsp" flush="false"></jsp:include>
		</div>
		<div class="menu">
			<nav>
				<ul>
					<li>영화
						<ul>
							<a href="Moviechart.do"><li>무비차트</li></a>
							<a href="introduce.do"><li>영화소개</li></a>
						</ul>
					</li>
					<li>예매
						<ul>
							<a href="Reservation.do"><li>빠른 예매</li></a>
							<a href="Store.do"><li>스토어</li></a>
						</ul>
					</li>
					<li>극장
						<ul>
							<a href="Introduce.do"><li>극장소개</li></a>
						</ul>
					</li>
					<li>이벤트
						<ul>
							<a href="Event.do"><li>이벤트</li></a>
							<a href="news.do"><li>매거진</li></a>
						</ul>
					</li>
				</ul>
			</nav>
		</div>
	</div>
	<div class="clear"></div>
	<div id = "body">
		<div class="banner">
				<ul>
					<li><img src="images/baner.jpg"></li>
					<li><img src="images/banner2.jpg"></li>
					<li><img src="images/banner3.jpg"></li>
				</ul>
		</div>
	</div>
	<div class="clear"></div>
	<div id="MovieSelect">
		<br>
		<div class="title">
			<h1>======= Movie Selection ======= </h1>
		</div>
		<br>
		<div class="background">
			<div class="videoselect">
				<div class="video">
					<iframe  title="YouTube video player" class="youtube-player" type="text/html"  width=100% height="420" src="//www.youtube.com/embed/J-9CR9z_5OI?showinfo=1&fs=1" frameborder="0" allowfullscreen></iframe>
				</div>
				<div class="explain">
					<img src="images/poster.jpg" class="poster">
				</div>
			</div>
		</div>
	</div>
	<div class="clear"></div>
	<footer>
		<div class="footer">
			<ul>
				<li>회사소개</li> |
				<li>광고/프로모션문의</li> |
				<li>이용약관</li> |
				<li>개인정보처리방침</li> |
				<li>법적고지</li> |
				<li>이메일무단수거거부</li>
			</ul>
		</div>
		<div class="clear"></div>
		<div class="footer3">
			<div class="footer1">
				<p>(18321)경기도 화성시 봉담읍 와우로73번길 22, 임광아파트</p>
				<p>대표이사:신성수 | 사업자등록번호: 123-12-12345 | 통신판매업신고번호:2018-서울구로-1234</p>
				<p>개인정보보호 책임자:신성수 | 대표이메일:tlstjdtn321@naver.com | 고객센터:010-2083-4409</p>
			</div>
	<!-- 		<div class="clear"></div> -->
			<div class="footer2">
				<i class="fa fa-facebook-square" style="font-size:48px;color:gray"></i>
				<i class="fa fa-twitter-square" style="font-size:48px;color:gray"></i>
				<i class="fa fa-youtube-play" style="font-size:48px;color:gray"></i>
			</div>
			<div class="clear"></div>
		</div>
	</footer>
	<div class="clear"></div>
</body>
</html>