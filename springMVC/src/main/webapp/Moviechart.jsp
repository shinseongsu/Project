<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
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
	.top{
		width: 20%;
		float: left;
		margin: 10px auto;
	}
	.chart{
		width: 15%;
		float:left;
		margin: 5px 28px;
		border: 1px solid #ccc;
	}
	.img{
		width:100%;
		overflow: hidden;
	}
	.body{
		width: 80%;
		margin: 0 auto;
	}
	.number{
		text-align: center;
		border: 5px solid #000;
		background-color: red;
		font:bold;
		color: white;
		font-size: 20px; 
	}
	.explain{
		text-align: center;
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
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<title>무비 차트</title>
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
	<div class="body">
	<h1>무비차트</h1>
	<hr style="height: 3px; background: #000">
		<div id="top">
		<c:forEach var="movie" items="${list}" varStatus="status">
				<a href="movie.do?title=${movie.title}">
				<div class="chart">
					<div class="number">
						No.${status.count}
					</div>
					<div class="img">
						<img src="images/${movie.image}">
					</div>
					<div class="explain">
						<b>${movie.title}</b>
						<p>관람객수 : <fmt:formatNumber type="number" value="${movie.rate}"/></p>
						<p>개봉일 : <fmt:formatDate value="${movie.startdate}" type="date"/></p>
						<p>${movie.age}세  ${movie.showtime}</p>
					</div>
				</div>
				</a>
		</c:forEach>
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