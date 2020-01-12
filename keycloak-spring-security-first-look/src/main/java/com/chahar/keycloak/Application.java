package com.chahar.keycloak;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.autoconfigure.data.jpa.JpaRepositoriesAutoConfiguration;
import org.springframework.boot.autoconfigure.jdbc.DataSourceAutoConfiguration;
import org.springframework.boot.autoconfigure.jdbc.DataSourceTransactionManagerAutoConfiguration;
import org.springframework.boot.autoconfigure.orm.jpa.HibernateJpaAutoConfiguration;
import org.springframework.boot.builder.SpringApplicationBuilder;
import org.springframework.boot.web.servlet.FilterRegistrationBean;
import org.springframework.boot.web.servlet.support.SpringBootServletInitializer;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Import;
import org.springframework.orm.hibernate5.support.OpenSessionInViewFilter;

import com.chahar.keycloak.config.MyWebConfiguration;

@SpringBootApplication(exclude = { HibernateJpaAutoConfiguration.class, JpaRepositoriesAutoConfiguration.class,
		DataSourceAutoConfiguration.class,
		DataSourceTransactionManagerAutoConfiguration.class/*
															 * , ErrorMvcAutoConfiguration.class
															 */ })
@Import({ MyWebConfiguration.class })
public class Application extends SpringBootServletInitializer {
	public static void main(String[] args) {
		SpringApplication.run(Application.class, args);
	}

	@Override
	protected SpringApplicationBuilder configure(SpringApplicationBuilder application) {
		return application.sources(Application.class);
	}

	@Bean
	public FilterRegistrationBean lazyLoadingFilter() {
		FilterRegistrationBean filter = new FilterRegistrationBean();
		System.out.println("before lazyLoadingFilter Registration");
		OpenSessionInViewFilter openSessionInViewFilter = new OpenSessionInViewFilter();
		filter.addUrlPatterns("/*");
		filter.addInitParameter("sessionFactoryBeanName", "sessionFactory");
		filter.setFilter(openSessionInViewFilter);
		return filter;
	}
}
