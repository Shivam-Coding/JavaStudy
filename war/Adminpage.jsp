<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Java Study</title>

</head>
<body >
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
%>
<br>
<form action="JavaStudy" method="post" >
<input type="hidden" name="form" value="logout">
<input type="submit" value="Logout">
</form>
<br>
<div>
<a href="Search.jsp">Search</a>
<a href="Adduser.jsp">Add</a>
<a href="Questions.jsp">Post Questions</a>
</div>
</body>
</html>