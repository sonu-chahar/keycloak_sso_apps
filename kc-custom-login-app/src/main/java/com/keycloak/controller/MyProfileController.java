package com.keycloak.controller;

import java.awt.image.BufferedImage;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.io.Serializable;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.nio.charset.StandardCharsets;
import java.util.ArrayList;
import java.util.List;
import java.util.Random;

import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.validation.Valid;
import javax.ws.rs.Produces;
import javax.ws.rs.core.MediaType;

import org.apache.commons.io.FileDeleteStrategy;
import org.apache.commons.lang.StringUtils;
import org.apache.http.HttpEntity;
import org.apache.http.client.methods.CloseableHttpResponse;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.impl.client.CloseableHttpClient;
import org.apache.http.impl.client.HttpClients;
import org.apache.http.util.EntityUtils;
import org.hibernate.exception.ConstraintViolationException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.env.Environment;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.commons.CommonsMultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.keycloak.model.ApplicationMaster;
import com.keycloak.model.LocationMaster;
import com.keycloak.model.OtpDTO;
import com.keycloak.model.UserApplicationMapping;
import com.keycloak.model.UserMaster;
import com.keycloak.model.UserTypeMaster;
import com.keycloak.service.GenServicein;
import com.keycloak.service.UserMasterService;
import com.keycloak.util.Constants;
import com.keycloak.util.KeycloakAdminClientApp;

@Controller
@RequestMapping("**/myProfile")
public class MyProfileController extends AbstractPageController {
	@Autowired
	Environment environment;

	private static final String VIEW_NAME_FOR_PROFILE = "myProfile";
	private static final String VIEW_NAME_FOR_UPDATE_PASSWORD = "changePasswordPage";
	private static final String VIEW_NAME_FOR_ADD_APPLICATION = "addApplication";

	public static final String CONSTANT_FOR_SLASH = "/";
	public static final String SSO_SERVER_URL = Constants.pathString("SSO_SERVER_URL");
	public static final String SSO_REALM_NAME = Constants.pathString("SSO_REALM_NAME");
	public static final String SSO_CLIENT_ID = Constants.pathString("SSO_CLIENT_ID");
	public static final String SSO_CLIENT_SECRET_ID = Constants.pathString("SSO_CLIENT_SECRET_ID");
	public static final String SSO_USERNAME_SERVICE_ACCOUNT = Constants.pathString("SSO_USERNAME_SERVICE_ACCOUNT");
	public static final String SSO_PASSWORD_SERVICE_ACCOUNT = Constants.pathString("SSO_PASSWORD_SERVICE_ACCOUNT");

	private static final String CONSTANT_FOR_TRUE_FLAG = "true";
	@Autowired
	private UserMasterService userMasterService;

	@Autowired
	private GenServicein<UserTypeMaster> genericUserTypeService;

	@Autowired
	private GenServicein<UserApplicationMapping> genericUserApplicationMappingService;

	@Autowired
	private GenServicein<LocationMaster> genericLocationMasterService;

	@GetMapping(value = "**/showProfile")
	public ModelAndView showMyProfile(ModelMap model, HttpServletRequest request) {
		LOGGER.debug("show User Profile Page......");

		UserMaster userMasterDTO = getUserMasterFromSession(request);

		String imageStatus = StringUtils.isNotBlank(request.getParameter(IMAGE_UPLOAD_STATUS))
				? request.getParameter(IMAGE_UPLOAD_STATUS)
				: BLANK_STRING;
		String status = StringUtils.isNotBlank(request.getParameter(REQUEST_ATTRIBUTE_STATUS))
				? request.getParameter(REQUEST_ATTRIBUTE_STATUS)
				: BLANK_STRING;
		String verifyMobileMsg = StringUtils.isNotBlank(request.getParameter(REQUEST_ATTRIBUTE_VERIFY_MOBILE))
				? request.getParameter(REQUEST_ATTRIBUTE_VERIFY_MOBILE)
				: BLANK_STRING;
		if (status.equals(STATUS_FOR_UPDATE)) {
			return new ModelAndView(REDIRECT_URL_FOR_HOMEPAGE + status);
		}

		model.addAttribute(IMAGE_UPLOAD_STATUS, imageStatus);
		model.addAttribute(REQUEST_ATTRIBUTE_VERIFY_MOBILE, verifyMobileMsg);

		model.addAttribute(MODEL_ATTRIBUTE_MESSAGE, getMessageAttributeForPage(request, USER_CLASSNAME_FOR_MESSAGE));

		model.addAttribute("userTypeList", genericUserTypeService.getAllNew(UserTypeMaster.class));
		model.addAttribute("localityList", genericLocationMasterService.getAllNew(LocationMaster.class));

		String activeProfile = environment.getProperty("spring.profiles.active");
		model.addAttribute("activeProfile", activeProfile);
		model.addAttribute(MODEL_ATTRIBUTE_FOR_USER_MASTER, userMasterDTO);

		return new ModelAndView(VIEW_NAME_FOR_PROFILE, model);
	}

