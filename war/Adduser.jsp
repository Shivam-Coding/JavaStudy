<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Java Study</title>
<script>
function validateForm() {
    var x = document.forms["myform"]["name"].value;
    var y = document.forms["myform"]["password"].value;
    var z = document.forms["myform"]["number"].value;
    if (x == null || x == "" || y==null || y=="" ||z==null || z=="") {
        alert("Field(s) empty!!");
        return false;
    }
}
</script>
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
%>
<br>
<form action="JavaStudy" method="post" >
<input type="hidden" name="form" value="logout">
<input type="submit" value="Logout">
</form>
<br>
<form action="JavaStudy" method="post" name="myform" onsubmit="return validateForm()">
<input type="hidden" name="form" value="add">
<center>
<table>
<tr>
<td>Name</td>
<td><input name="name"></td>
</tr>
<tr>
<td>Number</td>
<td><input name="number"></td>
</tr>
<tr>
<td>Password</td>
<td><input name="password"></td>
</tr>
<tr>
<td colspan="2">
<center>
<input type="submit" value="Add"></td>
</center>
</tr>
</table>
</center>
</form>
</body>
</html>