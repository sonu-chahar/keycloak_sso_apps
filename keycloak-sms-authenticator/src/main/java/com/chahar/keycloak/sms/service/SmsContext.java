package com.chahar.keycloak.sms.service;

import javax.ws.rs.core.Response;

import org.jboss.resteasy.spi.HttpRequest;
import org.keycloak.forms.login.LoginFormsProvider;
import org.keycloak.models.KeycloakSession;
import org.keycloak.models.UserModel;
import org.keycloak.sessions.AuthenticationSessionModel;

public interface SmsContext {

    KeycloakSession getSession();

    HttpRequest getHttpRequest();

    UserModel getUser();

    AuthenticationSessionModel getAuthenticationSession();

    LoginFormsProvider form();

    void success();

    void challenge(Response response);

}
