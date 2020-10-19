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

<%
	String index = "0";
%>
<title>글 쓰기</title>
<link href="./Resources/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
	<br>
	
	<form id='create' class='form-inline justify-content-center' method="POST" action='Control.jsp'>
		<div class='d-flex flex-column'>
			<div class='d-flex flex-row justify-content-end'>
				<div class='p-2'>
					<input type='hidden' name='action' value='create'>
					<select class='form-control' name='tag' id='tag' style='width: 80px; text-align: center'>
						<option value='유머'>유머</option>
						<option value='공지'>공지</option>
						<option value='정보'>정보</option>
					</select> 
				</div>
				<div class='p-2'>
					제목: <input class='form-control' type='text' name='title' id='title' style='width: 340px;' placeholder='제목'> 
				</div>
			</div>
			
			<div class='p-3 form-control test' style='width:485px; height:280px;'>
				<label for='contents'></label>
				<textarea class='pre' style='border:none; width:100%; height:100%;' id='contents' name='contents'
				placeholder="유머킹에서 글 작성시 유의사항!<%='\n'%>1. 타인 비방 글 금지<%='\n'%>2. 성적 발언, 혐오 발언 금지"></textarea>
			</div>
			
		</div>
	</form>
	<div class='d-flex flex-row justify-content-center' style='margin-left:330px;'>
		<div class='pt-2 pr-2'><input type='button' class='btn btn-primary' onclick='Create()' value='게시하기'></div>
		<div class='pt-2'><input type='button' class='btn btn-primary' onclick='BackToTable()' value='목록'></div>
	</div>
	
	<form id='backToBoard' method="POST" action='Control.jsp'>
		<input type='hidden' name='action' value='read_board'>
		<input type='hidden' name='index' value='<%=index%>'>
	</form>

	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.2/jquery.min.js"></script>
	<script src="./Resources/js/bootstrap.js"></script>
	<script>
		function Create() {
			if (document.getElementById("tag").value == "공지") {
				if (!<%=((String)(((Client)session.getAttribute("client")).getUsername())).equals("관리자")%>) {
					alert("공지 태그는 관리자만 사용가능합니다.");
				}
			} else {
				document.getElementById("create").submit();
			}
		}
		
		function BackToTable() {
			document.getElementById("backToBoard").submit();
		}
	</script>
</body>
</html>