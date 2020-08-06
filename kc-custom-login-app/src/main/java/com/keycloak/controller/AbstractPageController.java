package com.keycloak.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang.StringUtils;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.keycloak.KeycloakSecurityContext;
import org.keycloak.representations.IDToken;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;

import com.keycloak.model.UserMaster;
import com.keycloak.service.UserMasterService;

public abstract class AbstractPageController {
	public static final String SESSION_ATTRIBTE_FOR_USER_MASTER = "userMaster";
	public static final String SESSION_ATTRIBTE_FOR_GENERATED_OTP = "generatedOtp";
	public static final String MODEL_ATTRIBUTE_MESSAGE = "message";
	public static final String REQUEST_ATTRIBUTE_STATUS = "status";
	public static final String REQUEST_ATTRIBUTE_VERIFY_MOBILE = "verifyMobileMsg";
	public static final String MODEL_ATTRIBUTE_FOR_USER_MASTER = "userMasterDTO";
	public static final String MODEL_ATTRIBUTE_FOR_APPLICATION_MASTER_MAPPING = "applicationMasterDTO";

	public static final String REDIRECT_URL_FOR_REGISTRATION = "redirect:/registration/showRegistrationPage?status=";
	public static final String REDIRECT_URL_FOR_HOMEPAGE = "redirect:/viewHomePage?status=";
	public static final String REDIRECT_URL_FOR_HOMEPAGE_WITH_CHART = "redirect:/homePage";
	public static final String REDIRECT_URL_FOR_PROFILE = "redirect:/myProfile/showProfile?status=";
	public static final String REDIRECT_URL_FOR_UPDATE_PASSWORD = "redirect:/myProfile/showChangePwdPage?status=";
	public static final String REDIRECT_URL_FOR_APPLICATION_MASTER_MAPPING = "redirect:/myProfile/addOrUpdateApplicationMapping?status=";
	public static final String REDIRECT_URL_FOR_APPLICATION_MASTER = "redirect:/myProfile/addOrUpdateApplicationMapping?status=";
	public static final String REDIRECT_URL_FOR_USER_REPORT = "redirect:/userReport/showUserReportPage?status=";

	public static final String USER_CLASSNAME_FOR_MESSAGE = "User";

	public static final String IMAGE_PATH = "fileDir";
	public static final String IMAGE_UPLOAD_STATUS = "imageStatus";

	public static final String STATUS_FOR_SUCCESS = "success";
	public static final String STATUS_FOR_UPDATE = "updateSuccess";
	public static final String STATUS_FOR_DUPLICATE = "duplicate";
	public static final String STATUS_FOR_ERROR = "error";
	public static final String STATUS_FOR_DELETED = "deleted";
	public static final String STATUS_FOR_NOT_DELETED = "cannotdelete";
	public static final String STATUS_FOR_ALREADY_DELETED = "alreadydeleted";

	public static final String CONSTANT_FOR_SLASH = "/";
	public static final String CONSTANT_FOR_DOT = ".";
	public static final String BLANK_STRING = "";

	public static final String VIEW_NAME_HOME_PAGE = "homePage";
	public static final String VIEW_NAME_HOME_PAGE_WITH_CHART = "homePageWithChart";
	public static final String VIEW_NAME_HOME_PAGE_WITH_INTERNATIONALIZATION = "homePageInternationalization";

	public static final String SPAN_OPENNING_TAG = "<span>";
	public static final String SPAN_CLOSING_TAG = "</span>";

	protected final Logger LOGGER = LogManager.getLogger(this.getClass());

	@Autowired
	private UserMasterService userMasterService;

	protected UserMaster getUserMasterFromSession(HttpServletRequest request) {
		return setUserMasterInSessionFromSecurityContextAndGetUserMasterFromSession(request);
	}

