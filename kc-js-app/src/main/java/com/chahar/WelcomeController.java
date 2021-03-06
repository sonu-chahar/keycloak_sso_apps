package com.chahar;

import java.util.Date;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class WelcomeController {

	// inject via application.properties
	@Value("${welcome.message:test}")
	private String message = "Hello World";

	@RequestMapping("/")
	public String welcome(Map<String, Object> model) {
		model.put("message", this.message);
		return "welcome";
	}
	@RequestMapping("/welcome")
	public String welcome2(Map<String, Object> model) {
		model.put("message", this.message+"  ::  "+new Date());
		return "welcome2";
	}
	@RequestMapping("/welcome2")
	public String welcome3(Map<String, Object> model) {
		model.put("message", this.message+"  ::  "+new Date());
		return "welcome3";
	}

}
