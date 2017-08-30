<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

<!-- CSS stylesheet links -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/css/main.css"/>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/css/overview.css"/>
<link rel='stylesheet' type='text/css' href='http://fonts.googleapis.com/css?family=Lato&subset=latin,latin-ext'>

<!-- jQuery link -->
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<!-- Bootstrap JS -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/js/bootstrap.min.js"></script>
	
<title>Account Overview</title>
</head>
<body>
<div id="wrapper">
	<!-- link to navbar -->
	<%@ include file="navbar.jsp"%>
	
		<h1>${user.firstName } ${user.lastName }</h1>
		<h3>Team ${user.lastName }</h3>
		
		<div class="buttons">
			<button type="button" class="btn btn-default">Donate</button>
			<button type="button" class="btn btn-default">Edit Profile</button>
			<button type="button" class="btn btn-default">Donate</button>
		</div>
		
		<section>
			<div id="leftSection">
				<h4>Your Team's Donors:</h4>
				<div class="donationList">
					<table>
						<c:forEach var="donation" items="${teamDonations }" varStatus="i">
							<tr>
								<td class="donor">${i.index + 1}. ${donation.name }</td>
								<td class="amount"><fmt:formatNumber value="${donation.donation}" type="currency"/></td>
							</tr>
						</c:forEach>
					</table>
				</div>
			</div>
			<div id="rightSection">
				<h4>Top Team Donations:</h4>
				<div class="donationList">
					<table>
						<c:forEach var="donation" items="${teamTotals }" varStatus="i">
							<tr>
								<td class="donor">${i.index + 1}. ${donation.name }</td>
								<td class="amount"><fmt:formatNumber value="${donation.donation}" type="currency"/></td>
							</tr>
						</c:forEach>
					</table>
				</div>
			</div>
		</section>
		
	<!-- footer link-->
	<%@ include file="footer.jsp"%>
</div>
</body>
</html>