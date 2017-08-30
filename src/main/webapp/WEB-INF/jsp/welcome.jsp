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
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/css/welcome.css"/>
<link rel='stylesheet' type='text/css' href='http://fonts.googleapis.com/css?family=Lato&subset=latin,latin-ext'>

<!-- jQuery link -->
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<!-- Bootstrap JS -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/js/bootstrap.min.js"></script>

<title>Non-Profit Example Site</title>
</head>
<body>
<div id="wrapper">	
	<!-- navbar link-->
	<%@ include file="navbar.jsp"%>
	
	<div>
	  <h1>Example Non-profit Website!</h1>
	  <p>Welcome to our test website.  Here you would normally find some useful information <br>
	  on the organization before heading off to explore the site.</p>
	</div>
	<div class="carousel slide" data-ride="carousel">
	  <!-- Indicators -->
	  <ol class="carousel-indicators">
	    <li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
	    <li data-target="#carousel-example-generic" data-slide-to="1"></li>
	    <li data-target="#carousel-example-generic" data-slide-to="2"></li>
	  </ol>
	
	  <!-- Wrapper for slides -->
	  <div class="carousel-inner" role="listbox">
	    <div class="item active">
	      <img class="welcomeImage" src="<%=request.getContextPath()%>/resources/images/carousel1.jpg" alt="...">
	      <div class="carousel-caption">
	        Picture #1
	      </div>
	    </div>
	    <div class="item">
	      <img src="..." alt="...">
	      <div class="carousel-caption">
	        Picture #2
	      </div>
	    </div>
	    ...
	  </div>
	
	  <!-- Controls -->
	  <a class="left carousel-control" href="#carousel-example-generic" role="button" data-slide="prev">
	    <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
	    <span class="sr-only">Previous</span>
	  </a>
	  <a class="right carousel-control" href="#carousel-example-generic" role="button" data-slide="next">
	    <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
	    <span class="sr-only">Next</span>
	  </a>
	</div>
	
	<!-- footer link-->
	<%@ include file="footer.jsp"%>
</div>
</body>
</html>