<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>
<script src="ajaxQuestions.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Java Study</title>
<script>
function validateForm() {
    var x = document.forms["myform"]["question"].value;
    var y = document.forms["myform"]["answer"].value;
 
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
<link rel="stylesheet" type="text/css" href="mystyle.css">
</head>
<body class="container" onLoad="noBack();" onpageshow="if (event.persisted) noBack();">
<% 

response.setHeader("Cache-Control","no-cache");
response.setHeader("Cache-Control","no-store");
response.setDateHeader("Expires", 0);
response.setHeader("Pragma","no-cache");
%>
<div class="body" style="background-color:white;">
<center>
<div>
<form action="#" class ="formQuestion" method="post" name="myform" onsubmit="return validateForm()">
<!--  <input type="hidden" name="form" value="questions"> -->
<h4>Question:</h4>
<input type="radio" name="choice" value="subjective" checked /> Subjective &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
<input type="radio" name="choice" value="objective"/> Objective 
<br/>
<br/>
<textarea class="text" rows="20" cols="120" name="question" style="resize: none;word-wrap: break-word;"></textarea>
<br>
<h4>Answer:</h4>
<br>
<textarea class="text" rows="20" cols="120" name="answer" style="resize: none;word-wrap: break-word;"></textarea>
<br>
<button class="button" type="submit" style="margin-top: 30px; margin-bottom: 30px;">Post</button>
</form>

</div>
</center>
</div>

<script src="myjquery.js"></script>
</body>
</html>