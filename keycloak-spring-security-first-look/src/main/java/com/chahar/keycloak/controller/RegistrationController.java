package com.chahar.keycloak.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping(value = "**/registration")
public class RegistrationController extends AbstractPageController {

//	private static final String VIEW_NAME_FOR_USER_REGISTRATION = "userRegistration";
//
//	@Autowired
//	private UserMasterService userMasterService;
//
//	@Autowired
//	private SecurityService securityService;
//
//	@Autowired
//	private GenServicein<UserTypeMaster> genericUserTypeService;
//
//	@RequestMapping(value = "**/showRegistrationPage", method = RequestMethod.GET)
//	public ModelAndView showUserRegistrationForm(@ModelAttribute(MODEL_ATTRIBUTE_FOR_USER_MASTER) UserMaster userMaster,
//			BindingResult bindingResult, ModelMap model, HttpServletRequest request) {
//		LOGGER.debug("showing New Registration Page");
//
//		model.addAttribute("message", getMessageAttributeForPage(request, CLASSNAME_FOR_MESSAGE));
//
//		SecurityContextHolder.getContext().setAuthentication(null);
//		model.addAttribute("userTypeList", genericUserTypeService.getAllNew(UserTypeMaster.class));
//		request.getSession().invalidate();
//		return new ModelAndView(VIEW_NAME_FOR_USER_REGISTRATION, model);
//	}
//
//	@RequestMapping(value = "**/registerNewUser", method = RequestMethod.POST)
//	public ModelAndView saveNewRegistration(@ModelAttribute(MODEL_ATTRIBUTE_FOR_USER_MASTER) UserMaster userMaster,
//			BindingResult bindingResult, RedirectAttributes redirectAttributes, HttpServletRequest request,
//			HttpServletResponse response) {
//		LOGGER.debug("IN POST REQUEST");
////		userValidator.validate(userMaster, bindingResult);
//		if (bindingResult.hasErrors()) {
//			return new ModelAndView(VIEW_NAME_FOR_USER_REGISTRATION);
//		}
//		if (KeycloakAdminClientApp.createUserAtKeycloak(userMaster)) {
//			userMaster.setTempPassword(null);
//		} else {
//			userMaster.setTempPassword(userMaster.getConfirmPassword());
//		}
//
//		String status = BLANK_STRING;
//		try {
//			// userMaster=userMasterService.save(userMaster);
//			userMaster = userMasterService.get(userMasterService.saveUser(userMaster));
//			securityService.autoLogin(userMaster.getUsername(), userMaster.getConfirmPassword());
//			request.getSession(false).setAttribute(SESSION_ATTRIBTE_FOR_USER_MASTER, userMaster);
//			status = STATUS_FOR_SUCCESS;
//			return new ModelAndView(REDIRECT_URL_FOR_PROFILE + status);
//		} catch (ConstraintViolationException e) {
//			status = STATUS_FOR_DUPLICATE;
//		} catch (Exception e) {
//			LOGGER.debug(e.getStackTrace());
//			status = STATUS_FOR_ERROR;
//		}
//		return new ModelAndView(REDIRECT_URL_FOR_REGISTRATION + status);
//	}
}