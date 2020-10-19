<%@page import="study0926.Board"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.net.URLEncoder"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="java.sql.Blob"%>
<%@ page import="java.util.Date"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ page import="study0926.Client"%>

<jsp:useBean class="study0926.DBconnector" id="db" scope="request" />
<jsp:useBean class="study0926.Board" id="_board" scope="request" />

<%	
		request.setCharacterEncoding("UTF-8");
		int numberOfPost = 8;
		String action = request.getParameter("action");
		
		if (action.equals("sign_up")) {
			String username = request.getParameter("username");
			String password = request.getParameter("password");
			int age;
			if (!request.getParameter("age").equals("")) {
				age = Integer.parseInt(request.getParameter("age"));
			} else {
				age = 0;
			}
			String sex = request.getParameter("sex");
			String phone = request.getParameter("phone");
			String addr = request.getParameter("addr");

			int checker = db.SetInfoToDB(username, password, age, sex, phone, addr);

			if (checker == 0) {
				out.print("<script> alert('서버에 연결되지 않았습니다. 네트워크를 확인해주세요.');history.go(-1); </script>");
			} else if (checker == 1) {
				out.print("<script> alert('이미 존재하는 아이디입니다.');history.go(-1); </script>");
			} else {
				out.print("<script> alert('회원가입이 완료되었습니다. 로그인 해주세요.'); location.href='sign_in.jsp'; </script>");
			}
		}
		
		else if (action.equals("login")) {
			int checker = db.GetInfoFromDB((String) request.getParameter("username"),
					(String) request.getParameter("password"));

			if (checker == 0) {
				out.println("<script> alert('서버에 연결되지 않았습니다. 네트워크를 확인해주세요.'); history.go(-1); </script>");
			} else if (checker == 1) {
				out.println("<script> alert('아이디 혹은 비밀번호를 확인해주세요.'); history.go(-1); </script>");
			} else {
				
				session.setAttribute("client", db.returnClient());
				out.println("<script> alert('게시판이 로드되었습니다.');</script>");
				response.sendRedirect("Control.jsp?action=read_board&index=0");
			}
		}
		
		else if (action.equals("read_board")) { // 보드 읽기
			String index = request.getParameter("index");
			String condition = "";
			String searchTag = "";
			String searchText = "";
			
			if (request.getParameter("searchText") != null) {
				searchTag = request.getParameter("searchTag");
				searchText = request.getParameter("searchText");
				if (!searchText.equals("") && !searchText.equals("null")) {
					condition = "where "+ searchTag +" like \'%"+ searchText +"%\'";
				}
			}
			
			int count = db.GetPostCount(condition);
			
			ArrayList<Board> board = db.ReadBoard(index, Integer.toString(numberOfPost), condition);
			
			request.setAttribute("board", board);
			request.setAttribute("index", index);
			request.setAttribute("count", Integer.toString(count));
			request.setAttribute("searchTag", searchTag);
			request.setAttribute("searchText", searchText);
			pageContext.forward("main.jsp");
		}

		else if (action.equals("create")) {
			Date time = new Date();
			SimpleDateFormat sf = new SimpleDateFormat("yy.MM.dd, HH:mm:ss");
			
			String tag = (String)request.getParameter("tag");
			String title = (String)request.getParameter("title");
			String contents = (String)request.getParameter("contents");
			String c_date = sf.format(time);
			
			Client client = (Client) session.getAttribute("client");
			db.CreatePost(tag, title, client.getUsername(), c_date, contents);
			response.sendRedirect("Control.jsp?action=read_board&index=0");
		}
		
		else if (action.equals("read")) { // 글 읽기
			String[] sender = db.ReadPost((String)request.getParameter("id"));
		
			System.out.println(request.getParameter("searchText"));
		
			request.setAttribute("index", request.getParameter("index"));
			request.setAttribute("searchTag", request.getParameter("searchTag"));
			request.setAttribute("searchText", request.getParameter("searchText"));
			request.setAttribute("sender", sender);
			pageContext.forward("readPost.jsp");
		}
		
		else if (action.equals("update")) {
			String id = (String) request.getParameter("id");
			String[] sender = new String[4];
			
			Date time = new Date();
			SimpleDateFormat sf = new SimpleDateFormat("yy.MM.dd, HH:mm:ss");
			
			String tag = (String) request.getParameter("tag");
			String title = (String) request.getParameter("title");
			String contents = (String)request.getParameter("contents");
			String c_date = sf.format(time);
			
			String index = (String) request.getParameter("index");
			String searchTag = request.getParameter("searchTag");
			String searchText = request.getParameter("searchText");
			
			db.UpdatePost(id, tag, title, c_date, contents);
			response.sendRedirect("Control.jsp?action=read&id="+id+"&index="+index+"&searchTag="+searchTag+"&searchText="+URLEncoder.encode(searchText));
		}
		
		else if (action.equals("deletePost")) {
			String id = (String) request.getParameter("id");
			String index = (String) request.getParameter("index");
			String searchTag = request.getParameter("searchTag");
			String searchText = request.getParameter("searchText");
			
			db.DeletePost(id);
			response.sendRedirect("Control.jsp?action=read_board&index="+index+"&searchTag="+searchTag+"&searchText="+URLEncoder.encode(searchText));
		}
%>