package com.keycloak.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.keycloak.model.UserMaster;
import com.keycloak.model.UserMasterVO;
import com.keycloak.service.UserMasterService;

@RestController
public class KCRestController extends AbstractPageController {
	@Autowired
	UserMasterService userMasterService;

//	http://127.0.0.1:8080/kc-security-app/fetchUserDetails/ndmc/ea5218cd-e111-425c-8b3f-b7ddde2d2a34
	@RequestMapping(method = RequestMethod.GET, value = "/fetchUserDetail/{username}/{kcUserId}")
	public UserMasterVO fetchUser(@PathVariable("username") String username,
			@PathVariable("kcUserId") String kcUserId) {
		String columns[] = new String[] { "username", "kcUserId" };
		String values[] = new String[] { username, kcUserId };
		List<UserMaster> userMasterList = userMasterService.findValuesByColumns(columns, values);
		if (userMasterList.size() == 1) {
			UserMasterVO userMasterVO = new UserMasterVO();
			BeanUtils.copyProperties(userMasterList.get(0), userMasterVO);
			return userMasterVO;
		}
		return null;
	}

	@RequestMapping(method = RequestMethod.GET, value = "/fetchUserDetails/{username}/{kcUserId}")
	public Object fetchUserJSonp(@PathVariable("username") String username, @PathVariable("kcUserId") String kcUserId,
			HttpServletResponse response, HttpServletRequest request) {
		request.getSession(false).invalidate();
		response.addHeader("Content-Type", "application/x-javascript");

		String columns[] = new String[] { "username", "kcUserId" };
		String values[] = new String[] { username, kcUserId };
		List<UserMaster> userMasterList = userMasterService.findValuesByColumns(columns, values);
		if (userMasterList.size() == 0) {
			UserMaster userMaster = getUserMasterFromSession(request);
			UserMasterVO userMasterVO = new UserMasterVO();
			BeanUtils.copyProperties(userMaster, userMasterVO);
			return convertToJsonP(userMasterVO);
		} else {
			UserMasterVO userMasterVO = new UserMasterVO();
			BeanUtils.copyProperties(userMasterList.get(0), userMasterVO);
			return convertToJsonP(userMasterVO);
		}
	}

//	http://127.0.0.1:8080/kc-security-app/fetchUserDetails/ndmc/ea5218cd-e111-425c-8b3f-b7ddde2d2a34
//	@CrossOrigin(origins = "http://127.0.0.1:8083")
	@RequestMapping(value = "/fetchUserDetails", produces = { "application/x-javascript" })
	public Object fetchUserJSonp(@RequestBody UserMasterVO userMasterVO) {
//		response.setHeader("Access-Control-Allow-Origin", "http://127.0.0.1:8083");
//		response.setHeader("Access-Control-Allow-Methods", "GET,PUT,POST,DELETE,OPTIONS");
//		response.setHeader("Access-Control-Allow-Headers",
//				"Access-Control-Allow-Origin,Content-Type,Content-Range,Content-Disposition,Content-Description");

		String columns[] = new String[] { "username", "kcUserId" };
		String values[] = new String[] { userMasterVO.getUsername(), userMasterVO.getKcUserId() };
		List<UserMaster> userMasterList = userMasterService.findValuesByColumns(columns, values);
		if (userMasterList.size() == 1) {
			UserMasterVO persistedUserMasterVO = new UserMasterVO();
			BeanUtils.copyProperties(userMasterList.get(0), persistedUserMasterVO);
			return convertToJsonP(persistedUserMasterVO);
		}
		return "userDetails()";
	}

	private String convertToJsonP(Object o) {
		String outputmessage = null;
		ObjectMapper mapper = new ObjectMapper();
		try {
			outputmessage = mapper.writeValueAsString(o);
		} catch (Exception e) {
			e.printStackTrace();
		}
		if (outputmessage != null) {
			outputmessage = "userDetails(" + outputmessage + ")";
		}
		return outputmessage;
	}

}