	@PostMapping(value = "**/updateProfile")
	public ModelAndView updateProfile(@Valid @ModelAttribute(MODEL_ATTRIBUTE_FOR_USER_MASTER) UserMaster userMasterDTO,
			BindingResult result, HttpServletRequest request, RedirectAttributes redirectAttributes) {
		LOGGER.debug("Received request to update user");
		if (result.hasErrors()) {
			LOGGER.error("Error in User Master object....");
			return new ModelAndView(REDIRECT_URL_FOR_PROFILE + BLANK_STRING);
		}
		UserMaster oldUserMaster = (UserMaster) request.getSession(false)
				.getAttribute(SESSION_ATTRIBTE_FOR_USER_MASTER);
		String status = BLANK_STRING;
		String otp = request.getParameter("otp");
		if (StringUtils.isNotEmpty(otp)
				&& otp.equals(request.getSession(false).getAttribute(SESSION_ATTRIBTE_FOR_GENERATED_OTP))) {
			if ("ndmcEmployee".equals(userMasterDTO.getUserType())
					&& StringUtils.isNotEmpty(userMasterDTO.getEmployeeCode())) {
				userMasterDTO.setEmployeeVerifiedStatus("true");
				userMasterDTO.setIsEmployeeVerified(true);

			} else {
				userMasterDTO.setEmployeeCode(null);
				userMasterDTO.setEmployeeVerifiedStatus(null);
				userMasterDTO.setIsEmployeeVerified(null);
			}
			userMasterDTO.setIsPhoneVerified(true);
			userMasterDTO.setPhoneVerifiedStatus(CONSTANT_FOR_TRUE_FLAG);
			request.getSession(false).removeAttribute(SESSION_ATTRIBTE_FOR_GENERATED_OTP);
		} else if (userMasterDTO.getMobileNumber() != null
				&& !userMasterDTO.getMobileNumber().equals(oldUserMaster.getMobileNumber())) {
			return new ModelAndView(REDIRECT_URL_FOR_PROFILE + "please enter a valid OTP!");
		}
		try {
			userMasterDTO.setUsername(oldUserMaster.getUsername());
			userMasterDTO.setPassword(oldUserMaster.getPassword());
			userMasterDTO.setId(oldUserMaster.getId());
			userMasterDTO.setKcUserId(oldUserMaster.getKcUserId());
			userMasterDTO.setIsActive(true);
			userMasterDTO.setActiveStatus(CONSTANT_FOR_TRUE_FLAG);
			if ((!oldUserMaster.getFirstName().equals(userMasterDTO.getFirstName()))
					|| (!oldUserMaster.getLastName().equals(userMasterDTO.getLastName()))
					|| (!oldUserMaster.getEmailId().equals(userMasterDTO.getEmailId()))) {
				status = KeycloakAdminClientApp.updateUserRepresentation(userMasterDTO);
			}

			if (STATUS_FOR_ERROR.equals(status)) {
				return new ModelAndView(REDIRECT_URL_FOR_PROFILE + status);
			}
			if (userMasterDTO.getImageFile() != null && userMasterDTO.getImageFile().getSize() > 0) {
				if (!saveImage(userMasterDTO)) {
					redirectAttributes.addFlashAttribute(IMAGE_UPLOAD_STATUS, "Cannot upload image !");
				}
			} else {
				if (!deleteImage(userMasterDTO)) {
					redirectAttributes.addFlashAttribute(IMAGE_UPLOAD_STATUS, "Image cannot be removed");
				}
			}

			userMasterDTO.setUserIpAddress(getClientIp(request));

			userMasterDTO = userMasterService.save(userMasterDTO);
			request.getSession(false).setAttribute(SESSION_ATTRIBTE_FOR_USER_MASTER, userMasterDTO);
			status = STATUS_FOR_UPDATE;
		} catch (ConstraintViolationException e) {
			status = STATUS_FOR_DUPLICATE;
		} catch (Exception e) {
			LOGGER.debug(e.getStackTrace());
			status = STATUS_FOR_ERROR;
		}

		return new ModelAndView(REDIRECT_URL_FOR_PROFILE + status);

	}

