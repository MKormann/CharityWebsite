<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
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
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/css/changepass.css"/>
<link rel='stylesheet' type='text/css' href='http://fonts.googleapis.com/css?family=Lato&subset=latin,latin-ext'>

<!-- jQuery link -->
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<!-- Bootstrap JS -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/js/bootstrap.min.js"></script>

<title>Change Password</title>
</head>
<body>
<div id="wrapper">
	<!-- navbar link-->
	<%@ include file="navbar.jsp"%>
	
	<div class="center">
	<h2>Change password</h2>
		<form:form name="entry" method="POST" action="changePass" commandName="userPasswordForm">
			<table>
				<tr>
					<td><form:label path="username">Username:</form:label></td>
					<td><form:input path="username" id="username"></form:input></td>
				</tr>
				<tr>
					<td><form:label path="oldPassword">Old password:</form:label></td>
					<td><form:input type="password" path="oldPassword" id="oldPassword"></form:input></td>
				</tr>
				<tr>
					<td><form:label path="newPassword">New password:</form:label></td>
					<td><form:input type="password" path="newPassword" id="newPassword"></form:input></td>
				</tr>
				<tr>
					<td><form:label path="confirmPassword">Confirm password:</form:label></td>
					<td><form:input type="password" path="confirmPassword" id="confirmPassword"></form:input></td>
				</tr>
				<tr>
					<td colspan="2"><input type="submit" value="Submit"/></td>
				</tr>
			</table>
		</form:form>
	</div>
		
	<!-- footer link-->
	<%@ include file="footer.jsp"%>
</div>

<script>
$(document).ready(function(){ 
	$("#username").focus();
	$("#username").val("");
	$("#newPassword").val("");
	$("#oldPassword").val("");
	$("#confirmPassword").val("");
});
</script>
</body>
</html>