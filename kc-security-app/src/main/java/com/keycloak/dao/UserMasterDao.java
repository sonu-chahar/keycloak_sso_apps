package com.keycloak.dao;

import com.keycloak.model.UserMaster;

public interface UserMasterDao extends GenericDao<UserMaster, Long> {

	public Long saveUser(UserMaster userMaster);

	public UserMaster findByUsername(String username);

}