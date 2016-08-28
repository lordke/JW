<%@ page language="java" import="java.util.* ,com.students.dao.*,com.students.util.*" contentType="text/html; charset=utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
request.setCharacterEncoding("utf-8");
%>

<jsp:useBean id="newpost" class="com.students.util.Posts"></jsp:useBean>
<jsp:setProperty property="*" name="newpost"/>
<!-- javabean 获取post内容 -->

<%

  Postdao.postsave(newpost);  //调用postdao中的postsava方法 存储通知到数据库中
  response.sendRedirect("index.jsp");

 %>