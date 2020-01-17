package com.chahar.keycloak.controller;

import java.util.List;

import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.chahar.keycloak.model.UserMaster;
import com.chahar.keycloak.model.UserMasterVO;
import com.chahar.keycloak.service.UserMasterService;

@RestController
public class KCRestController extends AbstractPageController {
	@Autowired
	UserMasterService userMasterService;

	@RequestMapping(value = "/fetchUserDetails/{username}/{kcUserId}")
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

}
