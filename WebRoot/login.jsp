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
	if(islogin){
		response.sendRedirect("index.jsp");
	}

 %>
<!DOCTYPE>
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>用户登录</title>
    
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
	<div class='login'>
		<form method="post" action="dologin.jsp">
			<h3>&nbsp;&nbsp;&nbsp;用户登录</h3>
			<label>用户名 :&nbsp; <input type="text" name="username" id='username'></label>
			<label>密码：&nbsp;&nbsp;&nbsp;  <input type="password"  id='password' name='password'></label>
			<label><input type="submit" value="点击提交" id='submit'></label>

		</form>
	</div>>
  </body>
</html>
