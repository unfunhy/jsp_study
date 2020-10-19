<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name='viewport' content='width=device-width, initial-scale=1'>
<title>sign up</title>
<link href="./Resources/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<h1 style='text-align:center;'>회원가입</h1>
	<div class='d-flex justify-content-center p-3'>
		<div class='form-control' style='width:485px; height:310px;'>
			<form id='user_info' method="POST" action="Control.jsp">
			<input type='hidden' name='action' value='sign_up'>
				<div class='p-3 d-flex flex-column justify-content-center'>
					<div class='form-inline p-2 justify-content-end d-flex flex-row'>
						<div>ID: </div> 
						<div><input type="text" class='form-control p-2 ml-2' style='width:340px;' name="username" id='username'></div>
					</div>
					
					<div class='form-inline p-2 justify-content-end d-flex flex-row'>
						<div>PW: </div> 
						<div><input type="password" class='form-control p-2 ml-2' style='width:340px;' name="password" id='password'></div>
					</div>
					
					<div class='form-inline p-2 justify-content-end d-flex flex-row'>
						<div>나이: </div> 
						<div><input type="number" class='form-control p-2 ml-2 mr-5' style='width:127px;' name="age"></div>
						
						<div>성별: </div>
						<div><input type="radio" class='form-control p-2 ml-3' name="sex" value="male"></div>
						<div class='ml-1'>남자 </div>
						<div><input type="radio" class='form-control p-2 ml-3' name="sex" value="female"></div>
						<div class='ml-1'> 여자 </div>
					</div>
					
					<div class='form-inline p-2 justify-content-end d-flex flex-row'>
						<div>H.P: </div> 
						<div><input type="text" class='form-control p-2 ml-2' style='width:340px;' name="phone"></div>
					</div>
						
					<div class='form-inline p-2 justify-content-end d-flex flex-row'>
						<div>Address: </div>
						<div><input type="text" class='form-control p-2 ml-2' style='width:340px;' name="addr"></div>
					</div>
				</div>
			</form>
			<div class='d-flex justify-content-end mt-3'>
				<input type='button' class='btn btn-primary' onclick='Checker()' value='회원가입'>
			</div>
		</div>
	</div>
	

<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.2/jquery.min.js"></script>
<script src="./Resources/js/bootstrap.js"></script>

<script>
	function Checker() {
		var username = document.getElementById("username").value;
		var password = document.getElementById("password").value;
		if (username == "") { alert('아이디를 확인해주세요.'); }
		if (password == "" || password.length > 10 || password.length < 6) {
			alert('6 ~ 10 자 사이의 비밀번호를 입력해주세요.');
		}
		else {
			if (username != "") {
				document.getElementById('user_info').submit();
			}
		}
	}
</script>
</body>
</html>