	public String getMessageAttributeForPage(HttpServletRequest request, String className) {
		String status = StringUtils.isNotBlank(request.getParameter(REQUEST_ATTRIBUTE_STATUS))
				? request.getParameter(REQUEST_ATTRIBUTE_STATUS)
				: BLANK_STRING;
		String message = BLANK_STRING;

		/* set success/error message if request is coming after add/edit */
		if (StringUtils.isNotBlank(status)) {
			if (StringUtils.equals(status, STATUS_FOR_SUCCESS))
				message = SPAN_OPENNING_TAG + className + " Saved Successfully !" + SPAN_CLOSING_TAG;
			else if (StringUtils.equals(status, STATUS_FOR_UPDATE))
				message = SPAN_OPENNING_TAG + className + " Updated Successfully !" + SPAN_CLOSING_TAG;
			else if (StringUtils.equals(status, STATUS_FOR_ERROR))
				message = SPAN_OPENNING_TAG + "Some error occured!</span>";
			else if (StringUtils.equals(status, STATUS_FOR_DELETED))
				message = SPAN_OPENNING_TAG + className + " Deleted Successfully !" + SPAN_CLOSING_TAG;
			else if (StringUtils.equals(status, STATUS_FOR_NOT_DELETED))
				message = SPAN_OPENNING_TAG + "Can't delete this record it is being used" + SPAN_CLOSING_TAG;
			else if (StringUtils.equals(status, STATUS_FOR_ALREADY_DELETED))
				message = SPAN_OPENNING_TAG + "<img src='" + request.getContextPath()
						+ "/images/iconWarning.gif'>DegreeCycle is Already Deleted !" + SPAN_CLOSING_TAG;
			else if (StringUtils.equals(status, STATUS_FOR_DUPLICATE))
				message = SPAN_OPENNING_TAG + "Duplicate Record found" + SPAN_CLOSING_TAG;
			else
				message = status;
		}
		return message;
	}

	protected UserMaster setUserMasterInSessionFromSecurityContextAndGetUserMasterFromSession(
			HttpServletRequest request) {
		HttpSession session = request.getSession(false);
		UserMaster userMaster = null;
		if (session != null) {
			UserMaster userMasterFromSession = ((UserMaster) session.getAttribute(SESSION_ATTRIBTE_FOR_USER_MASTER));
			if (userMasterFromSession != null) {
				userMaster = userMasterFromSession;
			} else {
				userMaster = getUserMasterFromSecurityContext(request);
				session = request.getSession();
				LOGGER.debug(session);
				session.setAttribute(SESSION_ATTRIBTE_FOR_USER_MASTER, userMaster);
			}
		} else {
			userMaster = getUserMasterFromSecurityContext(request);
			session = request.getSession();
			session.setAttribute(SESSION_ATTRIBTE_FOR_USER_MASTER, userMaster);
		}
		return userMaster;
	}

	private UserMaster getUserMasterFromSecurityContext(HttpServletRequest request) {
		Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		String username = null;
		UserMaster persistedUserMaster = null;
		String password = BLANK_STRING;
		if (principal instanceof UserDetails) {
			username = ((UserDetails) principal).getUsername();
			password = ((UserDetails) principal).getPassword();
		} else {
			username = principal.toString();
		}
		KeycloakSecurityContext context = (KeycloakSecurityContext) request
				.getAttribute(KeycloakSecurityContext.class.getName());
		if (context != null) {
			IDToken token = context.getIdToken();
			if (username != null) {
				persistedUserMaster = userMasterService.findByUsername(username);

				if (persistedUserMaster != null) {
					if (persistedUserMaster.getKcUserId() == null) {
						userMasterService.remove(persistedUserMaster.getId());
					} else if (!token.getSubject().equals(persistedUserMaster.getKcUserId())) {
						persistedUserMaster.setKcUserId(token.getSubject());
						userMasterService.save(persistedUserMaster);
					}
					persistedUserMaster.setConfirmPassword(password);
				} else {
					persistedUserMaster = new UserMaster();
					persistedUserMaster.setKcUserId(token.getId());
					persistedUserMaster.setUsername(token.getPreferredUsername());
					persistedUserMaster.setEmailId(token.getEmail());
					persistedUserMaster.setFirstName(token.getGivenName());
					persistedUserMaster.setLastName(token.getFamilyName());
					persistedUserMaster = userMasterService.save(persistedUserMaster);
				}
			}
		}
		return persistedUserMaster;
	}

	public KeycloakSecurityContext getKeycloakSecurityContext(HttpServletRequest request) {
		return (KeycloakSecurityContext) request.getAttribute(KeycloakSecurityContext.class.getName());
	}

	public static String getClientIp(HttpServletRequest request) {

		String remoteAddr = "";

		if (request != null) {
			remoteAddr = request.getHeader("X-FORWARDED-FOR");
			if (remoteAddr == null || "".equals(remoteAddr)) {
				remoteAddr = request.getRemoteAddr();
			}
		}

		return remoteAddr;
	}
}