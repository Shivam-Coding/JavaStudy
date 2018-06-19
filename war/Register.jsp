<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" type="text/css" href="mystyle.css">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Registration</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>
<script>
function validateForm() {
    var x = document.forms["myform"]["username"].value;
    var y = document.forms["myform"]["password"].value;
    var z = document.forms["myform"]["firstname"].value;
    var w = document.forms["myform"]["lastname"].value;
    document.forms["myform"]["username"].style.border = "1px double #DDD";
    document.forms["myform"]["password"].style.border = "1px double #DDD";
    document.forms["myform"]["firstname"].style.border = "1px double #DDD";
    document.forms["myform"]["lastname"].style.border = "1px double #DDD";
    document.getElementById("error").innerHTML="";
    
    if(z == null || z == ""){
    	document.forms["myform"]["firstname"].style.border = "1px double #FF0000";
    	document.getElementById("error").innerHTML = "First name empty !!!";
        return false;
    }
    if(w == null || w == ""){
    	document.forms["myform"]["lastname"].style.border = "1px double #FF0000";
    	document.getElementById("error").innerHTML = "Last name empty !!!";
        return false;
    }
    if (x == null || x == "") {
    	document.forms["myform"]["username"].style.border = "1px double #FF0000";
    	document.getElementById("error").innerHTML = "e-mail empty !!!";
        return false;
    }else{
   	 var atpos = x.indexOf("@");
	    var dotpos = x.lastIndexOf(".");
	    if (atpos<1 || dotpos<atpos+2 || dotpos+2>=x.length) {
	    	document.forms["myform"]["username"].style.border = "1px double #FF0000";
	    	document.getElementById("error").innerHTML = "e-mail invalid !!!";
	        return false;
	}
 }
    
    if(y==null || y==""){
    	 document.forms["myform"]["password"].style.border = "1px double #FF0000";
    	 document.getElementById("error").innerHTML = "Password empty !!!";
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
String msg = (String)request.getAttribute("msg");
response.setHeader("Cache-Control","no-cache");
response.setHeader("Cache-Control","no-store");
response.setDateHeader("Expires", 0);
response.setHeader("Pragma","no-cache");
%>

<center>


<div class="login" style="padding-top:8px;margin-top: -190px;">
<form action="JavaStudy" method="post" name="myform" onsubmit="return validateForm()">
<input type="hidden" name="form" value="add">
<p style="font-size:25px;">Java Study</p>
<p id="error" style="color:#FF0000;"><%if(msg != null){out.print(msg);} %></p>
<table>
<tr>
<td>First Name:</td>
<td><input class="text" name="firstname" placeholder="First Name" id="firstname"></td>
</tr>
<tr>
<td>Last Name:</td>
<td><input class="text" name="lastname" placeholder="Last Name" style="margin-top:10px; margin-bottom:10px;"></td>
</tr>
<tr>
<td>E-mail:</td>
<td><input class="text" name="username" placeholder="e-mail" id="username"></td>
</tr>
<tr>
<td>Password:</td>
<td> <input class="text" type="password" name="password" style="margin-top:10px; margin-bottom:10px;" placeholder="Password"></td>
</tr>
<tr >
<td colspan="2" align="center">
<a href="Welcome.jsp">Login</a>
</td></tr><tr><td colspan="2">
<input class="button" type="submit" value="Register" style="width:300px">
</td>
</tr>
</table>
</form>
</div>
</center>

</body>
</html>