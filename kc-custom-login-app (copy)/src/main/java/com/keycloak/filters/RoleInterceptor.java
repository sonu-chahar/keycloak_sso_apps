package com.keycloak.filters;

import java.util.Locale;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.keycloak.KeycloakSecurityContext;
import org.keycloak.representations.AccessToken.Access;
import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

public class RoleInterceptor implements HandlerInterceptor {

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		return true;
	}

	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		KeycloakSecurityContext kcSecurityContext = (KeycloakSecurityContext) request
				.getAttribute(KeycloakSecurityContext.class.getName());
		if (kcSecurityContext != null) {
			Access access = kcSecurityContext.getToken().getResourceAccess("realm-management");
			if (access != null) {
				Set<String> roles = access.getRoles();
				if (roles.contains("view-realm") && roles.contains("view-users")) {
					request.setAttribute("isAuthorizedForViewUsers", "true");
				}
			}
		}
		Locale locale = LocaleContextHolder.getLocale();
		
		request.setAttribute("currentLocale", locale.getLanguage());
	}

	@Override
	public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler,
			Exception exception) throws Exception {
	}

}
