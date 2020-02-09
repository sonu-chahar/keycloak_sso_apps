package com.keycloak.service;

import java.util.List;

import com.keycloak.model.ApplicationMaster;
import com.keycloak.model.UserMaster;

public interface UserMasterService extends GenericService<UserMaster, Long> {

	public Long saveUser(UserMaster user);

	public UserMaster findByUsername(String username);

	public List<ApplicationMaster> getApplicationListByUserId(Long userId);

	public List<ApplicationMaster> getApplicationList();

}