<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.net.URLEncoder"%>
<%@ page import="java.util.ArrayList"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name='viewport' content='width=device-width, initial-scale=1'>
<title>board</title>
<link href="./Resources/css/bootstrap.min.css" rel="stylesheet">

<jsp:useBean id="board" type="java.util.ArrayList<study0926.Board>" scope="request" />

<style>
div.header {
font-size:45px;
border:1px dashed;
width:90%;
height:100px;
text-align: center;
padding: 20px;
}
</style>

<% 
request.setCharacterEncoding("UTF-8");
int numberOfPost = 8; // 삭제
int index = Integer.parseInt((String)request.getAttribute("index"));
int count = Integer.parseInt((String)request.getAttribute("count"));
String searchTag = (String) request.getAttribute("searchTag");
String searchText = (String) request.getAttribute("searchText");
float end; 
if (count % numberOfPost == 0) {
	end = count / numberOfPost;
}
else {
	end = count / numberOfPost + 1;
}
%>

</head>
<body>
<div class='d-flex justify-content-center mt-3 mb-3'>
	<div class='header'>
		<a href="Control.jsp?action=read_board&index=0">Board</a>
	</div>
	</div>


	<table style='width:90%; margin:auto; text-align:center;' class='table table-hover'>
		<thead>
			<tr>
				<th style='width:50px;'>#</th>
				<th style='width:100px;'>태그</th>
				<th style='width:50px;'></th>
				<th style='width:350px;'>제목</th>
				<th style='width:50px; '></th>
				<th style='width:100px;'>작성자</th>
				<th style='width:150px;'>작성 날짜</th>
				<th style='width:100px;'>조회수</th>
			</tr>
		</thead>
		
		<% for (int i = 0; i < board.size() ; i++) {%>
			<tbody>
			<tr>
				<td><%=board.get(i).getId()%></td>
				<td><%=board.get(i).getTag()%></td>
				<td></td>
				<td style='text-align:left;'><a href="Control.jsp?action=read&id=<%=board.get(i).getId()%>&index=<%=index%>&searchTag=<%=searchTag%>&searchText=<%=URLEncoder.encode(searchText)%>"><%=board.get(i).getTitle()%></a></td>
				<td></td>
				<td><%=board.get(i).getUsername()%></td>
				<td><%=board.get(i).getC_date()%></td>
				<td><%=board.get(i).getViews()%></td>
			</tr>
			</tbody>
		<%}%>
	</table>
	<br>
	<div style='width:300px; height:30px; text-align:center; margin:auto; font-size:large'>
 	<%
 	int front = index - 2;
 	if (front < 0 || front +1 < 0) front = 0;
 	float back = front + 5;
 	if (back > end) back = end;
 	for(int i = front; i < back; i++) {
 		if (i == (int) index) {%>
 			<a style='color:red; margin-right:5px' href="Control.jsp?action=read_board&index=<%=Integer.toString(i)%>&searchTag=<%=searchTag%>&searchText=<%=URLEncoder.encode(searchText)%>"><%=Integer.toString(i + 1)%></a>
 		<%}
 		else {%>
 			<a style='margin-right:5px' href="Control.jsp?action=read_board&index=<%=Integer.toString(i)%>&searchTag=<%=searchTag%>&searchText=<%=URLEncoder.encode(searchText)%>"><%=Integer.toString(i + 1)%></a>
 		<%}
 		}%>
	</div>
	<br>
	<div class='d-flex justify-content-center'>
		<div>
			<form class='form-inline' style='text-align:right; float:left; width:500px; height:45px; margin:auto' name='search' id='search'>
				<input type='hidden' name='action' value='read_board'>
				<input type='hidden' name='index' value='0'>
				<select class='form-control' name='searchTag' id='searchTag' style='height: 40px; width: 80px; text-align:center; margin-right:5px;'>
					<option value='contents'>내용</option>
					<option value='title'>제목</option>
					<option value='username'>작성자</option>
				</select>
				<input class='form-control' type='text' name='searchText' style='height:40px; width:400px' id='searchText' placeholder=<%=searchText %>>
			</form>
		</div>
		<div>
			<input type='button' class='btn btn-primary p-2' style='margin-left:10px; margin-right:10px; width:80px; height:45px;' value='검색' onclick='Search()'>
		</div>
		<div>
		<input type='button' class='btn btn-primary p-2 ml-1' style='width:120px; height:45px; float:right; margin-right:70px;' value='글쓰기' onclick='GotoCreateNewPost()'>
		</div>
	</div>
	
	<br>
	
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.2/jquery.min.js"></script>
	<script src="./Resources/js/bootstrap.js"></script>
	<script>
	function GotoCreateNewPost() {
		location.href = 'createPost.jsp';
	}
	function Read_Post() {
		document.getElementById("read_post").submit();
	}
	function Search() {
		document.getElementById("search").submit();
	}
	</script>
</body>
</html>