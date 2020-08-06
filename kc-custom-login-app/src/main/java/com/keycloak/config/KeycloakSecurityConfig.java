package com.keycloak.config;

import java.util.Arrays;

import org.keycloak.adapters.springboot.KeycloakSpringBootConfigResolver;
import org.keycloak.adapters.springsecurity.KeycloakConfiguration;
import org.keycloak.adapters.springsecurity.authentication.KeycloakAuthenticationProvider;
import org.keycloak.adapters.springsecurity.client.KeycloakClientRequestFactory;
import org.keycloak.adapters.springsecurity.client.KeycloakRestTemplate;
import org.keycloak.adapters.springsecurity.config.KeycloakWebSecurityConfigurerAdapter;
import org.keycloak.adapters.springsecurity.management.HttpSessionManager;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.config.ConfigurableBeanFactory;
import org.springframework.boot.autoconfigure.condition.ConditionalOnMissingBean;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Scope;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.builders.WebSecurity;
import org.springframework.security.core.authority.mapping.SimpleAuthorityMapper;
import org.springframework.security.core.session.SessionRegistryImpl;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.web.authentication.session.RegisterSessionAuthenticationStrategy;
import org.springframework.security.web.authentication.session.SessionAuthenticationStrategy;
import org.springframework.web.cors.CorsConfiguration;
import org.springframework.web.cors.CorsConfigurationSource;
import org.springframework.web.cors.UrlBasedCorsConfigurationSource;

@KeycloakConfiguration
public class KeycloakSecurityConfig extends KeycloakWebSecurityConfigurerAdapter {

	/**
	 * Load Keycloak configuration from application.properties or application.yml,
	 * rather than keycloak.json.
	 */
	@Bean
	public KeycloakSpringBootConfigResolver keycloakConfigResolver() {
		return new KeycloakSpringBootConfigResolver();
	}

	@Autowired
	public KeycloakClientRequestFactory keycloakClientRequestFactory;

	@Autowired
	public void configureGlobal(AuthenticationManagerBuilder auth) {
		SimpleAuthorityMapper grantedAuthorityMapper = new SimpleAuthorityMapper();
		KeycloakAuthenticationProvider keycloakAuthenticationProvider = keycloakAuthenticationProvider();
		keycloakAuthenticationProvider.setGrantedAuthoritiesMapper(grantedAuthorityMapper);
		auth.authenticationProvider(keycloakAuthenticationProvider);
	}

	@Bean
	public AuthenticationManager authenticationManager() throws Exception {
		return super.authenticationManager();
	}

	@Override
	public void configure(WebSecurity web) throws Exception {
		web.ignoring().antMatchers("/resources/**");
	}

	@Override
	protected void configure(HttpSecurity http) throws Exception {

		super.configure(http);
		http.authorizeRequests()
				.antMatchers("/images/**", "/landingPage", "/homePage*", "/passwordPolicy.html*", "/websitePolicy.html*")
				.permitAll().antMatchers("/books").hasAnyRole("NDMC_EMPLOYEE", "Citizen").antMatchers("/manager")
				.hasRole("NDMC_EMPLOYEE").antMatchers("/fetchUserDetail**").authenticated().anyRequest()
				.authenticated();
		http.headers().frameOptions().sameOrigin();
		http.csrf().disable();
	}

	@Bean
	@Override
	protected SessionAuthenticationStrategy sessionAuthenticationStrategy() {
		return new RegisterSessionAuthenticationStrategy(new SessionRegistryImpl());
	}

	@Bean
	@Override
	@ConditionalOnMissingBean(HttpSessionManager.class)
	protected HttpSessionManager httpSessionManager() {
		return new HttpSessionManager();
	}

	@Bean
	public BCryptPasswordEncoder bCryptPasswordEncoder() {
		return new BCryptPasswordEncoder();
	}

	@Bean
	public CorsConfigurationSource corsConfigurationSource() {
		CorsConfiguration configuration = new CorsConfiguration();
		configuration.setAllowedOrigins(Arrays.asList("*"));
		configuration.setAllowedMethods(Arrays.asList("GET", "POST"));
		UrlBasedCorsConfigurationSource source = new UrlBasedCorsConfigurationSource();
		source.registerCorsConfiguration("/**", configuration);
		return source;
	}

	@Bean
	@Scope(ConfigurableBeanFactory.SCOPE_PROTOTYPE)
	public KeycloakRestTemplate keycloakRestTemplate() {
		return new KeycloakRestTemplate(keycloakClientRequestFactory);
	}

//	@Bean
////	@Scope(ConfigurableBeanFactory.SCOPE_PROTOTYPE)
//	@Override
//	protected KeycloakAuthenticationProcessingFilter keycloakAuthenticationProcessingFilter() throws Exception {
//		RequestMatcher requestMatcher = new OrRequestMatcher(
//				new AntPathRequestMatcher(KeycloakAuthenticationEntryPoint.DEFAULT_LOGIN_URI),
//				new RequestHeaderRequestMatcher(KeycloakAuthenticationProcessingFilter.AUTHORIZATION_HEADER),
//				new QueryParamPresenceRequestMatcher(OAuth2Constants.ACCESS_TOKEN),
//				new AdapterStateCookieRequestMatcher());
//
//		KeycloakAuthenticationProcessingFilter filter = new LocaleAwareKeycloakAuthenticationProcessingFilter(
//				authenticationManager(), requestMatcher);
//		filter.setSessionAuthenticationStrategy(sessionAuthenticationStrategy());
//		return filter;
//	}

}
