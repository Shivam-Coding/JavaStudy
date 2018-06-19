<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="java.util.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Java Study</title>
</head>
<body>
<% HttpSession s = request.getSession(false);
try{
String name = (String)s.getAttribute("user");
out.println(name);
if(name.equals("")){
	out.println("<script>");
	out.println(" window.location='Welcome.jsp';");
	out.println("</script>");
}
}catch(Exception e){
	out.println("<script>");
	out.println(" window.location='Welcome.jsp';");
	out.println("</script>");
}

List l = (List)request.getAttribute("data");
if(l!= null){
Iterator it = l.iterator();
%>
<br>
<form action="JavaStudy" method="post" >
<input type="hidden" name="form" value="logout">
<input type="submit" value="Logout">
</form>
<br>
<center>
<table border="1" >
    
<tr>
    <th>Name</th>
    <th>Password</th> 
    <th>Phone Number</th>
  </tr>
<% 
while(it.hasNext()){
	String[] d = (String[])it.next();
	
	%>
	<tr>
	<td style = "padding:15px"><%= d[0] %></td>
	<td style = "padding:15px"><%= d[1] %></td>
	<td style = "padding:15px"><%= d[2] %></td>
	</tr>
<%	
}
}
%>
</table>
</center>
</body>
</html>