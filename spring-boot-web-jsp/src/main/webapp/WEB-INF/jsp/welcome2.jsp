<!DOCTYPE html>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
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
<script src="${kcjs}"></script>
 <script>
        var keycloak = Keycloak({
        	 url: 'http://127.0.0.1:8180/auth',
        	 realm: 'testRealm1',
        	 clientId: 'NDMC_EMPLOYEE'
        	 /*  "realm": "testRealm1",
        	  "auth-server-url": "http://127.0.0.1:8180/auth",
        	  "ssl-required": "external",
        	  "resource": "NDMC_EMPLOYEE",
        	  "clientId": "NDMC_EMPLOYEE",
        	  "public-client": true,
        	  "confidential-port": 0 */
        	});
        keycloak.init({ onLoad: 'login-required' })
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
        
        var loadData = function () {
            document.getElementById('username').innerText = keycloak.subject;

            var url = 'http://localhost:8083/welcome';

            var req = new XMLHttpRequest();
            req.open('GET', url, true);
            req.setRequestHeader('Accept', 'application/json');
            req.setRequestHeader('Authorization', 'Bearer ' + keycloak.token);

            req.onreadystatechange = function () {
                if (req.readyState == 4) {
                    if (req.status == 200) {
                        alert('Success');
                    } else if (req.status == 403) {
                        alert('Forbidden');
                    }
                }
            }

            req.send();
        }; 
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
					<li  class="active"><a href="/welcome">WecomePage</a></li>
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
		src="webjars/bootstrap/3.3.7/js/bootstrap.min.js"></script>

</body>

</html>
