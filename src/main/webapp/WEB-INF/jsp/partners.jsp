<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page isELIgnored="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

<!-- CSS stylesheet links -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/css/main.css"/>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/css/partners.css"/>
<link rel='stylesheet' type='text/css' href='http://fonts.googleapis.com/css?family=Lato&subset=latin,latin-ext'>

<!-- jQuery link -->
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<!-- Bootstrap JS -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/js/bootstrap.min.js"></script>

<title>Partners</title>
</head>
<body>
<div id="wrapper">	
	<!-- navbar link-->
	<%@ include file="navbar.jsp"%>
	
	<h1>Our Partners</h1>
	
	<div class="text"> 
		<p>All of our partners have generously contributed to our cause through various donations and volunteering
		</p>
	</div>
	
	
	<div class="imgContainer">
		<img class="image" src="<%=request.getContextPath()%>/resources/images/donate.jpg">
	</div>
	
	
	<!-- footer link-->
	<%@ include file="footer.jsp"%>
</div>
</body>
</html>