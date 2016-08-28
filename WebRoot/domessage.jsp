<%@page import="com.students.dao.Msgdao"%>
<%@ page language="java" import="java.util.* ,com.students.dao.Userdao,com.students.util.User" contentType="text/html; charset=utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
request.setCharacterEncoding("utf-8");
%>

<jsp:useBean id="message" class="com.students.util.Msg"></jsp:useBean>
<jsp:setProperty property="*" name="message"/>

<% 

  int postid=Integer.parseInt(request.getParameter("postid"));
  Msgdao.Msgsave(message, postid);
  response.sendRedirect("posts.jsp?id="+postid);
  
  



%>