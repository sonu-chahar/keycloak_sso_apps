package com.keycloak.controller;

import java.awt.image.BufferedImage;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.util.ArrayList;
import java.util.List;

import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.ws.rs.client.Client;
import javax.ws.rs.client.ClientBuilder;
import javax.ws.rs.client.WebTarget;
import javax.ws.rs.core.Response;

import org.apache.commons.io.FileDeleteStrategy;
import org.apache.commons.lang.StringUtils;
import org.hibernate.exception.ConstraintViolationException;
import org.keycloak.KeycloakSecurityContext;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.commons.CommonsMultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.keycloak.model.UserMaster;
import com.keycloak.model.UserTypeMaster;
import com.keycloak.service.GenServicein;
import com.keycloak.service.UserMasterService;
import com.keycloak.util.Constants;

@Controller
@RequestMapping("**/myProfile")
public class MyProfileController extends AbstractPageController {

	private static final String VIEW_NAME_FOR_PROFILE = "myProfile";
	private static final String VIEW_NAME_FOR_UPDATE_PASSWORD = "changePasswordPage";
	
	public static final String CONSTANT_FOR_SLASH = "/";
	public static final String SSO_SERVER_URL = Constants.pathString("SSO_SERVER_URL");
	public static final String SSO_REALM_NAME = Constants.pathString("SSO_REALM_NAME");
	public static final String SSO_CLIENT_ID = Constants.pathString("SSO_CLIENT_ID");
	public static final String SSO_CLIENT_SECRET_ID = Constants.pathString("SSO_CLIENT_SECRET_ID");
	public static final String SSO_USERNAME_SERVICE_ACCOUNT = Constants.pathString("SSO_USERNAME_SERVICE_ACCOUNT");
	public static final String SSO_PASSWORD_SERVICE_ACCOUNT = Constants.pathString("SSO_PASSWORD_SERVICE_ACCOUNT");


	@Autowired
	private UserMasterService userMasterService;

	@Autowired
	private GenServicein<UserTypeMaster> genericUserTypeService;

	@Autowired
	private BCryptPasswordEncoder bCryptPasswordEncoder;

//	@Autowired
//	private Keycloak keycloak;

//	@Autowired
//	private UserResource userResource;
//	
//	@Autowired
//	private KeyCloakService keycloakService;

	@RequestMapping(value = "**/showProfile", method = RequestMethod.GET)
	public ModelAndView showMyProfile(@ModelAttribute(MODEL_ATTRIBUTE_FOR_USER_MASTER) UserMaster userMasterDTO,
			BindingResult result, ModelMap model, HttpServletRequest request) {
		LOGGER.debug("show User Profile Page......");

		userMasterDTO = getUserMasterFromSession(request);

		String imageStatus = StringUtils.isNotBlank(request.getParameter(IMAGE_UPLOAD_STATUS))
				? request.getParameter(IMAGE_UPLOAD_STATUS)
				: BLANK_STRING;

		model.addAttribute(IMAGE_UPLOAD_STATUS, imageStatus);

		model.addAttribute(MODEL_ATTRIBUTE_MESSAGE, getMessageAttributeForPage(request, CLASSNAME_FOR_MESSAGE));

		model.addAttribute("userTypeList", genericUserTypeService.getAllNew(UserTypeMaster.class));

		return new ModelAndView(VIEW_NAME_FOR_PROFILE, model);
	}

