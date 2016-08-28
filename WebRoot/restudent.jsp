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
    <base href="<%=basePath%>">
    
    <title>学生信息修改</title>
    
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
	<div class='re'>
<% if(session.getAttribute("update")!=null){ %>
		<h3 class="me">恭喜你修改信息成功</h3>
<% session.removeAttribute("update");}%>
<% if(session.getAttribute("new")!=null){ %>
		<h3 class="me">恭喜你新增学生信息成功</h3>
<% session.removeAttribute("new");}%>
<% if(session.getAttribute("delete")!=null){ %>
		<h3 class="me">恭喜你删除学生信息成功</h3>
<% session.removeAttribute("delete");}%>
	
		<h2>修改学生信息</h2>
		<form method="post" action="re.jsp" >
			<label>请输入所修改学生的学号：<input type="text" name="id" id='id'></label>
			<label>姓名：<input type="text" name="name" id='name'></label>
			<label>性别：<input type="text" name="sex" id='sex'></label>
			<label>班级：<input type="text" name="classes" id='class'></label>
			<label>专业：<input type="text" name="collage" id='collage'></label>			
			<input type="text" style="display:none" name="type" value="update">
			<label><input type="submit" value="确认修改" id='submit'></label>
		</form>
		<h2>新增学生</h2>
		<form method="post" action="re.jsp" >
			<label>请输入新添加学生的学号：<input type="text" name="id" id='id1'></label>
			<label>姓名：<input type="text" name="name" id='name1'></label>
			<label>性别：<input type="text" name="sex" id='sex1'></label>
			<label>班级：<input type="text" name="classes" id='class1'></label>
			<label>专业：<input type="text" name="collage" id='collage1'></label>
			<input type="text" style="display:none" name="type" value="new">
			<label><input type="submit" value="确认添加" id='submit1'></label>
		</form>
		<h2>删除学生</h2>
		<form method="post" action="re.jsp" >
			<label>请输入删除学生的学号：<input type="text" name="id" id='id2'></label>
			<input type="text" style="display:none" name="type" value="delete">
			<label><input type="submit" value="确认删除" id='submit2'></label>
		</form>


		
	</div>
</body>
</html>
