<%@ page language="java" import="java.util.* ,com.students.dao.*,com.students.util.*" contentType="text/html; charset=utf-8"%>
<%
request.setCharacterEncoding("utf-8");
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<jsp:useBean id="newstudent" class="com.students.util.Student"></jsp:useBean>
<jsp:setProperty property="*" name="newstudent"/>

<%
	
	String type =request.getParameter("type");
	if(type.equals("update")){
		Studentdao.update(newstudent);
		session.setAttribute("update", true);
		response.sendRedirect("restudent.jsp");
	}
	if(type.equals("new")){
		Studentdao.creatnew(newstudent);
		session.setAttribute("new", true);
		response.sendRedirect("restudent.jsp");
	}
	if(type.equals("delete")){
		double id=newstudent.getId();
		Studentdao.deleteone(id);
		session.setAttribute("delete", true);
		response.sendRedirect("restudent.jsp");
	}




 %>

