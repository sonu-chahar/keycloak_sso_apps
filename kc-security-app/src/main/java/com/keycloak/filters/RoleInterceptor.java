package com.keycloak.filters;

import java.util.Set;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.keycloak.KeycloakSecurityContext;
import org.keycloak.representations.AccessToken.Access;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

public class RoleInterceptor implements HandlerInterceptor {

//	@Override
//	protected void doFilterInternal(HttpServletRequest request, HttpServletResponse response, FilterChain filterChain)
//			throws ServletException, IOException {
//		KeycloakSecurityContext kcSecurityContext=(KeycloakSecurityContext)request.getAttribute(KeycloakSecurityContext.class.getName());
//		if(kcSecurityContext==null) {
//			filterChain.doFilter(request, response);
//		}else {
//			Set<String> roles=kcSecurityContext.getToken().getRealmAccess().getRoles();
//			if (roles.contains("view-realm") && roles.contains("view-users") ) {
//				request.setAttribute("isAuthorizedForViewUsers", "true");
//			}
//			filterChain.doFilter(request, response);
//		}
//		
//	}

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		System.out.println("Inside pre handle");
		return true;
	}

	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		KeycloakSecurityContext kcSecurityContext = (KeycloakSecurityContext) request
				.getAttribute(KeycloakSecurityContext.class.getName());
		if (kcSecurityContext != null) {
//			Set<String> roles = kcSecurityContext.getToken().getRealmAccess().getRoles();
			Access access = kcSecurityContext.getToken().getResourceAccess("realm-management");
			if (access != null) {
				Set<String> roles = access.getRoles();
				if (roles.contains("view-realm") && roles.contains("view-users")) {
					request.setAttribute("isAuthorizedForViewUsers", "true");
				}
			}

		}
		System.out.println("Inside post handle");
	}

	@Override
	public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler,
			Exception exception) throws Exception {
		System.out.println("Inside after completion");
	}

}
