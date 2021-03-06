package com.keycloak.config;

import javax.servlet.http.HttpServletRequest;

import org.keycloak.adapters.AdapterTokenStore;
import org.keycloak.adapters.KeycloakDeployment;
import org.keycloak.adapters.OAuthRequestAuthenticator;
import org.keycloak.adapters.spi.HttpFacade;
import org.keycloak.adapters.springsecurity.authentication.SpringSecurityRequestAuthenticator;

public class LocaleAwareRequestAuthenticator extends SpringSecurityRequestAuthenticator {

	private HttpServletRequest request;

	public LocaleAwareRequestAuthenticator(HttpFacade facade, HttpServletRequest request, KeycloakDeployment deployment,
			AdapterTokenStore tokenStore, int sslRedirectPort) {
		super(facade, request, deployment, tokenStore, sslRedirectPort);
		this.request = request;
	}

	@Override
	protected OAuthRequestAuthenticator createOAuthAuthenticator() {
		return new LocaleAwareOAuthRequestAuthenticator(this, facade, deployment, sslRedirectPort, tokenStore);
	}

	public HttpServletRequest getHttpServletRequest() {
		return request;
	}
}