<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입 하기</title>
</head>
<body>

<h1>회원가입 하기</h1>

<form method="POST" action="study0926_2.jsp">
	이름: <input type="text" name="username">
	<br>
	나이: <input type="text" name="age">
	<br>
	성별: <input type="radio" name="sex" value="male"> 남자
	<input type="radio" name="sex" value="female"> 여자
	<br>
	H.P: <input type="text" name="phone">
	<br>
	주소: <input type="text" name="addr">
	<br>
	
	<input type="submit">
	
	
</form>
	
</body>
</html>