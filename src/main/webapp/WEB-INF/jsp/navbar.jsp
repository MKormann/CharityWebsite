<nav class="navbar navbar-default navbar-fixed-top">
	<div class="container-fluid">
	    <a class="navbar-brand" href="welcome">
	      <img id="logo" src="<%=request.getContextPath()%>/resources/images/generic-logo.gif" alt="Welcome"/>LOGO
	      </a>
		<div class="navbar-header">
	      <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target=".navbar-collapse">
	        <span class="sr-only">Toggle navigation</span>
	        <span class="icon-bar"></span>
	        <span class="icon-bar"></span>
	        <span class="icon-bar"></span>
	      </button>
	    </div>
	    
	    <div class="navbar-right">
	    	<ul class="nav navbar-nav">
	    		<li><a id="home" href="welcome">Home</a></li>
	    		<li><a id="home" href="about">About</a></li>
	    		<li><a id="home" href="partners">Partners</a></li>
	    		<li><a id="home" href="contact">Contact Us</a></li>
	    		<c:choose>
	    			<c:when test="${pageContext.request.userPrincipal.name == null}">
	    				<li><a id="home" href="register">Register</a></li>
	    				<li><a id="home" href="login">Login</a></li>
	    			</c:when>
	    			<c:otherwise>
			    		<li class="dropdown">
		     		    	<a id="homeSub" href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false"><c:out value="${user.username }"/> <span class="caret"></span></a>
		          			<ul class="dropdown-menu" role="menu">
		            			<li><a id="homeSub" href="overview">Account Overview</a></li>
		            			<li><a id="homeSub" href="<c:url value="logout" />">Log Out</a></li>
		          			</ul>
		        		</li>
        			 </c:otherwise>
	    		</c:choose>
	    	</ul>	    
	    </div>
	</div>
</nav>