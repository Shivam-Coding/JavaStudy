<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="java.util.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Java Study</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>
<link rel="stylesheet" type="text/css" href="mystyle.css">
</head>
<body class="container">

<%

List l = (List)request.getAttribute("data");
if(!l.equals(null)){
Iterator it = l.iterator();
int c = l.size();

%>


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
	</div>
	<br>
	<br>
	
	
	<%  c-- ;}
} %>
	
</center>
</div>

<script src="myjquery.js"></script>

</body>
</html>