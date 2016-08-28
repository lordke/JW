<%@page import="java.io.PrintWriter"%>
<%@ page language="java" import="java.util.* ,com.students.dao.*,com.students.util.*,java.text.DecimalFormat" contentType="text/html; charset=utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
request.setCharacterEncoding("utf-8");
%>

<%
	DecimalFormat df1 = new DecimalFormat("#"); 
	String query = null;
	if(request.getParameter("id") != null) {
		query="id="+request.getParameter("id");
	}
	else if(request.getParameter("name") !=null) 
	{
		query="name="+"\""+request.getParameter("name")+"\"";
	}
	System.out.println(query);
	Student a =Studentdao.squery(query);
	String str="" ;
	str = " <student>" +"<id>" + df1.format(a.getId()) + "</id>" +
                                "<姓名>" + a.getName() + "</姓名>" +
                                "<性别>" + a.getSex() + "</性别>" +
                                "<班级>" + df1.format(a.getClasses()) + "</班级>" +
                                "<专业>" + a.getCollage() + "</专业>" +
                                "</student>";
    str = "<?xml version=\"1.0\" encoding=\"UTF-8\"?><school>" + str + "</school>";
 
	response.setContentType("application/xml");
	PrintWriter b =response.getWriter();
	b.print(str);


 %>