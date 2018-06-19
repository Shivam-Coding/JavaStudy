<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Java Study</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>
<script>

$( document ).ready(function() {
	window.location.href="Welcome.jsp";
});

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
<br>
<br>
<a href="Welcome.jsp">
<button>Login</button>
</a>


</body>
</html>