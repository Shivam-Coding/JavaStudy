<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" type="text/css" href="mystyle.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Java Study</title>
<script>
function validateForm() {
    var x = document.forms["myform"]["old"].value;
    var y = document.forms["myform"]["newpassword"].value;
 
    if (x == null || x == "" || y==null || y=="" ) {
        alert("Field(s) empty!!");
        return false;
    }
}
</script>
<script type="text/javascript">
        window.history.forward();
        function noBack()
        {
            window.history.forward();
        }
</script>

</head>




<body class="container" onLoad="noBack();" onpageshow="if (event.persisted) noBack();">
<% 
response.setHeader("Cache-Control","no-cache");
response.setHeader("Cache-Control","no-store");
response.setDateHeader("Expires", 0);
response.setHeader("Pragma","no-cache");

HttpSession s = request.getSession(false);
String name="";
try{
name = (String)s.getAttribute("user");
if(!name.equals("")){
}else{
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

<div class="menu">
<div class="nav" >
<strong><%=name %></strong>

<ul>
  <li><a href="JavaStudy?form=logout">Logout</a></li>
  <li><a href="Newpassword.jsp">Change Password</a></li>
  <li><a href="JavaStudy?form=notesdata">Notes</a></li>
  <li><a href="JavaStudy?form=userdata">Home</a></li>
</ul>
</div>
</div>


<div class="login">
<form action="JavaStudy" method="post" name="myform" onsubmit="return validateForm()">
<input type="hidden" name="form" value="changepassword">
<table>
<tr>
<td>Old Password </td>
<td><input class="text" type="password" name="old" ></td>
</tr>
<tr >
<td>Password</td>
<td> <input class="text" type="password" name="newpassword" style="margin-top:10px; margin-bottom:10px;"></td>
</tr>
<tr >
<td colspan="2">

<input class="button" type="submit" value="Change" style="width:300px">
</td>
</tr>
</table>
</form>
</div>

<script src="myjquery.js"></script>
</body>
</html>