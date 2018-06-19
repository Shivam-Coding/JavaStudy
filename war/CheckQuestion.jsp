<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Java Study</title>
<link rel="stylesheet" type="text/css" href="mystyle.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>
<script>
function validateForm() {
    var x = document.forms["myform"]["questionNumber"].value;
    
 
    if (x == null || x == "") {
        alert("Field(s) empty!!");
        return false;
    }
}
</script>
</head>
<body class="container">
<div class="body" style="background-color:white;">
<center>
<div style="padding-top:8px; margin-top: 10px;">

<% String msg = (String)request.getAttribute("msg");
if(msg == null){ %>
<form action="JavaStudy" class ="formQuestion" method="post" name="myform" onsubmit="return validateForm()"> 
<input type="hidden" name="form" value="checkQuestion">
<input class="text" name="questionNumber" placeholder="Question Number">
<button class="button" type="submit" style="display:none; ">Enter</button>
<p></p>
</form>




<%}else {String[] d = (String[])request.getAttribute("data"); %>


	
	
	<div style="box-shadow: 1px 1px 4px grey; padding:10px; padding-top:1px; width: 80%">
	<div class="user">
	<p><%= d[3] %></p>
	</div>
	<h4>Question <%=msg %></h4>
	<div style="text-align: left; word-wrap: break-word;">
	<p><%= d[0] %></p>
	</div>
	<br>
	<%if(d[2].equalsIgnoreCase("objective")){ %>
	<input class="text" style="width:20%;">
	<button class="button" style="display:none; ">Answer</button>
	<%}else{ %>
	<button class="button">Answer</button>
	<%} %>
	<div style="display:none">
	<h4>Answer</h4>
	<p style="text-align: left;word-wrap: break-word;"><%=d[1] %></p>
	</div>
	<br>
	</div>
	<br>
	<br>
<%} %>


</div>
</center>
</div>
<script src="myjquery.js"></script>
</body>
</html>