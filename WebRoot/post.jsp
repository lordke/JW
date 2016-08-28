<%@ page language="java" import="java.util.*,com.students.dao.Userdao,com.students.util.User" contentType="text/html; charset=utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%
	Boolean islogin =null;
	if(session.getAttribute("username")!=null){
		 islogin=true;
	}
	else{
		Cookie[] cookies = request.getCookies();
          if(cookies!=null&&cookies.length>0)
          {
          	User a= new User();
             for(Cookie c:cookies)
             {
                if(c.getName().equals("username"))
                {
                    a.setUsername(c.getValue());
               
                }
                if(c.getName().equals("password"))
                {
                	a.setPassword(c.getValue());
                }
             }
             if(Userdao.isuser(a)){
             	session.setAttribute("username", a.getUsername());
             	islogin = true;
             	
             }
             else{
             	islogin =false;
             }
             
          }
          else islogin = false;
	
	}

	if(!(islogin)){  response.sendRedirect("login.jsp");};
  %>



<!DOCTYPE>
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'index.jsp' starting page</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link rel="stylesheet" type="text/css" href="style/style.css">
	
  </head>
  		
  <body>
    <header>
		<nav>
			<ul>
				<li><a href="index.jsp">主页</a></li>
				<li><a href="post.jsp">发布信息</a></li>
				<li><a href="studentquery.jsp">查询学生</a></li>
				<li><a href="restudent.jsp">管理学生</a></li>
<% if(islogin){ %>
				
				<li><a href="logout.jsp">登出</a></li>
<% }  else {%>
				<li><a href="login.jsp">登录</a></li>

<% } %>
			</ul>
		</nav>
	</header>
	</header>
	<div class='post'>
		<h2>班级信息发布</h2>
		<form method="post" action="dopost.jsp">
			<input type="text" name="title" value='请输入题目'/>
			<textarea name='post'>请输入通知内容</textarea>
			<input type="text" style="display:none" name="author" value=<%= session.getAttribute("username") %> />
			<input type="submit" value="点击提交">
		</form>
			
	</div>>
</body>
</html>
