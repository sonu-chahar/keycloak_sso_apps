//var keycloak = Keycloak();
$(document).ready(function() {
	var keycloak = Keycloak('/keycloak.json');
//					var keycloak = Keycloak();
	/*var keycloak = Keycloak({
		url : "http://127.0.0.1:8180/auth",
		realm : "testRealm1",
		clientId : "testJSApp"
	});*/
	/*keycloak.init(onload="native").success(
							function(authenticated) {
								if (!authenticated) {
//									 keycloak.login();
									alert(keycloak.profile)
									alert("abdc:: "+authenticated)
									alert('not authenticated');
								} else {
									document.getElementById('name').innerHTML = keycloak.idTokenParsed.name;
									alert("abdc2:: "+keycloak.idTokenParsed.name)
									
									alert("Token:: "+keycloak.token)
									alert("idToken:: "+keycloak.idToken)
									alert("refreshToken:: "+keycloak.refreshToken)
									
								}
							}).error(function() {
						alert('failed to initialize');
					});;*/
	keycloak.init({	onLoad : 'check-sso'})
							.success(
									function(authenticated) {
										if (!authenticated) {
//											alert("abdc1:: "+authenticated)
//											alert('not authenticated');
											keycloak.login();
										} else {
											loadData();
//											alert("abdc2:: "+keycloak.idTokenParsed.name)
											
//											alert("Token:: "+keycloak.token)
//											alert("idToken:: "+keycloak.idToken)
//											alert("refreshToken:: "+keycloak.refreshToken)
											
										}
									}).error(function() {
								alert('failed to initialize');
							});
	
	
	/*keycloak
	.init({
		onLoad : 'login-required'
		onLoad : 'check-sso',
		checkLoginIframe: false,
		token: keycloak.token,
	    refreshToken: keycloak.idToken,
	    idToken: keycloak.refreshToken
	})
	.success(
			function(authenticated) {
				if (!authenticated) {
					 keycloak.login();
					alert("abdc:: "+authenticated)
					alert('not authenticated');
				} else {
					document.getElementById('name').innerHTML = keycloak.idTokenParsed.name;
					alert("abdc2:: "+keycloak.idTokenParsed.name)
					
					alert("Token:: "+keycloak.token)
					alert("idToken:: "+keycloak.idToken)
					alert("refreshToken:: "+keycloak.refreshToken)
					
				}
			}).error(function() {
		alert('failed to initialize');
	});*/

	var loadData = function() {
		alert("loadData Method");
		var data = {};

		//data['date'] = document.getElementsByName('date')[0].value;
		//alert(data['date']);
		var url = window.location.href;

		var req = new XMLHttpRequest();
		req.open('GET', url, true);
//						req.setRequestHeader('Accept', 'application/json');
//						req.setRequestHeader('Content-Type',
//								'application/json; charset=UTF-8');
		req.setRequestHeader('Authorization', 'Bearer '
				+ keycloak.token);

		req.onreadystatechange = function() {
			if (req.readyState === 4) {
				if (req.status === 200) {
					alert("abcsdfsfdsfsdafas")
//									var draw = JSON.parse(req.responseText);
//									var html = '';
//									for (var i = 0; i < draw.numbers.length; i++) {
//										html += draw.numbers[i] + '<br>';
//									}
//									document.getElementById('draw').innerHTML = html;
//									document.getElementById('drawdate').innerHTML = draw.date;
//									document.getElementById('message').innerHTML = '';
//									document.getElementById('result').style.display = 'block';
				} else {
					alert(req.responseText);
				}
			}
		}

		req.send(JSON.stringify(data));
	};

	var loadFailure = function() {
		alert('<b>Failed to load data.  Check console log</b>');

	};

	var reloadData = function() {
		keycloak.updateToken().success(loadData).error(
				loadFailure);
	}
});