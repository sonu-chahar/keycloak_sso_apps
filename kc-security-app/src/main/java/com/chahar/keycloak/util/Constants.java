package com.chahar.keycloak.util;

import java.io.InputStream;
import java.util.Properties;

import javax.servlet.http.HttpServletRequest;

public class Constants {

	public static String pathString(HttpServletRequest request) {

		//For Tomcat 

		String pathString = "http://" + request.getLocalName() + ":"
				+ request.getLocalPort() + request.getContextPath() + "";
		/*
		 * for Jboss
		 */
/*		 String pathString =
		 "http://"+request.getLocalName()+request.getContextPath()+"";*/
		return pathString;
	}
	public static String pathString(String property) {
		Properties prop = new Properties();
		try {

			ClassLoader loader = Thread.currentThread().getContextClassLoader();
			InputStream is = loader.getResourceAsStream("/applicationResources.properties");
			prop.load(is);
		}

		catch (Exception e) {
			e.printStackTrace();
		}
		return prop.getProperty(property);
	}
}
