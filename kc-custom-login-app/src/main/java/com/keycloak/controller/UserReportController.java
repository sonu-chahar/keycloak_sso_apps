package com.keycloak.controller;

import java.beans.PropertyEditorSupport;
import java.net.URI;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.keycloak.adapters.springsecurity.client.KeycloakRestTemplate;
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
import org.springframework.web.servlet.ModelAndView;

import com.keycloak.report.CustomUserRepresentation;
import com.keycloak.report.UserReportDTO;

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

	private static final String VIEW_NAME_FOR_USER_REPORT = "userReport";
	private static final String MODEL_ATTRIBUTE_FOR_USER_REPORT = "userReportDTO";
	private static final String USER_REPORT_CLASSNAME_FOR_MESSAGE = "User Report";

	@InitBinder
	public void binder(WebDataBinder binder) {
		binder.registerCustomEditor(Date.class, new PropertyEditorSupport() {
			@Override
			public void setAsText(String value) {
				try {
					setValue(new SimpleDateFormat("dd/MM/yyyy").parse(value));
				} catch (ParseException e) {
					setValue(null);
				}
			}
		});
	}

	@GetMapping(value = "**/userReport/showUserReportPage")
	public ModelAndView showUserReportPage(@ModelAttribute(MODEL_ATTRIBUTE_FOR_USER_REPORT) UserReportDTO userReportDTO,
			ModelMap model, HttpServletRequest request) {
		log.debug("show User Report Page......");
		model.addAttribute(MODEL_ATTRIBUTE_MESSAGE,
				getMessageAttributeForPage(request, USER_REPORT_CLASSNAME_FOR_MESSAGE));
		return new ModelAndView(VIEW_NAME_FOR_USER_REPORT, model);
	}

	@PostMapping(value = "**/userReport/getUsers")
	public ModelAndView getUsers(@ModelAttribute(MODEL_ATTRIBUTE_FOR_USER_REPORT) UserReportDTO userReportDTO,
			BindingResult result, ModelMap model, HttpServletRequest request) {
		log.debug("show User Report Page......");
		if (result.hasErrors()) {
			log.error("Error in User Report object....");
			return new ModelAndView(REDIRECT_URL_FOR_USER_REPORT + "Error in User Report object....");
		}
		List<CustomUserRepresentation> list = getAllUsers(userReportDTO);

		if (list.isEmpty()) {
			model.addAttribute(MODEL_ATTRIBUTE_MESSAGE, "No Record Found!!!");
		} else {
			model.addAttribute("userList", list);
		}
		model.addAttribute(MODEL_ATTRIBUTE_FOR_USER_REPORT, new UserReportDTO());

		return new ModelAndView(VIEW_NAME_FOR_USER_REPORT, model);
	}

	@SuppressWarnings({ "rawtypes", "unchecked" })
	public List<CustomUserRepresentation> getAllUsers(UserReportDTO userReportDTO) {
		List<CustomUserRepresentation> usrList = new ArrayList<>();
		String usrListUrl = keycloakServerUrl + "/admin/realms/" + realmName + "/users?";
		if (userReportDTO.getName() != null) {
			usrListUrl = usrListUrl + "search=" + userReportDTO.getName();
		}
		List list = restTemplate.getForEntity(URI.create(usrListUrl), List.class).getBody();
		for (int i = 0; i < list.size(); i++) {
			Map<String, Object> linkedHashMap = (Map<String, Object>) list.get(i);
			CustomUserRepresentation customUserRepresentation = new CustomUserRepresentation();
			customUserRepresentation.setKcUserId((String) linkedHashMap.get("id"));
			customUserRepresentation
					.setName((String) linkedHashMap.get("firstName") + " " + (String) linkedHashMap.get("lastName"));

			DateFormat simple = new SimpleDateFormat("dd MMM yyyy HH:mm:ss Z");
			Date createdDate = new Date((Long) linkedHashMap.get("createdTimestamp"));

			if (userReportDTO.getFromDate() != null && createdDate.before(userReportDTO.getFromDate())
					|| (userReportDTO.getToDate() != null && createdDate.after(userReportDTO.getToDate()))) {
				continue;
			}

			customUserRepresentation.setCreatedTime(simple.format(createdDate));

			customUserRepresentation.setEmailId((String) linkedHashMap.get("email"));

			customUserRepresentation.setUsername((String) linkedHashMap.get("username"));

			if (userReportDTO.getIsActive() != null && userReportDTO.getIsActive()) {
				boolean isEnabled = (boolean) linkedHashMap.get("enabled");
				if (isEnabled) {
					usrList.add(customUserRepresentation);
				}
			} else {
				usrList.add(customUserRepresentation);
			}
		}
		return usrList;
	}
}