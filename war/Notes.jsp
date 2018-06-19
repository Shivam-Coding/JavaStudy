<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@page import="java.util.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" type="text/css" href="mystyle.css">
<link rel="stylesheet" type="text/css" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.6.3/css/font-awesome.min.css">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Notes</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>
<script src="ajaxQuestions.js"></script>
<script type="text/javascript">
$(document).ready(function(){
$(".addbutton").click(function(){
	if($( '.note' ).is(":visible")){
        $( '.note' ).hide();
        $(this).css("padding-right","21px");
        $(this).css("padding-left","21px");
        $(this).text('+')
        $('.noteBack').fadeTo("slow",1);
   } else{
        $( '.note' ).show();
        $(this).text('x')
        $(this).css("padding-right","23px");
        $(this).css("padding-left","23px");
        $('.noteBack').fadeTo("slow",0.05);
   }
});
});
</script>


<script type="text/javascript">
        window.history.forward();
        function noBack()
        {
            window.history.forward();
        }
</script>
<script>
function validateForm() {
    var x = document.forms["noteform"]["note"].value;
 
    if (x == null || x == "") {
        alert("Field empty!!");
        return false;
    }
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
String name="", email="";
try{
name = (String)s.getAttribute("user");
email = (String)s.getAttribute("email");
if(!name.equals("")){
}else{
	out.println("<script>");
	out.println(" window.location='Welcome.jsp';");
	out.println("</script>");
}
List l = (List)request.getAttribute("data");
if(!l.equals(null)){
Iterator it = l.iterator();
int c = l.size();

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


<div class="body">
<center>
<% 
while(it.hasNext()){
	String[] d = (String[])it.next();
	
	%>
	<div class="noteBack" style="box-shadow: 1px 1px 4px grey; padding:7px; padding-top:1px; width: 60%">
	<div class="user">
	<p><%= d[1] %></p>
	</div>
	<br/>
	<h4>Note <%=c %></h4>
	
	<div style="text-align: left; word-wrap: break-word;">
	
	<p><%= d[0] %></p>
	</div>
	<%if(d[2].equals(email)) {%>
	<div align="right">
	
<a class="btn btn-danger" onclick="return confirm('Are you sure?')" href="Delete?content=note&id=<%=d[3]%>">
  <i class="fa fa-trash-o" title="Delete" aria-hidden="true"></i>
  <span class="sr-only">Delete</span>
</a>
</div>
<%} %>
	</div>
	<br>
	<br>
	
	
	<%  c-- ;}
} %>
	
<div class="note" style="text-align:center">
<form action="#" method="post" class="notesForm" name="noteform" onsubmit="return validateForm()">
<textarea rows="20" cols="70" name="note"></textarea>
<br>
<button class="button" type="submit">Post</button>
</form>
</div>

<%	
}catch(Exception e){
	out.println("<script>");
	out.println(" window.location='Welcome.jsp';");
	out.println("</script>");
}
%>


</center>
</div>
<button class="addbutton">+</button>
<script src="myjquery.js"></script>

</body>
</html>