/*
 * Generated by the Jasper component of Apache Tomcat
 * Version: Apache Tomcat/9.0.24
 * Generated at: 2019-10-27 07:55:26 UTC
 * Note: The last modified time of this file was set to
 *       the last modified time of the source file after
 *       generation to assist with modification tracking.
 */
package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import study0926.Client;

public final class createPost_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent,
                 org.apache.jasper.runtime.JspSourceImports {

  private static final javax.servlet.jsp.JspFactory _jspxFactory =
          javax.servlet.jsp.JspFactory.getDefaultFactory();

  private static java.util.Map<java.lang.String,java.lang.Long> _jspx_dependants;

  private static final java.util.Set<java.lang.String> _jspx_imports_packages;

  private static final java.util.Set<java.lang.String> _jspx_imports_classes;

  static {
    _jspx_imports_packages = new java.util.HashSet<>();
    _jspx_imports_packages.add("javax.servlet");
    _jspx_imports_packages.add("javax.servlet.http");
    _jspx_imports_packages.add("javax.servlet.jsp");
    _jspx_imports_classes = new java.util.HashSet<>();
    _jspx_imports_classes.add("study0926.Client");
  }

  private volatile javax.el.ExpressionFactory _el_expressionfactory;
  private volatile org.apache.tomcat.InstanceManager _jsp_instancemanager;

  public java.util.Map<java.lang.String,java.lang.Long> getDependants() {
    return _jspx_dependants;
  }

  public java.util.Set<java.lang.String> getPackageImports() {
    return _jspx_imports_packages;
  }

  public java.util.Set<java.lang.String> getClassImports() {
    return _jspx_imports_classes;
  }

  public javax.el.ExpressionFactory _jsp_getExpressionFactory() {
    if (_el_expressionfactory == null) {
      synchronized (this) {
        if (_el_expressionfactory == null) {
          _el_expressionfactory = _jspxFactory.getJspApplicationContext(getServletConfig().getServletContext()).getExpressionFactory();
        }
      }
    }
    return _el_expressionfactory;
  }

  public org.apache.tomcat.InstanceManager _jsp_getInstanceManager() {
    if (_jsp_instancemanager == null) {
      synchronized (this) {
        if (_jsp_instancemanager == null) {
          _jsp_instancemanager = org.apache.jasper.runtime.InstanceManagerFactory.getInstanceManager(getServletConfig());
        }
      }
    }
    return _jsp_instancemanager;
  }

  public void _jspInit() {
  }

  public void _jspDestroy() {
  }

  public void _jspService(final javax.servlet.http.HttpServletRequest request, final javax.servlet.http.HttpServletResponse response)
      throws java.io.IOException, javax.servlet.ServletException {

    if (!javax.servlet.DispatcherType.ERROR.equals(request.getDispatcherType())) {
      final java.lang.String _jspx_method = request.getMethod();
      if ("OPTIONS".equals(_jspx_method)) {
        response.setHeader("Allow","GET, HEAD, POST, OPTIONS");
        return;
      }
      if (!"GET".equals(_jspx_method) && !"POST".equals(_jspx_method) && !"HEAD".equals(_jspx_method)) {
        response.setHeader("Allow","GET, HEAD, POST, OPTIONS");
        response.sendError(HttpServletResponse.SC_METHOD_NOT_ALLOWED, "JSP들은 오직 GET, POST 또는 HEAD 메소드만을 허용합니다. Jasper는 OPTIONS 메소드 또한 허용합니다.");
        return;
      }
    }

    final javax.servlet.jsp.PageContext pageContext;
    javax.servlet.http.HttpSession session = null;
    final javax.servlet.ServletContext application;
    final javax.servlet.ServletConfig config;
    javax.servlet.jsp.JspWriter out = null;
    final java.lang.Object page = this;
    javax.servlet.jsp.JspWriter _jspx_out = null;
    javax.servlet.jsp.PageContext _jspx_page_context = null;


    try {
      response.setContentType("text/html; charset=UTF-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;

      out.write("\r\n");
      out.write("\r\n");
      out.write("<!DOCTYPE html>\r\n");
 request.setCharacterEncoding("UTF-8"); 
      out.write("\r\n");
      out.write("<html>\r\n");
      out.write("<head>\r\n");
      out.write("<meta charset=\"UTF-8\">\r\n");
      out.write("<meta http-equiv=\"X-UA-Compatible\" content=\"IE=edge\">\r\n");
      out.write("<meta name='viewport' content='width=device-width, initial-scale=1'>\r\n");
      out.write("\r\n");

	String index = "0";

      out.write("\r\n");
      out.write("<title>글 쓰기</title>\r\n");
      out.write("<link href=\"./Resources/css/bootstrap.min.css\" rel=\"stylesheet\">\r\n");
      out.write("</head>\r\n");
      out.write("<body>\r\n");
      out.write("\t<br>\r\n");
      out.write("\t\r\n");
      out.write("\t<form id='create' class='form-inline justify-content-center' method=\"POST\" action='Control.jsp'>\r\n");
      out.write("\t\t<div class='d-flex flex-column'>\r\n");
      out.write("\t\t\t<div class='d-flex flex-row justify-content-end'>\r\n");
      out.write("\t\t\t\t<div class='p-2'>\r\n");
      out.write("\t\t\t\t\t<input type='hidden' name='action' value='create'>\r\n");
      out.write("\t\t\t\t\t<select class='form-control' name='tag' id='tag' style='width: 80px; text-align: center'>\r\n");
      out.write("\t\t\t\t\t\t<option value='유머'>유머</option>\r\n");
      out.write("\t\t\t\t\t\t<option value='공지'>공지</option>\r\n");
      out.write("\t\t\t\t\t\t<option value='정보'>정보</option>\r\n");
      out.write("\t\t\t\t\t</select> \r\n");
      out.write("\t\t\t\t</div>\r\n");
      out.write("\t\t\t\t<div class='p-2'>\r\n");
      out.write("\t\t\t\t\t제목: <input class='form-control' type='text' name='title' id='title' style='width: 340px;' placeholder='제목'> \r\n");
      out.write("\t\t\t\t</div>\r\n");
      out.write("\t\t\t</div>\r\n");
      out.write("\t\t\t\r\n");
      out.write("\t\t\t<div class='p-3 form-control test' style='width:485px; height:280px;'>\r\n");
      out.write("\t\t\t\t<label for='contents'></label>\r\n");
      out.write("\t\t\t\t<textarea class='pre' style='border:none; width:100%; height:100%;' id='contents' name='contents'\r\n");
      out.write("\t\t\t\tplaceholder=\"유머킹에서 글 작성시 유의사항!");
      out.print('\n');
      out.write("1. 타인 비방 글 금지");
      out.print('\n');
      out.write("2. 성적 발언, 혐오 발언 금지\"></textarea>\r\n");
      out.write("\t\t\t</div>\r\n");
      out.write("\t\t\t\r\n");
      out.write("\t\t</div>\r\n");
      out.write("\t</form>\r\n");
      out.write("\t<div class='d-flex flex-row justify-content-center' style='margin-left:330px;'>\r\n");
      out.write("\t\t<div class='pt-2 pr-2'><input type='button' class='btn btn-primary' onclick='Create()' value='게시하기'></div>\r\n");
      out.write("\t\t<div class='pt-2'><input type='button' class='btn btn-primary' onclick='BackToTable()' value='목록'></div>\r\n");
      out.write("\t</div>\r\n");
      out.write("\t\r\n");
      out.write("\t<form id='backToBoard' method=\"POST\" action='Control.jsp'>\r\n");
      out.write("\t\t<input type='hidden' name='action' value='read_board'>\r\n");
      out.write("\t\t<input type='hidden' name='index' value='");
      out.print(index);
      out.write("'>\r\n");
      out.write("\t</form>\r\n");
      out.write("\r\n");
      out.write("\t<script src=\"https://ajax.googleapis.com/ajax/libs/jquery/1.12.2/jquery.min.js\"></script>\r\n");
      out.write("\t<script src=\"./Resources/js/bootstrap.js\"></script>\r\n");
      out.write("\t<script>\r\n");
      out.write("\t\tfunction Create() {\r\n");
      out.write("\t\t\tif (document.getElementById(\"tag\").value == \"공지\") {\r\n");
      out.write("\t\t\t\tif (!");
      out.print(((String)(((Client)session.getAttribute("client")).getUsername())).equals("관리자"));
      out.write(") {\r\n");
      out.write("\t\t\t\t\talert(\"공지 태그는 관리자만 사용가능합니다.\");\r\n");
      out.write("\t\t\t\t}\r\n");
      out.write("\t\t\t} else {\r\n");
      out.write("\t\t\t\tdocument.getElementById(\"create\").submit();\r\n");
      out.write("\t\t\t}\r\n");
      out.write("\t\t}\r\n");
      out.write("\t\t\r\n");
      out.write("\t\tfunction BackToTable() {\r\n");
      out.write("\t\t\tdocument.getElementById(\"backToBoard\").submit();\r\n");
      out.write("\t\t}\r\n");
      out.write("\t</script>\r\n");
      out.write("</body>\r\n");
      out.write("</html>");
    } catch (java.lang.Throwable t) {
      if (!(t instanceof javax.servlet.jsp.SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          try {
            if (response.isCommitted()) {
              out.flush();
            } else {
              out.clearBuffer();
            }
          } catch (java.io.IOException e) {}
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
