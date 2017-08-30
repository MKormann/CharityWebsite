<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%> 
<%@ page isELIgnored="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

<!-- CSS stylesheet links -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/css/main.css"/>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/css/login.css"/>
<link rel='stylesheet' type='text/css' href='http://fonts.googleapis.com/css?family=Lato&subset=latin,latin-ext'>

<!-- jQuery link -->
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<!-- Bootstrap JS -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/js/bootstrap.min.js"></script>

<title>Login</title>

</head>
<body>
<div id="wrapper">	
	<!-- navbar link-->
	<%@ include file="navbar.jsp"%>

	<div class="center">
		<h2>Login:</h2>
		<form:form name="entry" method="POST" action="login" commandName="loginForm">
			<table>
				<tr>
					<td><form:label path="username">Username:</form:label></td>
					<td><form:input path="username" id="username"/></td>
				</tr>
				<tr>
					<td><form:label path="password">Password:</form:label></td>
					<td><form:input type="password" path="password" id="password" /></td>
				</tr>
				<tr>
					<td colspan="2"><input type="submit" value="Sign In"/></td>
				</tr>
			</table>
		</form:form>
		<ul>
			<li><a href=changepass>Forgot password?</a></li>
			<li><a href=register>Register</a></li>
		</ul>
		<h4 class="warningLabel" id="message">${message}</h4>
	</div>
	
	<!-- footer link-->
	<%@ include file="footer.jsp"%>
</div>
<script>
$(document).ready(function(){ 
	$("#username").focus();
	$("#username").val("");
	$("#password").val("");
});
</script>
</body>
</html>