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
	<script>
		/* function checkLoginDetails(){ */
			//alert(keycloak.idTokenParsed.preferred_username);
			//alert(keycloak.idTokenParsed.sub);
		/* 	var effUrl='http://127.0.0.1:8080/kc-security-app/fetchUserDetails'+'/'
						+keycloak.idTokenParsed.preferred_username+'/'+keycloak.idTokenParsed.sub+'/jsonpCallback';
			alert(effUrl);
			$.ajax({
				url :effUrl, */
//				headers: {  'Access-Control-Allow-Origin': 'http://127.0.0.1:8083' },
//				 headers: {
//			            'Access-Control-Allow-Origin': '*',
//			            'Content-Type':'application/json'
//			        },
//				success : checkDetailSuccessCallback,
			/* 	crossDomain: true,
				success:jsonpCallback,
				error : checkDetailErrorCallback,
				dataType : "jsonp",
				contentType:'application/json',
				async: false,
				type : "get"
			})
		} */
		function checkDetailSuccessCallback(data,status,xhr){
			alert("Success");
			alert(data);
		}
		function checkDetailErrorCallback(data,status,xhr){
			alert("Errorr");
			alert(data);
		}

		/* function fnjsonpCallback(dataWeGotViaJsonp){
			  alert("abc");
			  console.log(dataWeGotViaJsonp);
			  alert(dataWeGotViaJsonp)
		} */
		/* function checkLoginDetails2(){
			var effUrl='http://127.0.0.1:8080/kc-security-app/fetchUserDetails'+'/'
			+keycloak.idTokenParsed.preferred_username+'/'+keycloak.idTokenParsed.sub+'/fnjsonpCallback';
			$.getScript( effUrl, function( data, textStatus, jqxhr ) {
				  console.log( data ); // Data returned
				  console.log( textStatus ); // Success
				  console.log( jqxhr.status ); // 200
				  console.log( "Load was performed." );
			});
		} */
		
		/* function checkLoginDetails3(){
			var effUrl='http://127.0.0.1:8080/kc-security-app/fetchUserDetails'+'/'
			+keycloak.idTokenParsed.preferred_username+'/'+keycloak.idTokenParsed.sub+'/fnjsonpCallback?callback=fnjsonpCallback';
			
			alert(effUrl);
			$.ajax({ */
//		        crossDomain: true,
//		        type:"GET",
//		      	contentType: "application/json; charset=utf-8",
		      //  async:false,
		       /*  url: effUrl,
		        dataType: "jsonp",  */  
		        //success:checkDetailSuccessCallback
				/* error : checkDetailErrorCallback,
		        jsonpCallback: 'fnjsonpCallback'
		    });
		} */
		function checkLoginDetails4(){
		  var body = document.getElementsByTagName("body")[0];
		  var effUrl='http://127.0.0.1:8080/kc-security-app/fetchUserDetails'+'/'
			+keycloak.idTokenParsed.preferred_username+'/'+keycloak.idTokenParsed.sub+'/fnjsonpCallback?callback=fnjsonpCallback';
			
		  //url for the javascript resource for JSONP call.
		 
		  
		  //Appending the script tag to the head element.
		  //This triggers a JSONP call to get the data.
		  var scriptTag = document.createElement("script");
		  scriptTag.setAttribute("src",effUrl);
		  body.appendChild(scriptTag);
		}
	
	</script>
	
</body>

</html>