	private boolean saveImage(UserMaster userMasterDTO) {
		boolean isImageSaved = false;
		String fileDir = Constants.pathString(IMAGE_PATH);
		// Image
		File file = null;
		CommonsMultipartFile multipartFile = userMasterDTO.getImageFile();
		String fileName = BLANK_STRING;
		String extension = BLANK_STRING;
		if (multipartFile != null) {
			fileName = multipartFile.getOriginalFilename().substring(0,
					multipartFile.getOriginalFilename().indexOf(CONSTANT_FOR_DOT));
			extension = multipartFile.getOriginalFilename()
					.substring(multipartFile.getOriginalFilename().indexOf(CONSTANT_FOR_DOT) + 1);

			String filePath = fileDir + userMasterDTO.getMobileNumber();
			file = new File(filePath);
			boolean success = file.mkdirs();
			if (!success) {
				for (File fin : file.listFiles()) {
					FileDeleteStrategy.FORCE.deleteQuietly(fin);
				}
			}
			file = new File(filePath + CONSTANT_FOR_SLASH + fileName + CONSTANT_FOR_DOT + extension);
			try {
				success = file.createNewFile();
			} catch (IOException e1) {
				LOGGER.debug(e1.getStackTrace());
			}
			if (success) {
				try (FileOutputStream outputStream = new FileOutputStream(file);) {

					outputStream.write(multipartFile.getFileItem().get());
					userMasterDTO.setImageName(fileName);
					userMasterDTO.setFileExtension(extension);
					isImageSaved = true;

				} catch (Exception e) {
					LOGGER.debug(e.getStackTrace());
				}
			}
		}
		return isImageSaved;
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

	@GetMapping(value = "/getImage/{mobileNumber}/{imageName}/{imageExtension}")
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
			BufferedImage img = null;
			try (OutputStream out = response.getOutputStream();) {
				img = ImageIO.read(new File(filePath));
				ImageIO.write(img, imageExtension, out);
			} catch (IOException e) {
				LOGGER.error("File is not present OR access denied!");
			} finally {
				img = null;
			}
		}
	}

	@GetMapping(value = "**/showChangePwdPage")
	public ModelAndView showChangePasswordPage(
			@ModelAttribute(MODEL_ATTRIBUTE_FOR_USER_MASTER) UserMaster userMasterDTO, HttpServletRequest request,
			ModelMap model) {
		model.addAttribute(MODEL_ATTRIBUTE_MESSAGE, getMessageAttributeForPage(request, USER_CLASSNAME_FOR_MESSAGE));
		return new ModelAndView(VIEW_NAME_FOR_UPDATE_PASSWORD);
	}

	@PostMapping(value = "**/updatePassword")
	public ModelAndView updatePassword(@ModelAttribute(MODEL_ATTRIBUTE_FOR_USER_MASTER) UserMaster userMasterDTO,
			BindingResult bindingResult, HttpServletRequest request, ModelMap model) {
		UserMaster userMasterFetchedFromSession = getUserMasterFromSession(request);
		userMasterDTO.setUsername(userMasterFetchedFromSession.getUsername());
		userMasterDTO.setKcUserId(userMasterFetchedFromSession.getKcUserId());
		String status = null;
		try {
			status = KeycloakAdminClientApp.resetPassword(userMasterDTO);
		} catch (Exception e) {
			LOGGER.debug(e.getStackTrace());
			status = STATUS_FOR_ERROR;
		}
		return new ModelAndView(REDIRECT_URL_FOR_UPDATE_PASSWORD + status);
	}

	@GetMapping(value = "/generateOtp/{mobileNumber}")
	@ResponseBody
	@Produces(MediaType.APPLICATION_JSON)
	public OtpDTO generateOtpStatusInJSON(HttpServletRequest request,
			@PathVariable("mobileNumber") String mobileNumber) {
		char[] alphNum = Constants.ALPHANUMBERIC_NUMBER.toCharArray();

		Random rnd = Constants.RANDOM_NUMBER;

		StringBuilder sb = new StringBuilder();
		for (int i = 0; i < 6; i++) {
			sb.append(alphNum[rnd.nextInt(alphNum.length)]);
		}
		String generatedOtp = sb.toString();
		request.getSession(false).setAttribute(SESSION_ATTRIBTE_FOR_GENERATED_OTP, generatedOtp);
		String generatedMsg = "Your OTP for registration in SSO App is " + generatedOtp;

		CloseableHttpResponse httpResponse = null;
		HttpGet getRequest = null;
		try {
			getRequest = new HttpGet("http://sms.ndmc.gov.in/?SenderId=NDMCIT&Mobile="
					+ URLEncoder.encode(mobileNumber, StandardCharsets.UTF_8.toString()) + "&message="
					+ URLEncoder.encode(generatedMsg, StandardCharsets.UTF_8.toString()));
		} catch (UnsupportedEncodingException e1) {
			LOGGER.debug(e1.getStackTrace());
		}
		if (getRequest != null) {
			try (CloseableHttpClient client = HttpClients.createDefault()) {

				httpResponse = client.execute(getRequest);

				int responseCode = httpResponse.getStatusLine().getStatusCode();

				LOGGER.debug("**GET** request Url: {}", getRequest.getURI());
				LOGGER.debug("Response Code: {}", responseCode);

				HttpEntity httpEntity = httpResponse.getEntity();
				String apiOutput = EntityUtils.toString(httpEntity);
				ObjectMapper objectMapper = new ObjectMapper();
				OtpDTO responseDTO = objectMapper.readValue(apiOutput, OtpDTO.class);
				responseDTO.setData(responseDTO.getResponse().toString());
				responseDTO.setStatus(responseDTO.getStatus());
				LOGGER.debug("Content: {}", apiOutput);

				return responseDTO;

			} catch (UnsupportedOperationException | IOException e) {
				LOGGER.debug(e.getStackTrace());
				return null;
			} finally {
				if (httpResponse != null) {
					try {
						httpResponse.close();
					} catch (IOException e) {
						LOGGER.debug(e.getStackTrace());
					}
				}
				httpResponse = null;
			}
		} else {
			OtpDTO otpDTO = new OtpDTO();
			otpDTO.setData("error occured while sending otp!!!");
			otpDTO.setStatus("0");
			return new OtpDTO();
		}
	}

	@GetMapping(value = "**/addOrUpdateApplicationMapping")
	public ModelAndView showApplicationMappingPage(
			@ModelAttribute(MODEL_ATTRIBUTE_FOR_APPLICATION_MASTER_MAPPING) ApplicationMaster applicationMasterDTO,
			HttpServletRequest request, ModelMap model) {
		model.addAttribute(MODEL_ATTRIBUTE_MESSAGE, getMessageAttributeForPage(request, "ApplicationMapping"));
		model.addAttribute("applicationList", userMasterService.getApplicationList());
		return new ModelAndView(VIEW_NAME_FOR_ADD_APPLICATION);
	}

	@PostMapping(value = "**/addOrUpdateApplicationMapping")
	public ModelAndView updateApplicationMapping(
			@ModelAttribute(MODEL_ATTRIBUTE_FOR_APPLICATION_MASTER_MAPPING) ApplicationMaster applicationMasterDTO,
			BindingResult bindingResult, HttpServletRequest request, ModelMap model) {
		Long userId = getUserMasterFromSession(request).getId();
		String status = BLANK_STRING;
		String columns[] = new String[] { "userMasterId" };
		Serializable values[] = new Serializable[] { userId };
		List<UserApplicationMapping> userApplicationMappingList = genericUserApplicationMappingService
				.findValuesByColumns(columns, values, UserApplicationMapping.class);
		if (userApplicationMappingList != null) {
			for (int i = 0; i < userApplicationMappingList.size(); i++) {
				genericUserApplicationMappingService.remove(userApplicationMappingList.get(i));
			}
		}
		String[] applicationIdsStr = request.getParameterValues("applicationsMapped");
		if (applicationIdsStr != null) {
			for (int i = 0; i < applicationIdsStr.length; i++) {
				UserApplicationMapping userApplicationMapping = new UserApplicationMapping(userId,
						Integer.parseInt(applicationIdsStr[i]));
				userApplicationMapping = genericUserApplicationMappingService.save(userApplicationMapping);
				if (userApplicationMapping.getId() != null) {
					status = STATUS_FOR_SUCCESS;
				} else {
					status = STATUS_FOR_ERROR;
				}
			}
		}
		return new ModelAndView(REDIRECT_URL_FOR_APPLICATION_MASTER_MAPPING + status);
	}

	public static final okhttp3.MediaType JSON = okhttp3.MediaType.parse("application/json; charset=utf-8");

}
