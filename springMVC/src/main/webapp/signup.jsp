<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<style>
	*{
		padding: 0;
		margin: 0;
	}
	.title{
		width: 70%;
		margin: 10px auto;
	}
	.h1{
		font-size: 2em;
		color:orange;
	}
	.TitleText{
		font-size: 12px;
	}
	.form{
		width: 70%;
		margin: 5px auto;
		background-color: orange;
	}
	table{
		margin: 5px auto;
	}
	td{
		background-color: #FFC19E;
		border-bottom: 1px solid #333;
		width:550px;
		padding-top:10px;
		padding-bottom: 10px;
		padding-left:10px;
	}
	th{
		background-color: #FFC19E;
		width: 200px;
		text-align: left;
		padding-left: 3%;
		border-bottom: 1px solid #333;
	}
	table{
		border: 1px solid #ccc;
		border-radius: 7px;
	}
	img{
		width: 150px;
		height: 80px;
	}
	.buttonlocation{
		width: 100%;
		margin: 0 auto;
		text-align: center;
	}
	input[type=submit]{
		margin: 5px auto;
		border-radius: 5px;
		background-color: #ABF200;
		color: white;
		border-color: #ABF200;
		width: 140px;
		height: 50px;
		font-size: 20px;
	}
	#postcodify_search_button{
		display: none;
	}
	input[type=text]{
		border-radius: 5px;
	}
	input[type=password]{
		border-radius: 5px;
	}
</style>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script>
function execDaumPostcode(){
    new daum.Postcode({
        oncomplete: function(data) {
            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분입니다.
           
            //각 주소의 노출 규칙에 따라 주소를 조합한다.
            //내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기한다.
            var fullAddr = '';//최종 주소 변수
            var extraAddr = '';//조합형 주소 변수
            
            //사용자가 선택한 주소타입에 따라 해당 주소값을 가져온다.
            if(data.userSelectedType==='R'){//사용자가 도로명 주소를 선택
            	fullAddr = data.roadAddress;
            }else{//사용자가 지번 주소를 선택
            	fullAddr = data.jibunAddress;
            }
            
            //사용자가 선택한 주소가 도로명타입일 때 조합한다.
            if(data.userSelectedType==="R"){
            	//법정동명이 있을 경우 추가
            	if(data.bname!==''){
            		extraAddr += data.bname;
            	}
            	//건물명이 있을 경우 추가
            	if(data.buildingName!==''){
            		extraAddr += (extraAddr!==''?','+data.buildingName:data.buildingName);
            	}
            	//조합형 주소의 유무에 따라 양쪽에 괄호를 추가하여 최종 주소를 만든다.
            	fullAddr += (extraAddr!==''?' ('+extraAddr+')': '')
            }
            //우편번호와 주소 정보를 해당 필드에 넣는다.
            document.getElementById('member_zip').value=data.zonecode;//5자리 새 우편번호 사용
            document.getElementById('member_addr1').value=fullAddr;
            
            //커서를 상세주소 필드로 이동한다.
            document.getElementById('member_addr2').focus();
        }
    }).open();
}
</script>
<script>
	function chk(){
		var id = form.id;
		var name= form.name;
		var pass1 = form.password;
		var pass2 = form.password1;
		
		if(id.value == ""){
			alert('아이디를 입력해주세요');
			id.focus();
			return false;
		}else if(name.value == ""){
			alert('이름을 입력해주세요');
			name.focus();
			return false;
		}else if(pass1.value == ""){
			alert('비밀번호를 입력해주세요.');
			pass1.focus();
			return false;
		}else if(pass2.value == ""){
			alert('비밀번호 확인 창에 입력을 해주세요');
			pass2.focus();
			return false;
		}else if(pass1.value != pass2.value){
			alert('비밀번호가 다릅니다. 다시 확인해주세요.');
			pass2.value="";
			pass2.focus();
			return false;
		}
		return true;
	}
</script>
</head>
<body>
	<div class="title">
		<a href="Main.jsp"><img src="images/logo12.jpg"></a>&nbsp;&nbsp;&nbsp;&nbsp;<span class="h1">회원가입</span>&nbsp;&nbsp;&nbsp;&nbsp;<span class="TitleText">무비맥스를 이용하는데 필수적인 정보이므로 정확하게 기재해주세요.</span>
	</div>
	<div class="form">
		<button id="postcodify_search_button">검색</button>
		<br>
		<form name="form" action="insertMember.do" method="get">
			<table border="1">
				<tr>
					<th>성명</th>
					<td><input type="text" name="name"></td>
				</tr>
				<tr>
					<th>아이디</th>
					<td><input type="text" name="id"></td>
				</tr>
				<tr>
					<th>패스워드</th>
					<td><input type="password" name="password"></td>
				</tr>
				<tr>
					<th>패스워드 확인</th>
					<td><input type="password" name="password1"></td>
				</tr>
				<tr>
					<th>연락처</th>
					<td>
						<select name="tel1">
							<option value="010">010</option>
							<option value="02">02</option>
							<option value="031">031</option>
							<option value="051">051</option>
							<option value="032">032</option>
						</select>
						-
						<input type="text" name="tel2">
						-
						<input type="text" name="tel3"><br>
						SMS수신동의 <input type="radio" name="sms" value="yes">yes<input type="radio" name="sms" value="no">no
					</td>
				</tr>
				<tr>
				<th>주소</th>
					<td>
						<input type="text" name="member_zip" id="member_zip" maxlength="7" size="7" class="form-control">
						<input type="button" onclick="execDaumPostcode()" value="우편번호 찾기" class="form-control"><br>
						<input type="text" name="member_addr1" id="member_addr1" maxlength="80" size="80" class="form-control"><br>
						<input type="text" name="member_addr2" id="member_addr2" maxlength="80" size="80" class="form-control">
					</td>
				</tr>
				<tr>
					<th>이메일</th>
					<td>
						<input type="text" name="email">
						이메일 수신동의 <input type="radio" name="email1" value="yes">yes<input type="radio" name="email1" value="no">no
					</td>
				</tr>
			</table>
			<div class="buttonlocation">
				<input type="submit" onclick="return chk()" value="회원가입">
			</div>
		</form>
	</div>
</body>
</html>