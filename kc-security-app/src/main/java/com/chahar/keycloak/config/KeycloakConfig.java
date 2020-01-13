package com.chahar.keycloak.config;

import org.keycloak.adapters.springboot.KeycloakSpringBootConfigResolver;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

@Configuration
public class KeycloakConfig {

	/**
	 * Load Keycloak configuration from application.properties or application.yml,
	 * rather than keycloak.json.
	 */
	@Bean
	public KeycloakSpringBootConfigResolver keycloakConfigResolver() {
		return new KeycloakSpringBootConfigResolver();
	}
////    
//    @Bean
//	public ObjectMapper mapper() {
//		return new ObjectMapper()
//			.setSerializationInclusion(Include.NON_NULL)
//			.configure(DeserializationFeature.FAIL_ON_UNKNOWN_PROPERTIES, false);
//	}
//
//	@Bean
//	public RestTemplate restTemplate() {
//		return new RestTemplate();
//	}
}
