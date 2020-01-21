package com.keycloak.dao.impl;

import java.util.List;

import org.hibernate.criterion.Restrictions;
import org.springframework.stereotype.Repository;

import com.keycloak.dao.UserMasterDao;
import com.keycloak.model.UserMaster;

@Repository("userMasterDao")
public class UserMasterDaoImpl extends GenericDaoImpl<UserMaster, Long> implements UserMasterDao {

	public UserMasterDaoImpl() {
		super(UserMaster.class);
	}

	@Override
	public Long saveUser(UserMaster userMaster) {
		return (Long) getCurrentSession().save(userMaster);
	}

	@SuppressWarnings("unchecked")
	@Override
	public UserMaster findByUsername(String username) {
		List<UserMaster> userMasterList = getCurrentSession().createCriteria(UserMaster.class)
				.add(Restrictions.eq("username", username)).list();
		if (userMasterList != null && userMasterList.size() > 0) {
			return userMasterList.get(0);
		} else {
			return null;
		}
	}
}
