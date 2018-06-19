<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" type="text/css" href="mystyle.css">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Java Study</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>
<script>
function validateForm() {
    var x = document.forms["myform"]["username"].value;
    var y = document.forms["myform"]["password"].value;
 
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
<body onLoad="noBack();" onpageshow="if (event.persisted) noBack();">
<%
response.setHeader("Cache-Control","no-cache");
response.setHeader("Cache-Control","no-store");
response.setDateHeader("Expires", 0);
response.setHeader("Pragma","no-cache");
%>
<center>


<div class="login" style="padding-top:8px;margin-top: -140px;">
<form action="JavaStudy" method="post" name="myform" onsubmit="return validateForm()">
<input type="hidden" name="form" value="login">
<p style="font-size:25px;">Java Study</p>
<table>
<tr>
<td>E-mail</td>
<td><input class="text" name="username" placeholder="e-mail"></td>
</tr>
<tr>
<td>Password</td>
<td> <input class="text" type="password" name="password" style="margin-top:10px; margin-bottom:10px;" placeholder="Password"></td>
</tr>
<tr >
<td colspan="2" align="center">
<a href="Register.jsp">Register</a>
</td></tr><tr><td colspan="2">
<input class="button" type="submit" value="Login" style="width:300px">
</td>
</tr>
</table>
</form>
</div>
</center>

</body>
</html>