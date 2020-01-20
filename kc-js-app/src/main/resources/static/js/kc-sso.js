//var keycloak = Keycloak();
//var isUserDetailsNotFound=true;
/*$(document).ready(function() {*/
var keycloak = Keycloak('/kc-app.json');
keycloak.init({onLoad : 'check-sso'})
		.success(function(authenticated) {
			if (!authenticated) {
				keycloak.login();
			} else {
//						alert(keycloak.idTokenParsed.preferred_username)
//						alert(JSON.stringify(keycloak.tokenParsed))
//				if(isUserDetailsNotFound){
//					alert("baseapp api called")
					checkLoginDetails();
//				}
				$("#tokenInfo").text(JSON.stringify(keycloak.tokenParsed))
			}
		})
		.error(function() {
			alert('failed to initialize');
		});
/* }); */