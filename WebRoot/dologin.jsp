<%@ page language="java" import="java.util.* ,com.students.dao.Userdao,com.students.util.User" contentType="text/html; charset=utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
request.setCharacterEncoding("utf-8");
%>


<jsp:useBean id="myuser" class="com.students.util.User"></jsp:useBean>
<jsp:setProperty property="*" name="myuser"/> <!--  读取表单传输的用户名密码 -->
<% 
	
	if(Userdao.isuser(myuser))
	{
		
		session.setAttribute("suc", true);
		//session实现登陆成功提醒
		session.setAttribute("username", myuser.getUsername());
		//登陆成功，在Cookie中存储用户名与密码，实现自动登录
		Cookie usernamecookie = new Cookie("username",myuser.getUsername());
		Cookie passwordcookie = new Cookie("password",myuser.getPassword());
		//设置Cookie生存时间为10天
		usernamecookie.setMaxAge(60*60*24*10);
		passwordcookie.setMaxAge(60*60*24*10);
		response.addCookie(usernamecookie);
		response.addCookie(passwordcookie);
		response.sendRedirect("index.jsp"); //重定向到主页
	    
		
	}
	else{
	   out.println("登录失败");
	}



 %>
