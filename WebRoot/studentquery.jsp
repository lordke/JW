<%@ page language="java" import="java.util.* ,com.students.dao.*,com.students.util.*" contentType="text/html; charset=utf-8"%>
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
             
             System.out.println("isuser "+Userdao.isuser(a));
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
	<meta charset="UTF-8">
	<title>西安电子科技大学班级信息发布系统</title>
	<link rel="stylesheet" href="style/style.css">
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
	<div class='querry'>
		<h2> 学生信息查询</h2>
		<label>请输入姓名：<input type="text" name="name" id='name'/></label>
		<label>请输入学号：<input type="text" name="ID" id='id'/></label>
		<label><input type="submit" value="根据姓名查询" id='submit'></label>
		<label><input type="submit" value="根据学号查询" id='submit2'></label>
		<div class="content"></div>
		
	</div>
	
	<script type="text/javascript" src='js/query.js'></script>
</body>
</html>
