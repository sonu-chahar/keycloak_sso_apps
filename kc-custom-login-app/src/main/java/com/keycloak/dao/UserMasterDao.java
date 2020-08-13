package com.keycloak.dao;

import java.util.List;

import com.keycloak.model.ApplicationMaster;
import com.keycloak.model.UserMaster;
import com.keycloak.model.UserStats;

public interface UserMasterDao extends GenericDao<UserMaster, Long> {

	public Long saveUser(UserMaster userMaster);

	public UserMaster findByUsername(String username);

	public List<ApplicationMaster> getApplicationListByUserId(Long userId);

	public List<ApplicationMaster> getApplicationList();

	public UserStats getStats();

	public void saveUserStats(UserStats userStats);

	public List<ApplicationMaster> getApplicationListByUserId(Long userId, Boolean isEmployee);

}