<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
		
<!DOCTYPE html>
<% request.setCharacterEncoding("UTF-8"); %>
<html>
<style>
#divPosition {
	position: absolute;
	vertical-align: center;
	align: center;
	width: 100%;
	height: 100%;
	align-items: center;
	justify-content: center;
}

#boxPosition {
	position: relative;
	height: 40px;
	width: 150px;
	margin-left: 5px;
	margin-top: 0px;
	padding: 1px;
}
</style>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name='viewport' content='width=device-width, initial-scale=1'>
<title>board</title>
<link href="./Resources/css/bootstrap.min.css" rel="stylesheet">
<title>메인 화면</title>
</head>

<body>
	<div class='row' id='divPosition'>
		<form id='login' method='post' action='Control.jsp'>
		<input type="hidden" name="action" value="login">
			<div class='row'>
				<div class='form-group'>
					<input type='text' class='form-control col-md-8' name='username' id='username'
						placeholder='ID'>
				</div>
				<div class='form-group' id='boxPosition'>
					<input type='button'
						class='form-control col-md-12 btn btn-primary btn-block'
						value='로그인' onclick='Check_login()'>
				</div>
			</div>

			<div class='row'>
				<div class='form-group'>
					<input type='password' class='form-control col-md-8'
						name='password' id='password' placeholder='Password'>
				</div>
				<div class='form-group' id='boxPosition'>
					<input type='button'
						class='form-control col-md-12 btn btn-primary btn-block'
						value='회원가입' onclick='SignUp()'>
				</div>
			</div>
		</form>
	</div>
	
	<script	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.2/jquery.min.js"></script>
	<script src="./Resources/js/bootstrap.js"></script>
	<script>
		function Check_login() {
			if (document.getElementById('username').value == "" || document.getElementById('password').value == "") {
				alert('아이디 혹은 비밀번호를 확인해주세요.');
			}
			else {
				document.getElementById('login').submit();
			}
		}
		function SignUp() {
			location.href = 'sign_up.jsp';
		}
	</script>
</body>
</html>