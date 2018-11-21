<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>이벤트 게시판</title>
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
		width: 70%;
		margin: 0 auto;
	}
	.body table{
		margin: 0 auto;
	}
	.search{
		margin: 0 auto;
		text-align: center;
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
		<table border="1" style="border-collapse: collapse;">
			<tr>
				<th style="width: 75px;">글번호</th>
				<th style="width: 250px;">제목</th>
				<th style="width: 350px;">내용</th>
				<th style="width: 100px;">작성자</th>
				<th style="width: 100px;">조회수</th>
			</tr>
			<c:forEach var="list" items="${BoardList}" varStatus="status">
				<tr>
					<td>${status.count}</td>
					<td>${list.board_title}</td>
					<td>${list.board_cont}</td>
					<td>${list.board_name}</td>
					<td>${list.board_hit}</td>
				</tr>
			</c:forEach>
		</table>
		<div class="paging"></div>
		<form action="Event.do">
			<div class="search">
				<input type="text" name=find_name>&nbsp;&nbsp;<input type="submit" value="검색">
				<input type="button" style="float:right; margin-right: 20px;" value="글쓰기" onclick="location.href='insertevent.do';">
			</div>
		</form>
		<div class="clear"></div>
	</div>
	
</body>
</html>