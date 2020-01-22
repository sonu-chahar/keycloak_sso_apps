package com.keycloak.config;

import java.util.Arrays;
import java.util.EnumSet;
import java.util.concurrent.TimeUnit;

import javax.servlet.DispatcherType;
import javax.servlet.FilterRegistration;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;

import org.springframework.boot.autoconfigure.web.servlet.DispatcherServletAutoConfiguration;
import org.springframework.boot.web.servlet.FilterRegistrationBean;
import org.springframework.boot.web.servlet.ServletRegistrationBean;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.Import;
import org.springframework.context.annotation.ImportResource;
import org.springframework.context.annotation.Scope;
import org.springframework.core.io.ClassPathResource;
import org.springframework.core.io.Resource;
import org.springframework.http.CacheControl;
import org.springframework.security.web.session.HttpSessionEventPublisher;
import org.springframework.web.WebApplicationInitializer;
import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.filter.CharacterEncodingFilter;
import org.springframework.web.multipart.commons.CommonsMultipartResolver;
import org.springframework.web.servlet.DispatcherServlet;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.ViewResolverRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;
import org.springframework.web.servlet.view.InternalResourceViewResolver;
import org.springframework.web.servlet.view.JstlView;
import org.springframework.web.servlet.view.XmlViewResolver;

import com.keycloak.model.UserMaster;
import com.opensymphony.module.sitemesh.filter.PageFilter;

@SuppressWarnings("deprecation")
@Configuration
@EnableWebMvc
@ImportResource({ "classpath:dwr-config.xml", "classpath:jasper-views.xml" })
@Import({ HibernateConfig.class, KeycloakSecurityConfig.class })
//@PropertySource("classpath:applicationResources.properties")
public class MyWebConfiguration implements WebMvcConfigurer, WebApplicationInitializer {

	@Bean
	public DispatcherServlet dispatcherServlet() {
		DispatcherServlet dispatcherServlet = new DispatcherServlet();
		dispatcherServlet.setThreadContextInheritable(true);
		dispatcherServlet.setThrowExceptionIfNoHandlerFound(true);
		return dispatcherServlet;
	}

	@Bean
	public ServletRegistrationBean<DispatcherServlet> dispatcherServletRegistration1() {

		ServletRegistrationBean<DispatcherServlet> registration = new ServletRegistrationBean<>(dispatcherServlet());
		registration.setUrlMappings(Arrays.asList(new String[] { "/", "/dwr/*" }));
		registration.setLoadOnStartup(0);
		registration.setName(DispatcherServletAutoConfiguration.DEFAULT_DISPATCHER_SERVLET_REGISTRATION_BEAN_NAME);
		return registration;
	}

	@Override
	public void configureViewResolvers(ViewResolverRegistry registry) {
		InternalResourceViewResolver resolver = new InternalResourceViewResolver();
		resolver.setPrefix("/WEB-INF/jsp/");
		resolver.setSuffix(".jsp");
		resolver.setViewClass(JstlView.class);
		registry.viewResolver(resolver);
	}

	@Override
	public void addResourceHandlers(ResourceHandlerRegistry registry) {
		registry.addResourceHandler("/resources/**").addResourceLocations("/WEB-INF/_ui/")
				.setCacheControl(CacheControl.maxAge(2, TimeUnit.HOURS).cachePublic());
		registry.addResourceHandler("/images/**").addResourceLocations("/WEB-INF/_ui/images/")
				.setCacheControl(CacheControl.maxAge(2, TimeUnit.HOURS).cachePublic());
	}

	@Bean
	public HttpSessionEventPublisher httpSessionEventPublisher() {
		return new HttpSessionEventPublisher();
	}

	@Override
	public void onStartup(ServletContext servletContext) throws ServletException {
		servletContext.setInitParameter("javax.servlet.jsp.jstl.fmt.fallbackLocale", "en");
		servletContext.setInitParameter("javax.servlet.jsp.jstl.fmt.localizationContext", "applicationResources");
		EnumSet<DispatcherType> dispatcherTypes = EnumSet.of(DispatcherType.REQUEST, DispatcherType.FORWARD);
		CharacterEncodingFilter characterEncodingFilter = new CharacterEncodingFilter();
		characterEncodingFilter.setEncoding("UTF-8");
		characterEncodingFilter.setForceEncoding(true);
		FilterRegistration.Dynamic characterEncoding = servletContext.addFilter("characterEncoding",
				characterEncodingFilter);
		characterEncoding.addMappingForUrlPatterns(dispatcherTypes, true, "/*");
	}

	@Bean
	public FilterRegistrationBean<PageFilter> pageFilter() {
		FilterRegistrationBean<PageFilter> filter = new FilterRegistrationBean<>();
//		System.out.println("before sitemesh filter registration");
//		SiteMeshFilter pageFilter = new SiteMeshFilter();
		PageFilter pageFilter = new PageFilter();
		filter.addUrlPatterns("/*");
		filter.setFilter(pageFilter);
		return filter;
	}

	@Bean
	public XmlViewResolver xmlViewResolver() {
		XmlViewResolver resolver = new XmlViewResolver();
		Resource resource = new ClassPathResource("jasper-views.xml");
		resolver.setLocation(resource);
		resolver.setOrder(0);
		return resolver;
	}

	@Bean(name = "multipartResolver")
	public CommonsMultipartResolver multipartResolver() {
		CommonsMultipartResolver multipartResolver = new CommonsMultipartResolver();
		multipartResolver.setMaxUploadSize(20848820);
		return multipartResolver;
	}

	/*
	 * @Bean
	 * 
	 * @Scope(WebApplicationContext.SCOPE_SESSION) public UserMaster userMaster() {
	 * UserMaster userMaster = new UserMaster(); return userMaster; }
	 */
//	@Override
//	public void addCorsMappings(CorsRegistry registry) {
//		WebMvcConfigurer.super.addCorsMappings(registry);
//	}
}
