package com.keycloak.controller;

import java.awt.image.BufferedImage;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.util.ArrayList;
import java.util.List;
import java.util.Random;

import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.ws.rs.Produces;
import javax.ws.rs.core.MediaType;

import org.apache.commons.io.FileDeleteStrategy;
import org.apache.commons.lang.StringUtils;
import org.apache.http.HttpEntity;
import org.apache.http.HttpResponse;
import org.apache.http.client.ClientProtocolException;
import org.apache.http.client.HttpClient;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.impl.client.HttpClientBuilder;
import org.apache.http.util.EntityUtils;
import org.hibernate.exception.ConstraintViolationException;
import org.springframework.beans.factory.annotation.Autowired;
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

import com.fasterxml.jackson.databind.ObjectMapper;
import com.keycloak.model.OtpDTO;
import com.keycloak.model.UserMaster;
import com.keycloak.model.UserTypeMaster;
import com.keycloak.service.GenServicein;
import com.keycloak.service.UserMasterService;
import com.keycloak.util.Constants;
import com.keycloak.util.KeycloakAdminClientApp;

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

//	@Autowired
//	private BCryptPasswordEncoder bCryptPasswordEncoder;

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

		try {
			UserMaster oldUserMaster = (UserMaster) request.getSession(false)
					.getAttribute(SESSION_ATTRIBTE_FOR_USER_MASTER);
			userMasterDTO.setUsername(oldUserMaster.getUsername());
			userMasterDTO.setPassword(oldUserMaster.getPassword());
			userMasterDTO.setId(oldUserMaster.getId());
			userMasterDTO.setKcUserId(oldUserMaster.getKcUserId());
			userMasterDTO.setIsActive(true);
			status = KeycloakAdminClientApp.updateUserRepresentation(userMasterDTO);
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
			if (oldUserMaster.getUserIpAddress() == null) {
				userMasterDTO.setUserIpAddress(getClientIp(request));
			}
			// userMasterDTO.setRoles(oldUserMaster.getRoles());

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
	public ModelAndView showUpdatePasswordPage(
			@ModelAttribute(MODEL_ATTRIBUTE_FOR_USER_MASTER) UserMaster userMasterDTO, BindingResult bindingResult,
			HttpServletRequest request, ModelMap model) throws Exception {
		UserMaster userMasterFetchedFromSession = getUserMasterFromSession(request);
		userMasterDTO.setUsername(userMasterFetchedFromSession.getUsername());
		userMasterDTO.setKcUserId(userMasterFetchedFromSession.getKcUserId());
		String status = null;
		status = KeycloakAdminClientApp.resetPassword(userMasterDTO);
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

	@RequestMapping(value = "/generateOtp/{mobileNumber}")
	@ResponseBody
	@Produces(MediaType.APPLICATION_JSON)
	public OtpDTO generateOtpStatusInJSON(@PathVariable("mobileNumber") String mobileNumber) {
		char[] alphNum = "0123456789".toCharArray();
		Random rnd = new Random();
		StringBuilder sb = new StringBuilder();
		for (int i = 0; i < 6; i++) {
			sb.append(alphNum[rnd.nextInt(alphNum.length)]);
		}
		String generateOtp = sb.toString();

		try {
			HttpClient client = HttpClientBuilder.create().build();
			HttpGet request = new HttpGet(
					"http://sms.ndmc.gov.in/?SenderId=NDMCIT&Mobile=" + mobileNumber + "&message=" + generateOtp);
			HttpResponse response = client.execute(request);

			int responseCode = response.getStatusLine().getStatusCode();

			System.out.println("**GET** request Url: " + request.getURI());
			System.out.println("Response Code: " + responseCode);
			System.out.println("Content:-\n");
			HttpEntity httpEntity = response.getEntity();
			String apiOutput = EntityUtils.toString(httpEntity);
			ObjectMapper objectMapper = new ObjectMapper();
			OtpDTO responseDTO = objectMapper.readValue(apiOutput, OtpDTO.class);
			responseDTO.setData(responseDTO.getResponse().toString());
			responseDTO.setStatus(responseDTO.getStatus());

			// Lets see what we got from API
			System.out.println(apiOutput); // <user id="10"><firstName>demo</firstName><lastName>user</lastName></user>

//			// In realtime programming, you will need to convert this http response to some
//			// java object to re-use it.
//			// Lets see how to jaxb unmarshal the api response content
//		        JAXBContext jaxbContext = JAXBContext.newInstance(OtpDTO.Response.class);
//		        Unmarshaller jaxbUnmarshaller = jaxbContext.createUnmarshaller();
//		        OtpDTO.Response responseDTO = (OtpDTO.Response) jaxbUnmarshaller.unmarshal(new StringReader(apiOutput));
//			BufferedReader rd = new BufferedReader(new InputStreamReader(response.getEntity().getContent()));
//
//			String line = "";
//			while ((line = rd.readLine()) != null) {
//				System.out.println(line);
//			}

			return responseDTO;

		} catch (ClientProtocolException e) {
			e.printStackTrace();
		} catch (UnsupportedOperationException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		OtpDTO otpDTO=new OtpDTO();
		otpDTO.setData("error occured while sending otp!!!");
		otpDTO.setStatus("0");
		return new OtpDTO();
	}
}
