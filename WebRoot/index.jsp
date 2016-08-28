<%@page import="com.students.dao.Postdao"%>
<%@ page language="java" import="java.util.*,com.students.dao.*,com.students.util.*" contentType="text/html; charset=utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%
	Boolean islogin =null;
	//若session中包含用户名，则说明用户已经登录  
	if(session.getAttribute("username")!=null){  
		 islogin=true;
	}
	else{
		Cookie[] cookies = request.getCookies(); //获取Cookie文件
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
             //如果Cookie中存储的用户名和密码正确，则实现自动登录功能
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


<!DOCTYPE>
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>西安电子科技大学信息发布系统</title>
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
<% if(islogin){  //根据用户登录状态展示不同的导航栏 %> 
				
				<li><a href="logout.jsp">登出</a></li>
<% }  else {%>
				<li><a href="login.jsp">登录</a></li>

<% } %>
			</ul>
		</nav>
	</header>
	<article>
		<div>
<!-- 实现登陆成功和登出成功 提醒 -->
<%  if( session.getAttribute("suc")!=null && (Boolean)session.getAttribute("suc")==true){ %>
			<h2>登陆成功，欢迎你，<%=session.getAttribute("username") %></h2>
<% session.setAttribute("suc", false); }%>
<%	 if( session.getAttribute("out")!=null && (Boolean)session.getAttribute("out")==true){ %>
			<h2>退出登录成功</h2>
<% session.setAttribute("out", false); }%>

<%  ArrayList<Posts> postlist =Postdao.getposts(); 
	//获取所用通知并展示
	for(Posts po:postlist){ 
	int id = po.getId();
 %>

			
			<h2><a href="posts.jsp?id=<%=id %>"><%=po.getTitle() %></a></h2>
			<p>发布者：<%= po.getAuthor() %></p>	
<% } %>
		</div>
	</article>>
  </body>
</html>
