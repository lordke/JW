<%@ page language="java" import="java.util.*,com.students.dao.*,com.students.util.*" contentType="text/html; charset=utf-8"%>
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

 %>


<%
	int postid = Integer.parseInt(request.getParameter("id"));
	Posts  post=Postdao.getpost(postid);
	
	 
 %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
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
	
	<div class='post'>
		<h2><%=post.getTitle() %></h2>
		<p>发布者：<%= post.getAuthor() %></p>	
		<p><%=post.getPost() %></p>
		<div class="board">
		<h3>-----留言板-------</h3>
<% if(islogin){ %>
		<form action="domessage.jsp" method="post">
		<textarea class="boardtext" name="message"></textarea>		
		<input type="text" value=<%= postid%> name="postid" style="display:none">
		<input type="text" value=<%= session.getAttribute("username")%> name="author" style="display:none">
		<input type="submit" value="点击提交"/>
		</form>
		<hr/>
<% } %>		
		<%  for(Msg a:post.getMsgs()){ %>
		<div class='message'>
		<p class='author'>留言人：<%= a.getAuthor() %></h3>
		<p class= 'mes'><%= a.getMessage() %></p>
		<hr/>
		</div>
		<% } %>
		</div>
			
	</div>>
</body>
</html>
