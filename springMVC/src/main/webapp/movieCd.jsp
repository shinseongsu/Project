<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<title>영화 상세 정보</title>
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
	
	.body{
		width: 80%;
		margin: 0 auto;
	}
	.top{
		width:100%;
		background-color: #8C8C8C;
		border: 1px solid #8C8C8C; 
		color: #fff;
		padding-top: 10px;
		padding-bottom: 10px;
	}
	.symbol{
		width: 25px;
		float: left;
		margin-left: 10px;
	}
	.margin{
		margin-top: 5px;
		margin-bottom: 5px;
	}
	.first{
		border: 3px solid #5CD1E5;
	}
	.images{
		float: left;
		width: 100px;
		margin-bottom: 10px;
		margin-left: 30px;
	}
	.images> img{
		width: 100%;
	}
	.inline{
		margin: 10px;
		margin-bottom: 20px;
	}
	.inline_table{
		float: left;
		width: 80%;
	}
	th{
		color: #008299;
	}
</style>
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
		<div class="top">
			<div class="symbol"><img src="images/symbol.png"></div> &nbsp; &nbsp;<b>${vo.movieNm}</b> (${vo.movieNmEn})
		</div>
		<div class="clear"></div>
		<div class="margin"></div>
		<div class="first">
			<div class="inline">
				<div class="images">
					<img id="test" src="images/${vo.movieNmEn}.jpg">
				</div>
			<table class="inline_table">
				<tr>
					<th>코드</th>
					<td>${vo.movieCd}</td>
				</tr>
				<tr>
					<th>A.K.A</th>
					<td>${vo.movieNm}(${vo.movieNmEn})</td>
				</tr>
				<tr>
					<th>요약정보</th>
					<td>${vo.typeNm} | ${vo.showTm}분</td>
				</tr>
				<tr>
					<th>개봉일</th>
					<td>${vo.prdtYear}</td>
				</tr>
				<tr>
					<th>크랭크인/업</th>
					<td>open API에 있다고 했는데 없네요....</td>
				</tr>
				<tr>
					<th>상영타입</th>
					<c:forEach var="type" items="${vo.showTypeGroupNm}" begin="1">
						<td>
							${type} ${vo.showTypes }
						</td>
						<tr>
							<th></th>
						
					</c:forEach>
				</tr>
			</table>
			<div class="clear"></div>
			</div>
			
		</div>
		<br>
		<div class="top">
			<div class="symbol"><img src="images/arrow.png"></div> &nbsp; &nbsp;<b>만든 사람들</b>
		</div>
		
	</div>
</body>

<script>

document.getElementById("test").onerror = function(){
	document.getElementById("test").src = "images/noimage.png";
};
</script>
</html>