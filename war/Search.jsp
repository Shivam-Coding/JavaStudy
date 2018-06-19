<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Java Study</title>
<script>
function validateForm() {
    var x = document.forms["myform"]["search"].value;
    if (x == null || x == "" ) {
        alert("Field empty!!");
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
<input type="hidden" name="form" value="search">
Number <input name="number"><br/>
<input type="submit" value="search">

</form>
</body>
</html>