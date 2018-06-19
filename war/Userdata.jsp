<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="java.util.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Java Study</title>
<link rel="stylesheet" type="text/css" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.6.3/css/font-awesome.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>
<script type="text/javascript">
$(document).ready(function(){
$(".addbutton").click(function(){
	if($( '.post_question' ).is(":visible")){
        $( '.post_question' ).hide();
        $(this).css("padding-right","21px");
        $(this).css("padding-left","21px");
        $(this).text('+');
        window.location.href="JavaStudy?form=userdata";
        $('.body').css("background-color","white");
        $('.body').fadeTo("fast",1);
        
        
   } else{
        $( '.post_question' ).show();
        $(this).text('x')
        $(this).css("padding-right","23px");
        $(this).css("padding-left","23px");
        $('.body').css("background-color","black");
        $('.body').fadeTo("slow",0.5,function(){
        $('.body').css("background-color","black");
        });
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
<link rel="stylesheet" type="text/css" href="mystyle.css">
</head>
<body class="container" onLoad="noBack();" onpageshow="if (event.persisted) noBack();">

<div>

<% 
response.setHeader("Cache-Control","no-cache");
response.setHeader("Cache-Control","no-store");
response.setDateHeader("Expires", 0);
response.setHeader("Pragma","no-cache");

HttpSession s = request.getSession(false);
try{
String name = (String)s.getAttribute("user");
String email = (String)s.getAttribute("email");
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

<div class="body" >
<center>
<% 
while(it.hasNext()){
	String[] d = (String[])it.next();
	
	%>
	<div style="box-shadow: 1px 1px 4px grey; padding:10px; padding-top:1px; width: 80%">
	<div class="user">
	<p><%= d[3] %></p>
	</div>
	<br/>
	<h4>Question <%=c %></h4>
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
	
	
<%if(d[4].equals(email)) {%>
	<div align="right">
	
<a class="btn btn-danger" onclick="return confirm('Are you sure?')" href="Delete?content=question&id=<%=d[5]%>">
  <i class="fa fa-trash-o" title="Delete" aria-hidden="true"></i>
  <span class="sr-only">Delete</span>
</a>
</div>
<%} %>
	</div>
	<br>
	<br>
	
<%	
c--;
}
}
}catch(Exception e){
	out.println("<script>");
	out.println(" window.location='Welcome.jsp';");
	out.println("</script>");
}
%>

</center>
</div>

<div style="margin-left: 5%;">
<iframe class="post_question" frameborder="0" height="80%" width="90%" align="middle" src="Questions.jsp">
</iframe>
</div>

<script src="myjquery.js"></script>
</div>
<button class="addbutton">+</button>
</body>
</html>