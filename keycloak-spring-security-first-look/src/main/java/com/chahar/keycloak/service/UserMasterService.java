package com.chahar.keycloak.service;

import com.chahar.keycloak.model.UserMaster;

public interface UserMasterService extends GenericService<UserMaster, Long> {
	
	public Long saveUser(UserMaster user);

	public UserMaster findByUsername(String username);
}