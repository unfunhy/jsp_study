<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="study0926.Client"%>
<!DOCTYPE html>
<% request.setCharacterEncoding("UTF-8"); %>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name='viewport' content='width=device-width, initial-scale=1'>
<title>board</title>
<link href="./Resources/css/bootstrap.min.css" rel="stylesheet">
<style>
div.test{
white-space:pre;
}
input.test {
white-space:pre;
}
</style>

<title>글 쓰기</title>
</head>
<body>
	<br>
	<%
	String[] sender = (String[]) request.getAttribute("sender");
	String id = sender[0];
	String tag = sender[1];
	String title = sender[2];
	String c_date = sender[3];
	String contents = sender[4];
	String username = sender[5];
	String _username = (String)((Client)session.getAttribute("client")).getUsername();
	String index = (String) request.getAttribute("index");
	String searchTag = (String) request.getAttribute("searchTag");
	String searchText = (String) request.getAttribute("searchText");
	System.out.println("readPost: "+searchTag+searchText);
	%>
	
	<form id='to_update' class='form-inline justify-content-center' method="POST" action='updatePost.jsp'>
		<div class='d-flex flex-column'>
			<div class='d-flex flex-row justify-content-end'>
				<div class='p-2'>
					<input type='hidden' name='action' value='read'> 
					<input type='hidden' name='id' value='<%=id %>'>
					<input type='hidden' name='index' value='<%=index %>'>
					<input type='hidden' name='searchTag' value='<%=searchTag %>'>
					<input type='hidden' name='searchText' value='<%=searchText %>'>
					<select class='form-control' disabled name='tag' id='tag' style='width: 80px; text-align: center'>
						<option><%=tag %></option>
					</select> 
				</div>
				<div class='p-2'>
					제목: <input class='form-control' readonly type='text' name='title' id='title' style='width: 340px;' value='<%=title%>'> 
				</div>
			</div>
			
			<div class='d-flex flex-row justify-content-end'>
				<div class='p-2'>
					게시일: <input class='form-control' readonly type='text' name='c_date' id='c_date'	style='width: 150px;' value='<%=c_date%>'> 
				</div>
			</div>
			<div class='p-3 form-control test' style='width:485px; height:280px;'><%=contents%></div>
			<label for='contents'></label>
			<textarea style='display:none;' id='contents' name='contents'><%=contents%></textarea>
		</div>
	</form>
	
	<div class='justify-content-center' style='margin:auto; width:500px; height:50px;'>
	<div class='d-flex flex-row justify-content-end'>
	<%	
	if (((String)((Client)session.getAttribute("client")).getUsername()).equals(username)) {%>
		<div class='pt-2 pr-2'><input type='button' class='btn btn-primary' onclick='Update()' value='수정하기'></div>
		<div class='pt-2 pr-2'><input type='button' class='btn btn-primary' onclick='Delete()' value='삭제'></div>
		<%} %>
		<div class='pt-2'><input type='button' class='btn btn-primary' onclick='BackToTable()' value='목록'></div>
	</div>
	</div>
	
	<form id='backToBoard' method="POST" action='Control.jsp'>
		<input type='hidden' name='action' value='read_board'>
		<input type='hidden' name='index' value='<%=index%>'>
		<input type='hidden' name='searchTag' value='<%=searchTag %>'>
		<input type='hidden' name='searchText' value='<%=searchText %>'>
	</form>
	<form id='deletePost' method='POST' action='Control.jsp'>
		<input type='hidden' name='action' value='deletePost'>
		<input type='hidden' name='id' value=<%=id %>>
		<input type='hidden' name='index' value='<%=index%>'>
		<input type='hidden' name='searchTag' value='<%=searchTag %>'>
		<input type='hidden' name='searchText' value='<%=searchText %>'>
	</form>

	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.2/jquery.min.js"></script>
	<script src="./Resources/js/bootstrap.js"></script>
	<script>
		function Update() {
			document.getElementById("to_update").submit();
		}
		function BackToTable() {
			document.getElementById("backToBoard").submit();
		}
		function Delete() {
			if (confirm("삭제하겠습니까?")) {
				document.getElementById("deletePost").submit();
			}
			
		}
	</script>
</body>
</html>