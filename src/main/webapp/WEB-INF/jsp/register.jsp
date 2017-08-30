<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%> 
<%@ page isELIgnored="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

<!-- CSS stylesheet links -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/css/main.css"/>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/css/register.css"/>
<link rel='stylesheet' type='text/css' href='http://fonts.googleapis.com/css?family=Lato&subset=latin,latin-ext'>

<!-- jQuery link -->
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<!-- Bootstrap JS -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/js/bootstrap.min.js"></script>

<script src="<%=request.getContextPath()%>/resources/js/form.js"></script>

<title>User Registration</title>
</head>
<body>
<div id="wrapper">
	
	<!-- navbar link-->
	<%@ include file="navbar.jsp"%>
	
	<div class="center">
		<h2>Register new user</h2>
		<form:form name="entry" method="POST" action="register" commandName="userRegForm">
			<table>
				<tr>
					<td><form:label path="firstName">First name:</form:label></td>
					<td><form:input path="firstName" id="firstName"/></td>
				</tr>
				<tr>
					<td><form:label path="lastName">Last name:</form:label></td>
					<td><form:input path="lastName" id="lastName"/></td>
				</tr>
				<tr>
					<td><form:label path="email">Email:</form:label></td>
					<td><form:input path="email" id="email"/></td>
				</tr>
				<tr>
					<td><form:label path="username">Username:</form:label></td>
					<td><form:input path="username" id="username"/></td>
				</tr>
				<tr>
					<td><form:label path="password">Password:</form:label></td>
					<td><form:input type="password" path="password" id="password" /></td>
				</tr>
				<tr>
					<td><form:label path="confirm">Confirm password:</form:label></td>
					<td><form:input type="password" path="confirm" id="confirm" /></td>
					<td class="passInput">
						<h4 class="errorMessage" id="passMessage"></h4>	
					</td>
				</tr>
				<tr>
					<td colspan="2"><input type="submit" value="Submit" id="submit"/></td>
				</tr>
			</table>
		</form:form>
		<h4 class="warningLabel">${message }</h4>
	</div>
		
	<!-- footer link-->
	<%@ include file="footer.jsp"%>
</div>
<script>
$(document).ready(function(){ 
	$("#submit").disable();
	$("#firstName").focus();
	$("#password").val("");
	$("#confirm").val("");
	$("#confirm, #password").on("input", function() {
		if ($("#password").val() != $("#confirm").val()) {
			$("#passMessage").text("*Passwords must match.");
		} else {
			$("#passMessage").text("");
		}
	});
//	$("#confirm").on("keyup", comparePass($("#password"), $("#confirm"), $("passWarning")));
});
</script>
</body>
</html>