	@RequestMapping(value = "**/updateProfile", method = RequestMethod.POST)
	public ModelAndView updateProfile(@ModelAttribute(MODEL_ATTRIBUTE_FOR_USER_MASTER) UserMaster userMasterDTO,
			BindingResult result, HttpServletRequest request, RedirectAttributes redirectAttributes) {
		LOGGER.debug("Received request to update user");
		String status = BLANK_STRING;
		if (userMasterDTO.getImageFile() != null && userMasterDTO.getImageFile().getSize() > 0) {
			if (!saveImage(userMasterDTO)) {
				redirectAttributes.addFlashAttribute(IMAGE_UPLOAD_STATUS, "Cannot upload image !");
			}
		} else {
			if (!deleteImage(userMasterDTO)) {
				redirectAttributes.addFlashAttribute(IMAGE_UPLOAD_STATUS, "Image cannot be removed");
			}
		}

		try {
			UserMaster oldUserMaster = (UserMaster) request.getSession(false)
					.getAttribute(SESSION_ATTRIBTE_FOR_USER_MASTER);
			userMasterDTO.setUsername(oldUserMaster.getUsername());
			userMasterDTO.setPassword(oldUserMaster.getPassword());
			userMasterDTO.setId(oldUserMaster.getId());
			userMasterDTO.setKcUserId(oldUserMaster.getKcUserId());
			if (oldUserMaster.getUserIpAddress() == null) {
				userMasterDTO.setUserIpAddress(getClientIp(request));
			}
			// userMasterDTO.setRoles(oldUserMaster.getRoles());
			userMasterDTO.setIsActive(true);
			userMasterDTO = userMasterService.save(userMasterDTO);
			request.getSession(false).setAttribute(SESSION_ATTRIBTE_FOR_USER_MASTER, userMasterDTO);
			status = STATUS_FOR_UPDATE;
		} catch (ConstraintViolationException e) {
			status = STATUS_FOR_DUPLICATE;
		} catch (Exception e) {
			LOGGER.debug(e.getStackTrace());
			status = STATUS_FOR_ERROR;
		}
		request.getSession(false).setAttribute(SESSION_ATTRIBTE_FOR_USER_MASTER, userMasterDTO);
//		return new ModelAndView("redirect:" + request.getContextPath() + "/myProfile/showProfile?status=" + status);
		return new ModelAndView(REDIRECT_URL_FOR_PROFILE + status);
	}

	private boolean saveImage(UserMaster userMasterDTO) {
		String fileDir = Constants.pathString(IMAGE_PATH);
		// Image
		File file = null;
		FileOutputStream outputStream = null;
		CommonsMultipartFile multipartFile = userMasterDTO.getImageFile();
		String fileName = BLANK_STRING;
		String extension = BLANK_STRING;
		if (multipartFile != null) {
			fileName = multipartFile.getOriginalFilename().substring(0,
					multipartFile.getOriginalFilename().indexOf(CONSTANT_FOR_DOT));
			extension = multipartFile.getOriginalFilename()
					.substring(multipartFile.getOriginalFilename().indexOf(CONSTANT_FOR_DOT) + 1);
		}

		String filePath = fileDir + userMasterDTO.getMobileNumber();

		try {
			file = new File(filePath);
			boolean success = file.mkdirs();
			if (!success) {
				for (File fin : file.listFiles()) {
					FileDeleteStrategy.FORCE.deleteQuietly(fin);
				}
			}
			file = new File(filePath + CONSTANT_FOR_SLASH + fileName + CONSTANT_FOR_DOT + extension);
			file.createNewFile();
			outputStream = new FileOutputStream(file);
			outputStream.write(multipartFile.getFileItem().get());
			outputStream.close();
			userMasterDTO.setImageName(fileName);
			userMasterDTO.setFileExtension(extension);
		} catch (Exception e) {
			LOGGER.debug(e.getStackTrace());
			return false;
		} finally {
			multipartFile = null;
			outputStream = null;
			file = null;
		}
		return true;
	}

	private boolean deleteImage(UserMaster userMasterDTO) {
		if (StringUtils.isBlank(userMasterDTO.getImageName())
				&& StringUtils.isBlank(userMasterDTO.getFileExtension())) {
			String fileDir = Constants.pathString(IMAGE_PATH);
			String filePath = fileDir + userMasterDTO.getMobileNumber();
			try {
				File file = new File(filePath);
				boolean success = file.mkdirs();
				if (!success) {
					for (File fin : file.listFiles()) {
						FileDeleteStrategy.FORCE.deleteQuietly(fin);
					}
				}
			} catch (Exception e) {
				return false;
			}
		}
		return true;
	}

	@RequestMapping(value = "/getImage/{mobileNumber}/{imageName}/{imageExtension}")
	@ResponseBody
	public void getImage(@PathVariable("mobileNumber") String mobileNumber, @PathVariable("imageName") String imageName,
			@PathVariable("imageExtension") String imageExtension, HttpServletResponse response) {
		LOGGER.debug("request to get Student Image....");
		String fileDir = Constants.pathString(IMAGE_PATH);

		String filePath = fileDir + mobileNumber + CONSTANT_FOR_SLASH + imageName + CONSTANT_FOR_DOT + imageExtension;

		List<String> imageExtensionList = new ArrayList<>();
		imageExtensionList.add("png");
		imageExtensionList.add("jpeg");
		imageExtensionList.add("jpg");
		imageExtensionList.add("gif");
		if (imageExtensionList.contains(imageExtension)) {
			response.setContentType("image/" + imageExtension);
			OutputStream out = null;
			BufferedImage img = null;
			try {
				img = ImageIO.read(new File(filePath));
				out = response.getOutputStream();
				ImageIO.write(img, imageExtension, out);
				out.close();
			} catch (IOException e) {
				LOGGER.error("File is not present OR access denied!");
			} finally {
				img = null;
			}
		}
	}

