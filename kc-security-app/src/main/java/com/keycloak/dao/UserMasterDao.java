package com.keycloak.dao;

import java.util.List;

import com.keycloak.model.ApplicationMaster;
import com.keycloak.model.UserMaster;

public interface UserMasterDao extends GenericDao<UserMaster, Long> {

	public Long saveUser(UserMaster userMaster);

	public UserMaster findByUsername(String username);

	public List<ApplicationMaster> getApplicationListByUserId(Long userId);

	public List<ApplicationMaster> getApplicationList();
}