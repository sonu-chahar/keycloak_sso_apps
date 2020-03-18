package com.keycloak.controller;

import java.net.URI;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.keycloak.adapters.springsecurity.client.KeycloakRestTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.keycloak.report.CustomUserRepresentation;
import com.keycloak.report.UserReportDTO;
import com.keycloak.service.UserMasterService;

@RestController
public class UserReportController extends AbstractPageController {
	@Autowired
	private KeycloakRestTemplate restTemplate;

	@Value("${keycloak.auth-server-url}")
	private String keycloakServerUrl;

	@Autowired
	private UserMasterService userMasterService;

	private static final String VIEW_NAME_FOR_USER_REPORT = "userReport";
	private static final String MODEL_ATTRIBUTE_FOR_USER_REPORT = "userReportDTO";
	private static final String USER_REPORT_CLASSNAME_FOR_MESSAGE = "User Report";

	@GetMapping("/userReport/getUsers")
	public ModelAndView showUserReportPage(@ModelAttribute(MODEL_ATTRIBUTE_FOR_USER_REPORT) UserReportDTO userReportDTO,
			ModelMap model, HttpServletRequest request) {
		LOGGER.debug("show User Report Page......");
		model.addAttribute(MODEL_ATTRIBUTE_MESSAGE,
				getMessageAttributeForPage(request, USER_REPORT_CLASSNAME_FOR_MESSAGE));
		return new ModelAndView(VIEW_NAME_FOR_USER_REPORT, model);
	}

	@PostMapping("/getUsers")
	public ModelAndView getUsers(@ModelAttribute(MODEL_ATTRIBUTE_FOR_USER_REPORT) UserReportDTO userReportDTO,
			BindingResult result, ModelMap model, HttpServletRequest request) {
		LOGGER.debug("show User Report Page......");
		if (result.hasErrors()) {
			LOGGER.error("Error in User Report object....");
			return new ModelAndView(REDIRECT_URL_FOR_USER_REPORT + "Error in User Report object....");
		}

		return new ModelAndView(VIEW_NAME_FOR_USER_REPORT, model);
	}

	@GetMapping("/api/userss")
	public List getAllUsers() {
		List<CustomUserRepresentation> usrList = new ArrayList<>();
		List list = restTemplate
				.getForEntity(URI.create(keycloakServerUrl + "/admin/realms/testRealm1/users"), List.class).getBody();
		List<HashMap<String, String>> userList = new ArrayList<HashMap<String, String>>(list.size());
		String columns[] = new String[] { "username", "kcUserId" };
		for (int i = 0; i < list.size(); i++) {
			Map<String, String> linkedHashMap = (Map<String, String>) list.get(i);
			CustomUserRepresentation customUserRepresentation = new CustomUserRepresentation();
			customUserRepresentation.setKcUserId(linkedHashMap.get("kcUserId"));
			customUserRepresentation.setFirstName(linkedHashMap.get("firstName"));
			customUserRepresentation.setKcUserId(linkedHashMap.get("kcUserId"));
			customUserRepresentation.setKcUserId(linkedHashMap.get("kcUserId"));

		}

//		String[] jsonStr = restTemplate
//				.getForEntity(URI.create(keycloakServerUrl + "/admin/realms/testRealm1/users"), String[].class).getBody();
//		ObjectMapper mapper = new ObjectMapper();
//		try {
//			CustomUserRepresentation[] userRepresentationArr = mapper.readValue(jsonStr,
//					CustomUserRepresentation[].class);
//		} catch (JsonParseException e) {
//			e.printStackTrace();
//		} catch (JsonMappingException e) {
//			e.printStackTrace();
//		} catch (IOException e) {
//			e.printStackTrace();
//		}

		return list;
	}

//	@GetMapping("/getAllUsers")
//	public ModelAndView empReport(HttpServletRequest request, HttpServletResponse response, ModelMap model) {
//
//		JRDataSource datasource = new JRBeanCollectionDataSource(empList);
//
//		model.addAttribute("datasource", datasource);
//		model.addAttribute("createdBy", "Chahar");
//
//		return new ModelAndView("employee-rpt", model);
//	}
}