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
<script src="/webjars/jquery/3.4.1/jquery.min.js"></script>
<c:url value="/js/keycloak.js" var="kcjs" />
<script src="${kcjs}"></script>
<c:url value="/js/kc-sso.js" var="kcimpl" />
<script src="${kcimpl}"></script>
<script>

  
/* $( document ).ready(function() { */
	/* var keycloak = Keycloak({
	  url:"http://127.0.0.1:8180/auth",
	  realm:"testRealm1",
	  clientId:"testJSApp"
	}); */   
// var keycloak = Keycloak('http://192.168.10.215:8083/keycloak.json');
	
	//alert(keycloak); 
	/* var keycloak = Keycloak({
		url : 'http://127.0.0.1:8180/auth',
		realm : 'testRealm1',
		clientId : 'NDMC_EMPLOYEE'
	}); */
	/* keycloak.init({
		onLoad : 'login-required',
		checkLoginIframe: false,
		flow: 'hybrid'
	})  */
	// keycloak.init({onLoad : 'login-required'})
	/*    keycloak.init({ onLoad: 'login-required' }).success(function(authenticated) {
	       alert(authenticated ? 'authenticated' : 'not authenticated');
	   }).error(function() {
	       alert('failed to initialize');
	   }); */

	 /*  keycloak.init({promiseType:'native'}).then(function(authenticated){
		  alert(authenticated?'authenticated':'not authenticated');
	  }).catch(function (){
		  alert('failed to initialize');
	  }); */
	/*  var loadData = function() {
		//$('<input>').attr('type','hidden').appendTo('form');
		
		//document.getElementById('username').innerText = keycloak.subject;
		//alert($("#username").val()); 

		var url = window.location.href;

		var req = new XMLHttpRequest();
		req.open('GET', url, true);
		
		req.setRequestHeader('Accept', 'application/json');
		req.setRequestHeader('Authorization', 'Bearer ' + keycloak.token);
		keycloak.onAuthSuccess = function() { alert('authenticated'); }
		 req.onreadystatechange = function() {
			 alert(req.readyState);
			if (req.readyState == 4) {
				alert(req.readyState)
				if (req.status == 200) {
					alert('Success');
				} else if (req.status == 403) {
					alert('Forbidden');
				}
			}
		} 

		req.send();
		alert("abc")
		keycloak.onAuthSuccess = function() { alert('authenticated'); 
		req.setRequestHeader('Authorization', 'Bearer ' + keycloak.token);}
	}; 
	
	keycloak.updateToken(30).success(function() {
	    loadData();
	}).error(function() {
	    alert('Failed to refresh token');
	});  */  
/* }); */
	
</script>
</head>
<body>
	<input type="hidden" id="name"/>
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
			<h1>Spring Boot Web JSP Exampless</h1>
			<h2>Message: ${message}</h2>
		</div>
		<div id="tokenInfo"></div>
	</div>
	<!-- /.container -->

	<script type="text/javascript"
		src="webjars/bootstrap/3.3.7/js/bootstrap.min.js"></script>

</body>

</html>
