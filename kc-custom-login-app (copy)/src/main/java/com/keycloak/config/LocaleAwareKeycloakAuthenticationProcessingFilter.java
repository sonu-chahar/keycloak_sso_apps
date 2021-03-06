package com.keycloak.config;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.keycloak.adapters.AdapterDeploymentContext;
import org.keycloak.adapters.AdapterTokenStore;
import org.keycloak.adapters.KeycloakDeployment;
import org.keycloak.adapters.RequestAuthenticator;
import org.keycloak.adapters.spi.AuthChallenge;
import org.keycloak.adapters.spi.AuthOutcome;
import org.keycloak.adapters.spi.HttpFacade;
import org.keycloak.adapters.springsecurity.KeycloakAuthenticationException;
import org.keycloak.adapters.springsecurity.facade.SimpleHttpFacade;
import org.keycloak.adapters.springsecurity.filter.KeycloakAuthenticationProcessingFilter;
import org.keycloak.adapters.springsecurity.token.AdapterTokenStoreFactory;
import org.keycloak.adapters.springsecurity.token.SpringSecurityAdapterTokenStoreFactory;
import org.springframework.context.ApplicationContext;
import org.springframework.context.ApplicationContextAware;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.web.util.matcher.RequestMatcher;
import org.springframework.util.Assert;

public class LocaleAwareKeycloakAuthenticationProcessingFilter extends KeycloakAuthenticationProcessingFilter
		implements ApplicationContextAware {
	private final Logger log = LogManager.getLogger(getClass());

	private ApplicationContext applicationContext;
	private AdapterDeploymentContext adapterDeploymentContext;
	private AdapterTokenStoreFactory adapterTokenStoreFactory = new SpringSecurityAdapterTokenStoreFactory();

	public LocaleAwareKeycloakAuthenticationProcessingFilter(AuthenticationManager authenticationManager,
			RequestMatcher requiresAuthenticationRequestMatcher) {
		super(authenticationManager, requiresAuthenticationRequestMatcher);
	}

	@Override
	public void afterPropertiesSet() {
		super.afterPropertiesSet();
		adapterDeploymentContext = applicationContext.getBean(AdapterDeploymentContext.class);
	}

	@Override
	public Authentication attemptAuthentication(HttpServletRequest request, HttpServletResponse response) {
		log.debug("Attempting Keycloak authentication");

		HttpFacade facade = new SimpleHttpFacade(request, response);
		KeycloakDeployment deployment = adapterDeploymentContext.resolveDeployment(facade);
		AdapterTokenStore tokenStore = adapterTokenStoreFactory.createAdapterTokenStore(deployment, request, response);
		RequestAuthenticator authenticator = new LocaleAwareRequestAuthenticator(facade, request, deployment,
				tokenStore, -1);

		AuthOutcome result = authenticator.authenticate();
		log.debug("Auth outcome: {}", result);

		if (AuthOutcome.FAILED.equals(result)) {
			throw new KeycloakAuthenticationException("Auth outcome: " + result);
		} else if (AuthOutcome.AUTHENTICATED.equals(result)) {
			Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
			Assert.notNull(authentication, "Authentication SecurityContextHolder was null");
			return getAuthenticationManager().authenticate(authentication);
		} else {
			AuthChallenge challenge = authenticator.getChallenge();
			if (challenge != null) {
				challenge.challenge(facade);
			}
			return null;
		}
	}

	@Override
	public void setApplicationContext(ApplicationContext applicationContext) {
		super.setApplicationContext(applicationContext);
		this.applicationContext = applicationContext;
	}

	@Override
	public void setAdapterTokenStoreFactory(AdapterTokenStoreFactory adapterTokenStoreFactory) {
		super.setAdapterTokenStoreFactory(adapterTokenStoreFactory);
		this.adapterTokenStoreFactory = adapterTokenStoreFactory;
	}
}
