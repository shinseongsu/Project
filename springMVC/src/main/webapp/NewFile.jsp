<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>기탁씨 힘내세요.</title>
<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
<script>
	$(function(){
		$("#search_Button").click(function(){
			$.ajax({
				type:'POST',
				url: '/test.do',
				data: {
					searchType : $("#searchType").val(),
					search : $("#search").val()
				},
				success:function(data){
					var a = '';
					$("#list").html("");
					$.each(data, function(key, value){
						a += '<tr>';
						a += '<td>'+value.id+'</td><td>'+value.password+'</td><td>'+value.name+'</td><td>'+value.tel+'</td>'
					});
					
					$("#list").html(a);
				}
			});
		});
	});
</script>
</head>
<body style="text-align: center;">
	<select id="searchType">
		<option>이름</option>
		<option>아이디</option>
		<option>전화번호</option>
	</select>
	<input type="text" id="search" name="search">
	<input type="button" id="search_Button" value="찾기">
	<table>
		<tr>
			<th>id</th>
			<th>password</th>
			<th>name</th>
			<th>tel</th>
		</tr>
	<div id="list"></div>
	</table>
</body>
</html>