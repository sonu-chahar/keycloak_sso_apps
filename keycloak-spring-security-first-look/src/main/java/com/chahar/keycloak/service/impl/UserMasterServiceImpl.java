package com.chahar.keycloak.service.impl;

import java.util.HashSet;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import com.chahar.keycloak.dao.GenDao;
import com.chahar.keycloak.dao.UserMasterDao;
import com.chahar.keycloak.model.RoleMaster;
import com.chahar.keycloak.model.UserMaster;
import com.chahar.keycloak.service.UserMasterService;

@Service("userMasterService")
@Transactional
public class UserMasterServiceImpl extends GenericServiceImpl<UserMaster, Long> implements UserMasterService {

//	@Autowired
//	private RoleRepository roleRepository;

	@Autowired
	protected GenDao<RoleMaster> genericRoleDao;
	@Autowired
	private BCryptPasswordEncoder bCryptPasswordEncoder;

	private UserMasterDao userMasterDao;

	@Autowired
	public UserMasterServiceImpl(@Qualifier("userMasterDao") UserMasterDao userMasterDao) {
		super(userMasterDao);
		this.userMasterDao = userMasterDao;

	}

	@Override
	public UserMaster findByUsername(String username) {
		return userMasterDao.findByUsername(username);
	}

	//dont use below method
	@Override
	public Long saveUser(UserMaster userMaster) {
		userMaster.setPassword(bCryptPasswordEncoder.encode(userMaster.getPassword()));
		userMaster.setRoles(new HashSet<>(genericRoleDao.getAllNew(RoleMaster.class)));
		return userMasterDao.saveUser(userMaster);
	}
}
