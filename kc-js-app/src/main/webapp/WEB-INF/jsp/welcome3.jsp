<!DOCTYPE html>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html lang="en">
<head>

<link rel="stylesheet" type="text/css"
	href="webjars/bootstrap/3.3.7/css/bootstrap.min.css" />

<!-- 
	<spring:url value="/css/main.css" var="springCss" />
	<link href="${springCss}" rel="stylesheet" />
	 -->
<c:url value="/css/main.css" var="jstlCss" />
<link href="${jstlCss}" rel="stylesheet" />

<c:url value="/js/keycloak.js" var="kcjs" />
<c:url value="/js/kc2.js" var="kcimpl" />
<script src="${kcjs}"></script>
<script src="/webjars/jquery/3.4.1/jquery.min.js"></script>
<script src="${kcimpl}"></script>
<script>
  /* var keycloak = Keycloak({
	  url:"http://127.0.0.1:8180/auth",
	  realm:"testRealm1",
	  clientId:"testJSApp"
	});    */
 // var keycloak = Keycloak('http://192.168.10.215:8083/keycloak.json');
	/* var keycloak = Keycloak({
		url : 'http://127.0.0.1:8180/auth',
		realm : 'testRealm1',
		clientId : 'NDMC_EMPLOYEE'
	}); */
	/* keycloak.init({
		onLoad : 'login-required',
		checkLoginIframe: false
	})  */
	// keycloak.init({onLoad : 'login-required'})
	/*    keycloak.init({ onLoad: 'login-required' }).success(function(authenticated) {
	       alert(authenticated ? 'authenticated' : 'not authenticated');
	   }).error(function() {
	       alert('failed to initialize');
	   }); */

	/*  keycloak.init().success(function(authenticated) {
	     alert(authenticated ? 'authenticated' : 'not authenticated');
	 }).error(function() {
	     alert('failed to initialize');
	 }); */

	/* var loadData = function() { */
		//$('<input>').attr('type','hidden').appendTo('form');
		
		/* document.getElementById('username').innerText = keycloak.subject;
		alert($("#username").val());

		var url = window.location.href;

		var req = new XMLHttpRequest();
		req.open('GET', url, true);
		req.setRequestHeader('Accept', 'application/json');
		req.setRequestHeader('Authorization', 'Bearer ' + keycloak.token);

		req.onreadystatechange = function() {
			if (req.readyState == 4) {
				if (req.status == 200) {
					alert('Success');
				} else if (req.status == 403) {
					alert('Forbidden');
				}
			}
		}

		req.send();
	}; */
	/* 
	 keycloak.updateToken(30).success(function() {
	    loadData();
	}).error(function() {
	    alert('Failed to refresh token');
	});  */
</script>

</head>
<body>

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
				</ul>
			</div>
		</div>
	</nav>

	<div class="container">

		<div class="starter-template">
			<h1>Spring Boot Web JSP Example</h1>
			<h2>Message: ${message}</h2>
		</div>

	</div>
	<!-- /.container -->
	<script type="text/javascript"
		src="/webjars/jquery/3.4.1/jquery.min.js"></script>
	<script type="text/javascript"
		src="webjars/bootstrap/3.3.7/js/bootstrap.min.js"></script>

</body>

</html>
