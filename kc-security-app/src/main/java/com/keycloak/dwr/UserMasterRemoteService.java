package com.keycloak.dwr;

import java.util.List;

import org.directwebremoting.annotations.RemoteMethod;
import org.directwebremoting.annotations.RemoteProxy;
import org.springframework.beans.factory.annotation.Autowired;

import com.keycloak.model.ApplicationMaster;
import com.keycloak.service.UserMasterService;

@RemoteProxy(name = "userMasterRemoteService")
public class UserMasterRemoteService {
	
	@Autowired
	UserMasterService userMasterService;

	@RemoteMethod
	public List<ApplicationMaster> getApplicationListByUserId(Long userId) {
		return userMasterService.getApplicationListByUserId(userId);
	}

}
