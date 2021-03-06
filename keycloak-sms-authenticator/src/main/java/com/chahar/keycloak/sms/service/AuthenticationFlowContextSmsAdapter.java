package com.chahar.keycloak.sms.service;

import javax.ws.rs.core.Response;

import org.jboss.resteasy.spi.HttpRequest;
import org.keycloak.authentication.AuthenticationFlowContext;
import org.keycloak.forms.login.LoginFormsProvider;
import org.keycloak.models.KeycloakSession;
import org.keycloak.models.UserModel;
import org.keycloak.sessions.AuthenticationSessionModel;

public class AuthenticationFlowContextSmsAdapter implements SmsContext {

	private final AuthenticationFlowContext context;

	@Override
	public HttpRequest getHttpRequest() {
		return context.getHttpRequest();
	}

	public AuthenticationFlowContextSmsAdapter(AuthenticationFlowContext context) {
		this.context = context;
	}

	@Override
	public KeycloakSession getSession() {
		return context.getSession();
	}

	@Override
	public UserModel getUser() {
		return context.getUser();
	}

	@Override
	public AuthenticationSessionModel getAuthenticationSession() {
		return context.getAuthenticationSession();
	}

	@Override
	public LoginFormsProvider form() {
		return context.form();
	}

	@Override
	public void success() {
		context.success();
	}

	@Override
	public void challenge(Response response) {
		context.challenge(response);
	}
}
