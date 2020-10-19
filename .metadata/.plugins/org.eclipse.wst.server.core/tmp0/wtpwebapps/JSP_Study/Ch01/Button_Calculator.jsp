<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<style>
.numButton {
	background-color: #3E91B5;
	border: none;
	color: white;
	margin: 0px;
	padding: 0px;
	width: 120px;
	height: 80px;
	text-align: center;
	font-size: 25px;
	cursor: pointer;
}

.operButton {
	background-color: #437299;
	border: none;
	color: white;
	width: 120px;
	height: 80px;
	text-align: center;
	font-size: 30px;
	cursor: pointer;
}

.display {
	margin: 3px;
	width: 488px;
	height: 60px;
	font-size: 35px;
}
</style>
<head>
<meta charset="UTF-8">
<title>Calculator_Button_ver</title>
</head>
<body>
	<h1>Calculator Button Version</h1>

	<form name="form">
		<input class="display" type="text" id="box"> <input
			type="hidden" id="temp_n"> <input type="hidden" id="temp_o">
	</form>
	<table>
		<tr>
			<td><button class="numButton" onclick="insert('7')">7</button></td>
			<td><button class="numButton" onclick="insert('8')">8</button></td>
			<td><button class="numButton" onclick="insert('9')">9</button></td>
			<td><button class="operButton" onclick="insert_oper('/')">%</button></td>
		</tr>
		<tr>
			<td><button class="numButton" onclick="insert('4')">4</button></td>
			<td><button class="numButton" onclick="insert('5')">5</button></td>
			<td><button class="numButton" onclick="insert('6')">6</button></td>
			<td><button class="operButton" onclick="insert_oper('*')">x</button></td>
			<td></td>
		</tr>
		<tr>
			<td><button class="numButton" onclick="insert('1')">1</button></td>
			<td><button class="numButton" onclick="insert('2')">2</button></td>
			<td><button class="numButton" onclick="insert('3')">3</button></td>
			<td><button class="operButton" onclick="insert_oper('-')">-</button></td>
			<td></td>
		</tr>
		<tr>
			<td><button class="numButton" onclick="clr()">C</button></td>
			<td><button class="numButton" onclick="insert('0')">0</button></td>
			<td><button class="numButton" onclick="equal()">=</button></td>
			<td><button class="operButton" onclick="insert_oper('+')">+</button></td>
		</tr>
	</table>
	<script>
		function insert(num) {
			document.form.box.value = document.form.box.value + num;
		}
		function insert_oper(oper) {
			var val = document.form.box.value;
			var last = val.substring(val.length-1,val.length);
			if (last == '+' || last == '-' || last == '*' || last == '/') {
				alert("숫자를 입력해 주세요.");
			}
			else {
				document.form.box.value = document.form.box.value + oper;
			}
		}
		function equal() {
			document.form.box.value = eval(document.form.box.value);
		}
		function clr() {
			document.form.box.value = "";
		}
	</script>
</body>
</html>