	@RequestMapping(value = "**/showChangePwdPage", method = RequestMethod.GET)
	public ModelAndView showChangePasswordPage(
			@ModelAttribute(MODEL_ATTRIBUTE_FOR_USER_MASTER) UserMaster userMasterDTO, HttpServletRequest request,
			ModelMap model) {

		model.addAttribute(MODEL_ATTRIBUTE_MESSAGE, getMessageAttributeForPage(request, CLASSNAME_FOR_MESSAGE));
		return new ModelAndView(VIEW_NAME_FOR_UPDATE_PASSWORD);
	}

	@RequestMapping(value = "**/updatePassword", method = RequestMethod.POST)
	public ModelAndView showUserRegistrationForm(
			@ModelAttribute(MODEL_ATTRIBUTE_FOR_USER_MASTER) UserMaster userMasterDTO, BindingResult bindingResult,
			HttpServletRequest request, ModelMap model) throws Exception {
		UserMaster userMasterFetchedFromSession = getUserMasterFromSession(request);
		userMasterDTO.setUsername(userMasterFetchedFromSession.getUsername());
		userMasterDTO.setKcUserId(userMasterFetchedFromSession.getKcUserId());
		String status=null;
		/*if(userResource!=null) {
			if(KeycloakAdminClientApp.resetPassword(userResource,userMasterDTO)) {
				status = "Password has been updated Successfully";
			}else {
				status = "Error occurred while updating password...";
			}
		}else {*/
//			if(KeycloakAdminClientApp.resetPassword(userMasterDTO)) {
//				status = "Password has been updated Successfully";
//			}else {
//				status = "Error occurred while updating password...";
//			}
//			if(KeycloakResetPasswordUtil.resetPassword(request,userMasterDTO)) {
//				status = "Password has been updated Successfully";
//			}else {
//				status = "Error occurred while updating password...";
//			}
		/* } */
		
//		UserMaster userMasterFetchedFromSession = getUserMasterFromSession(request);
//		String oldPassword = userMasterFetchedFromSession.getPassword();
//		userMasterFetchedFromSession.setPassword(bCryptPasswordEncoder.encode(userMasterDTO.getPassword()));
//
//		String status = BLANK_STRING;
//		try {
//
//			userMasterFetchedFromSession = userMasterService.save(userMasterFetchedFromSession);
//			request.getSession(false).setAttribute(SESSION_ATTRIBTE_FOR_USER_MASTER, userMasterFetchedFromSession);
//			status = "Password has been updated Successfully";
//		} catch (Exception e) {
//			userMasterFetchedFromSession.setPassword(oldPassword);
//			LOGGER.debug(e.getStackTrace());
//			status = "Error occurred while updating password...";
//		}

		/*
		 * return new ModelAndView( "redirect:" + request.getContextPath() +
		 * "/myProfile/showChangePwdPage?status=" + status);
		 */
		
		KeycloakSecurityContext session = (KeycloakSecurityContext)request.getAttribute(KeycloakSecurityContext.class.getName());
		String url = SSO_SERVER_URL + CONSTANT_FOR_SLASH + "admin/realms" + CONSTANT_FOR_SLASH + SSO_REALM_NAME
				+ CONSTANT_FOR_SLASH + "users" + CONSTANT_FOR_SLASH + userMasterDTO.getKcUserId() + CONSTANT_FOR_SLASH
				+ "reset-password";
		String jsonBody = "{\"type\":\"password\",\"value\":\""+userMasterDTO.getConfirmPassword()+"\",\"temporary\":\"false\"}";

//		ClientRequest clientRequest = new ClientRequest(url);
//		clientRequest.body("application/json", jsonBody);
//		clientRequest.accept("application/json");
//		clientRequest.header("Authorization", "Bearer " + session.getTokenString());
//		ClientResponse clientresponse = clientRequest.put(String.class);
//		String resp = (String) clientresponse.getEntity();
//		Client client = ClientBuilder.newClient();
		 Client client = ClientBuilder.newBuilder().build();
		 WebTarget target = client.target(url);
//		 Response response = target.request().put(String.class);
		return new ModelAndView(REDIRECT_URL_FOR_UPDATE_PASSWORD + status);
	}

	private static String getClientIp(HttpServletRequest request) {

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
