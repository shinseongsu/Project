<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
<style>
   form{
       text-align: center;
       margin:0 auto;
   }
   .border{
       margin:0 auto;
       width:400px;
       height:500px;
       border:1px solid #000;
       border-radius: 10%;
   }
   img{
       margin-top:20px;
       margin-bottom:80px;
   }
   input{
       width:300px;
   }
</style>
</head>
<body>
    <form action ="login.do">
        <div class="border">
            <h1>로그인</h1>
            <img src ="images/profle.jpg"><br>
            <input type="text"  name="id" id="id" value="maxpia"><br>
            <input type="password" name="password" id="password" value="maxpia"><br><br>
            <input type="submit" value="로그인">
        </div> 
    </form>
</body>
</html>