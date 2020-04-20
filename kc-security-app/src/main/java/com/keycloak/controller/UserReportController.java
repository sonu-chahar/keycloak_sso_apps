package com.keycloak.controller;

import java.beans.PropertyEditorSupport;
import java.net.URI;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.keycloak.adapters.springsecurity.client.KeycloakRestTemplate;
import org.keycloak.representations.idm.UserSessionRepresentation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.keycloak.report.CustomUserRepresentation;
import com.keycloak.report.UserReportDTO;
import com.keycloak.service.UserMasterService;

@Controller
public class UserReportController extends AbstractPageController {
	@Autowired
	private KeycloakRestTemplate restTemplate;

	@Value("${keycloak.auth-server-url}")
	private String keycloakServerUrl;
	
	@Value("${keycloak.realm}")
	private String realmName;
	@Value("${keycloak.credentials.secret}")
	private String clientSecret;

	@Autowired
	private UserMasterService userMasterService;

	private static final String VIEW_NAME_FOR_USER_REPORT = "userReport";
	private static final String MODEL_ATTRIBUTE_FOR_USER_REPORT = "userReportDTO";
	private static final String USER_REPORT_CLASSNAME_FOR_MESSAGE = "User Report";

	@InitBinder
	public void binder(WebDataBinder binder) {
		binder.registerCustomEditor(Date.class, new PropertyEditorSupport() {
			public void setAsText(String value) {
				try {
					setValue(new SimpleDateFormat("dd/MM/yyyy").parse(value));
				} catch (ParseException e) {
					setValue(null);
				}
			}
//			public String getAsText() {
//				return new SimpleDateFormat("dd/MM/yyyy").format((Date) getValue());
//			}

		});
		// as shown above
	}

	@RequestMapping(value = "**/userReport/showUserReportPage", method = RequestMethod.GET)
	public ModelAndView showUserReportPage(@ModelAttribute(MODEL_ATTRIBUTE_FOR_USER_REPORT) UserReportDTO userReportDTO,
			ModelMap model, HttpServletRequest request) {
		LOGGER.debug("show User Report Page......");
		model.addAttribute(MODEL_ATTRIBUTE_MESSAGE,
				getMessageAttributeForPage(request, USER_REPORT_CLASSNAME_FOR_MESSAGE));
		return new ModelAndView(VIEW_NAME_FOR_USER_REPORT, model);
	}

	@RequestMapping(value = "**/userReport/getUsers", method = RequestMethod.POST)
	public ModelAndView getUsers(@ModelAttribute(MODEL_ATTRIBUTE_FOR_USER_REPORT) UserReportDTO userReportDTO,
			BindingResult result, ModelMap model, HttpServletRequest request) {
		LOGGER.debug("show User Report Page......");
		if (result.hasErrors()) {
			LOGGER.error("Error in User Report object....");
			return new ModelAndView(REDIRECT_URL_FOR_USER_REPORT + "Error in User Report object....");
		}
		List<CustomUserRepresentation> list = getAllUsers(userReportDTO);
		
		if (list.size() == 0) {
			model.addAttribute(MODEL_ATTRIBUTE_MESSAGE, "No Record Found!!!");
		} else {
			model.addAttribute("userList", list);
		}
		userReportDTO=new UserReportDTO();
//		getSessionStats();
//		getActiveSessionStatsByClientId();

		return new ModelAndView(VIEW_NAME_FOR_USER_REPORT, model);
	}

	public List<CustomUserRepresentation> getAllUsers(UserReportDTO userReportDTO) {
		List<CustomUserRepresentation> usrList = new ArrayList<>();
		String usrListUrl = keycloakServerUrl + "/admin/realms/"+realmName+"/users?";
		if (userReportDTO.getName() != null) {
			usrListUrl = usrListUrl + "search=" + userReportDTO.getName();
		}
		List list = restTemplate.getForEntity(URI.create(usrListUrl), List.class).getBody();
		List<HashMap<String, Object>> userList = new ArrayList<HashMap<String, Object>>(list.size());
		String columns[] = new String[] { "username", "kcUserId" };
		for (int i = 0; i < list.size(); i++) {
			Map<String, Object> linkedHashMap = (Map<String, Object>) list.get(i);
			CustomUserRepresentation customUserRepresentation = new CustomUserRepresentation();
			customUserRepresentation.setKcUserId((String) linkedHashMap.get("id"));
			customUserRepresentation
					.setName((String) linkedHashMap.get("firstName") + " " + (String) linkedHashMap.get("lastName"));

			DateFormat simple = new SimpleDateFormat("dd MMM yyyy HH:mm:ss Z");
			Date createdDate = new Date((Long) linkedHashMap.get("createdTimestamp"));

			if (userReportDTO.getFromDate() != null) {
				if (createdDate.before(userReportDTO.getFromDate())) {
					continue;
				}
			}
			if (userReportDTO.getToDate() != null) {
				if (createdDate.after(userReportDTO.getToDate())) {
					continue;
				}
			}
			customUserRepresentation.setCreatedTime(simple.format(createdDate));

			customUserRepresentation.setEmailId((String) linkedHashMap.get("email"));
			
			customUserRepresentation.setUsername((String) linkedHashMap.get("username"));
			
			if (userReportDTO.getIsActive() != null && userReportDTO.getIsActive()==true ) {
				boolean isEnabled=(boolean) linkedHashMap.get("enabled");
				if(isEnabled) {
					usrList.add(customUserRepresentation);
				}else {
					continue;
				}
				
			}else {
				usrList.add(customUserRepresentation);
			}
		}
		return usrList;
	}
	
	public void getSessionStats() {
		String activeSessions = keycloakServerUrl + "/admin/realms/"+realmName+"/client-session-stats?";
		List list = restTemplate.getForEntity(URI.create(activeSessions), List.class).getBody();
	}
	
	public void getActiveSessionStatsByClientId() {
		
		String activeSessions = keycloakServerUrl + "/admin/realms/"+realmName+"/clients/"+this.clientSecret;
		List<UserSessionRepresentation> userSessionRepresentationList=new ArrayList<>();
		userSessionRepresentationList = restTemplate.getForEntity(URI.create(activeSessions), userSessionRepresentationList.getClass()).getBody();
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