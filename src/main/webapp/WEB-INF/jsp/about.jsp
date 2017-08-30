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
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/css/about.css"/>
<link rel='stylesheet' type='text/css' href='http://fonts.googleapis.com/css?family=Lato&subset=latin,latin-ext'>

<!-- jQuery link -->
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<!-- Bootstrap JS -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/js/bootstrap.min.js"></script>

<title>About Us</title>
</head>
<body>
<div id="wrapper">	
	<!-- navbar link-->
	<%@ include file="navbar.jsp"%>
	
	<h1>About Us</h1>
	
	<div class="text"><p>**Taken from www.alsa.org website as example text**<br><br>
	Established in 1985, The ALS Association is the only national non-profit organization fighting Lou Gehrig's 
	Disease on every front.  By leading the way in global research, providing assistance for people with ALS through
	a nationwide network of chapters, coordinating multidisciplinary care through certified clinical care centers, 
	and fostering government partnerships, The Association builds hope and enhances quality of life while 
	aggressively searching for new treatments and a cure.<br><br>

	As the preeminent ALS organization, The Association leads the way in research, care services, public education, 
	and public policy - giving help and hope to those facing the disease.  The Association's nationwide network of 
	chapters provides comprehensive patient services and support to the ALS community. The mission of The ALS 
	Association is to lead the fight to treat and cure ALS through global research and nationwide advocacy, while 
	also empowering people with Lou Gehrig's Disease and their families to live fuller lives by providing them with 
	compassionate care and support.</p></div>
	
	<div class="imgContainer"><img src="<%=request.getContextPath()%>/resources/images/about.jpg"></div>
	
	<!-- footer link-->
	<%@ include file="footer.jsp"%>
</div>
</body>
</html>