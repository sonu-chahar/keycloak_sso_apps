var keycloak = Keycloak('/kc-app.json');
keycloak.init({onLoad : 'check-sso'})
		.success(function(authenticated) {
			if (!authenticated) {
				keycloak.login();
			} else {
					checkLoginDetails();
				$("#tokenInfo").text(JSON.stringify(keycloak.tokenParsed))
			}
		})
		.error(function() {
			alert('failed to initialize');
		});
