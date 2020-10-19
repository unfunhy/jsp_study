<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<% request.setCharacterEncoding("UTF-8"); %>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name='viewport' content='width=device-width, initial-scale=1'>
<title>board</title>
<link href="./Resources/css/bootstrap.min.css" rel="stylesheet">
<title>글 쓰기</title>
</head>
<body>
	<br>
	<%
	String id = request.getParameter("id");
	String tag = request.getParameter("tag");
	String title = request.getParameter("title");
	String c_date = request.getParameter("c_date");
	String contents = request.getParameter("contents");
	String index = request.getParameter("index");
	String searchTag = request.getParameter("searchTag");
	String searchText = request.getParameter("searchText");
	System.out.println("updatePost: "+searchTag+searchText);
	%>

	<form id='update' class='form-inline justify-content-center' method="POST" action='Control.jsp'>
		<div class='d-flex flex-column'>
			<div class='d-flex flex-row justify-content-end'>
				<div class='p-2'>
					<input type='hidden' name='action' value='update'> 
					<input type='hidden' name='id' value='<%=id %>'>
					<input type='hidden' name='index' value='<%=index%>'>
					<input type='hidden' name='searchTag' value='<%=searchTag %>'>
					<input type='hidden' name='searchText' value='<%=searchText %>'>
					<select class='form-control' name='tag' id='tag' style='width: 80px; text-align: center'>
						<option value='유머'>유머</option>
						<option value='공지'>공지</option>
						<option value='정보'>정보</option>
					</select> 
				</div>
				<div class='p-2'>
					제목: <input class='form-control' type='text' name='title' id='title' style='width: 340px;' value='<%=title%>'> 
				</div>
			</div>
			
			<div class='p-3 form-control test' style='width:485px; height:280px;'>
				<label for='contents'></label>
				<textarea style='border:none; width:100%; height:100%;' id='contents' name='contents'><%=contents%></textarea>
			</div>
			
		</div>
	</form>
	<div class='d-flex flex-row justify-content-center' style='margin-left:330px;'>
		<div class='pt-2 pr-2'><input type='button' class='btn btn-primary' onclick='Update()' value='수정하기'></div>
		<div class='pt-2'><input type='button' class='btn btn-primary' onclick='BackToTable()' value='목록'></div>
	</div>
	
	<form id='backToBoard' method="POST" action='Control.jsp'>
		<input type='hidden' name='action' value='read_board'>
		<input type='hidden' name='index' value='<%=index%>'>
		<input type='hidden' name='searchTag' value='<%=searchTag %>'>
		<input type='hidden' name='searchText' value='<%=searchText %>'>
	</form>

	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.2/jquery.min.js"></script>
	<script src="./Resources/js/bootstrap.js"></script>

	<script>
		function Update() {
			if (document.getElementById("tag").value == "공지") {
				if (!session.getParameter("username").equals("관리자")) {
					alert("공지 태그는 관리자만 사용가능합니다.");
				}
			} else {
				document.getElementById("update").submit();
			}
		}
		function BackToTable() {
			document.getElementById("backToBoard").submit();
		}
	</script>
</body>
</html>