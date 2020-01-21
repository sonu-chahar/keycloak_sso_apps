<!DOCTYPE html>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html lang="en">
<head>

<link rel="stylesheet" type="text/css"
	href="webjars/bootstrap/3.3.7/css/bootstrap.min.css" />

<c:url value="/css/main.css" var="jstlCss" />
<link href="${jstlCss}" rel="stylesheet" />
<script src="/webjars/jquery/3.4.1/jquery.min.js"></script>
<c:url value="/js/keycloak.js" var="kcjs" />
<script src="${kcjs}"></script>
<c:url value="/js/kc-sso.js" var="kcimpl" />
<script src="${kcimpl}"></script>

</head>
<body>
	<input type="hidden" id="fUsername" />
	<input type="hidden" id="fKcUserId" />
	<nav class="navbar navbar-inverse">
		<div class="container">
			<div class="navbar-header">
				<a class="navbar-brand" href="#">Spring Boot</a>
			</div>
			<div id="navbar" class="collapse navbar-collapse">
				<ul class="nav navbar-nav">
					<li><a href="/">Home</a></li>
					<li><a href="#about">About</a></li>
					<li class="active"><a href="/welcome">WecomePage</a></li>
					<li><input type="button" value="Log Out" id="fLogOut"
						class="btn btn-warning" onclick="performLogout()"></li>
				</ul>
			</div>
		</div>
	</nav>

	<div class="container">

		<div class="starter-template">
			<h1>Spring Boot Web JSP Exampless</h1>
			<h2>Message: ${message}</h2>
		</div>
		<div id="tokenInfo"></div>
		<input type="button" value="Get Login Details" id="getLoginDetails"
			class="btn btn-warning" onclick="checkLoginDetails3()">
		<div id="jsonp"></div>
	</div>
	<!-- /.container -->

	<script type="text/javascript"
		src="webjars/bootstrap/3.3.7/js/bootstrap.min.js"></script>

</body>

</html>
