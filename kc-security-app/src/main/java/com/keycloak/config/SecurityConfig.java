package com.keycloak.config;

public class SecurityConfig {
}

//@Configuration
//@EnableWebSecurity
////@KeycloakConfiguration
//public class SecurityConfig extends KeycloakWebSecurityConfigurerAdapter {
//	@Value("${ldap.urls}")
//	private String ldapUrls;
//
//	@Value("${ldap.base.dn}")
//	private String ldapBaseDn;
//
//	@Value("${ldap.username}")
//	private String ldapSecurityPrincipal;
//
//	@Value("${ldap.password}")
//	private String ldapPrincipalPassword;
//
//	@Value("${ldap.user.dn.pattern}")
//	private String ldapUserDnPattern;
//
//	@Value("${ldap.enabled}")
//	private String ldapEnabled;
//
//	@Value("${keycloakEnabled}")
//	private String keycloakEnabled;
//
//	/**
//	 * Registers the KeycloakAuthenticationProvider with the authentication manager.
//	 *
//	 * Since Spring Security requires that role names start with "ROLE_", a
//	 * SimpleAuthorityMapper is used to instruct the KeycloakAuthenticationProvider
//	 * to insert the "ROLE_" prefix.
//	 *
//	 * e.g. Librarian -> ROLE_Librarian
//	 *
//	 * Should you prefer to have the role all in uppercase, you can instruct the
//	 * SimpleAuthorityMapper to convert it by calling:
//	 * {@code grantedAuthorityMapper.setConvertToUpperCase(true); }. The result will
//	 * be: Librarian -> ROLE_LIBRARIAN.
//	 */
//	@Autowired
//	public void configureGlobal(AuthenticationManagerBuilder auth) {
//		SimpleAuthorityMapper grantedAuthorityMapper = new SimpleAuthorityMapper();
//		// grantedAuthorityMapper.setPrefix("ROLE_");
//
//		KeycloakAuthenticationProvider keycloakAuthenticationProvider = keycloakAuthenticationProvider();
//		keycloakAuthenticationProvider.setGrantedAuthoritiesMapper(grantedAuthorityMapper);
//		auth.authenticationProvider(keycloakAuthenticationProvider);
//	}
//
//	
//
//	@Override
//	public void configure(WebSecurity web) throws Exception {
//		web.ignoring().antMatchers("/resources/**");
//	}
//
//	/**
//	 * Define security constraints for the application resources.
//	 */
//	@Override
//	protected void configure(HttpSecurity http) throws Exception {
//		super.configure(http);
//		http.authorizeRequests().antMatchers("/books", "**/myProfile/saveProfile", "**/myProfile/getImage/**")
//				.hasAnyRole("NDMC_EMPLOYEE", "Citizen").antMatchers("/manager").hasRole("NDMC_EMPLOYEE").anyRequest()
//				.authenticated();
//	}
//
//	
//	/**
//	 * Defines the session authentication strategy.
//	 *
//	 * RegisterSessionAuthenticationStrategy is used because this is a public
//	 * application from the Keycloak point of view.
//	 */
//	@Bean
//	@Override
//	protected SessionAuthenticationStrategy sessionAuthenticationStrategy() {
//		return new RegisterSessionAuthenticationStrategy(new SessionRegistryImpl());
//	}
//
//	/**
//	 * Define an HttpSessionManager bean only if missing.
//	 *
//	 * This is necessary because since Spring Boot 2.1.0,
//	 * spring.main.allow-bean-definition-overriding is disabled by default.
//	 */
//	@Bean
//	@Override
//	@ConditionalOnMissingBean(HttpSessionManager.class)
//	protected HttpSessionManager httpSessionManager() {
//		return new HttpSessionManager();
//	}
//
//
//	@Bean
//	public BCryptPasswordEncoder bCryptPasswordEncoder() {
//		return new BCryptPasswordEncoder();
//	}
//
//	@Bean
//	public AuthenticationManager customAuthenticationManager() throws Exception {
//		return authenticationManager();
//	}
//	
//	@Override
//	protected void configure(AuthenticationManagerBuilder auth) throws Exception {
//		if (Boolean.parseBoolean(ldapEnabled)) {
//			auth.ldapAuthentication().contextSource().url(ldapUrls + ldapBaseDn).managerDn(ldapSecurityPrincipal)
//					.managerPassword(ldapPrincipalPassword).and().userDnPatterns(ldapUserDnPattern);
//		} 
//		/*
//		 * else {
//		 * auth.inMemoryAuthentication().withUser("user").password("user").roles("USER")
//		 * .and().withUser("admin") .password("admin").roles("ADMIN"); }
//		 */
//		else {
//			auth.authenticationProvider(authenticationProvider());
//		}
//	}
//	
//
//	@Bean
//	public DaoAuthenticationProvider authenticationProvider() {
//		DaoAuthenticationProvider authProvider = new DaoAuthenticationProvider();
//		authProvider.setUserDetailsService(userDetailsService());
//		authProvider.setPasswordEncoder(bCryptPasswordEncoder());
//		return authProvider;
//	}
//	
////	@Bean
////	@Override
////	protected KeycloakAuthenticationProvider keycloakAuthenticationProvider() {
////		SimpleAuthorityMapper grantedAuthorityMapper = new SimpleAuthorityMapper();
////		KeycloakAuthenticationProvider KeycloakAuthenticationProvider = new KeycloakAuthenticationProvider();
////		KeycloakAuthenticationProvider.setGrantedAuthoritiesMapper(grantedAuthorityMapper);
////		return KeycloakAuthenticationProvider;
////	}
//
//}
