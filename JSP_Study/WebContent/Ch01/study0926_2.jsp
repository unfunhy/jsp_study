<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<jsp:useBean class="study0926.Client" id="kim" scope="page"/>
<%-- <jsp:setProperty name="kim" property="username" value="재현"/> --%>
<jsp:setProperty name="kim" property="*"/>
	회원가입 내역
	<br>
	이름: <jsp:getProperty name="kim" property="username"/>
	나이: <jsp:getProperty name="kim" property="age"/>
	메일: <jsp:getProperty name="kim" property="mail"/>
	
	<%-- 이름: <%=(String)request.getParameter("username")%>
	성별: <%=(String)request.getParameter("sex")%>
	좋아하는 음악: <%=(String)request.getParameter("fvMusic")%>
	간단한 자기소개: <%=(String)request.getParameter("introduce")%> --%>
</body>
</html>