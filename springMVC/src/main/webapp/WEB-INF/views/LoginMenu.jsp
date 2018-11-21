<%@page import="java.io.PrintWriter"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>
	ul li{
		display: inline-block;
	}
	a{
		color:inherit;
	}
	a:hover{
		color:green;
	}
</style>
</head>
<body>
	<%
		String id = (String)session.getAttribute("member");
			if(id != null){
		request.setAttribute("id", id);
		request.getAttribute(id);
		System.out.println(id);
	%>
		<b>${id}</b>님 환영합니다. <input type="button" value="로그아웃" onclick="location.href='logout.do'">
	<%
		}else{
	%>
		<ul>
			<a href="login.jsp"><li>로그인</li></a>
			<a href="signup.jsp"><li>회원가입</li></a>
			<a href="ID/PW Find.do"><li>ID/PW찾기</li></a>
		</ul>
	<%
		}	
	%>
</body>
</html>