package com.keycloak.dao.impl;

import java.util.List;

import org.hibernate.criterion.Restrictions;
import org.springframework.stereotype.Repository;

import com.keycloak.dao.CustomUserSessionRepresentationDao;
import com.keycloak.model.CustomUserSessionRepresentation;

@Repository("customUserSessionRepresentationDao")
public class CustomUserSessionRepresentationDaoImpl extends GenericDaoImpl<CustomUserSessionRepresentation, Long>
		implements CustomUserSessionRepresentationDao {

	public CustomUserSessionRepresentationDaoImpl() {
		super(CustomUserSessionRepresentation.class);
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<CustomUserSessionRepresentation> getLoginStats(String kcUserId) {
		return getCurrentSession().createCriteria(CustomUserSessionRepresentation.class)
				.add(Restrictions.eq("userId", kcUserId)).list();
	}
}
