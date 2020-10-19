<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	/* boolean posted = false;
	double result = 0;
	if (request.getMethod().equals("POST")) {
		posted = true;
		String oper = request.getParameter("operator");
		double n1 = Double.parseDouble(request.getParameter("n1"));
		double n2 = Double.parseDouble(request.getParameter("n2"));

		if (oper.equals("add")) {
			result = n1 + n2;
		} else if (oper.equals("sub")) {
			result = n1 - n2;
		} else if (oper.equals("mul")) {
			result = n1 * n2;
		} else {
			result = (double) (n1 / n2);
		}
	} */
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>study2</title>
</head>
<body>



	<!-- <h1>Calculator</h1>
	<br>
	<form method="POST">
		<input type="text" name="n1" style="width: 50px"> 
		<select	name="operator" size="1" style="text-align: center; width: 50px">
			<option value="add">+</option>
			<option value="sub">-</option>
			<option value="mul">*</option>
			<option value="div">/</option>
		</select> <input type="text" name="n2" style="width: 50px"> <br> <br>
		<input type="submit">
	</form> -->
	
	
	
	<hr>
	<form method="post">
	<input type="text" name="ex" id="a">
	<input type="submit">
	</form>
	<p id="b"></p>	
	<script>
		var a = document.getElementById("a").innerHTML
		document.getElementById("b").innerHTML = a
	</script>	
</body>
</html>