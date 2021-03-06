package com.keycloak.service.impl;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.keycloak.dao.CustomUserSessionRepresentationDao;
import com.keycloak.model.CustomUserSessionRepresentation;
import com.keycloak.service.CustomUserSessionRepresentationService;

@Service("customUserSessionRepresentationService")
@Transactional
public class CustomUserSessionRepresentationServiceImpl extends
		GenericServiceImpl<CustomUserSessionRepresentation, Long> implements CustomUserSessionRepresentationService {

	private CustomUserSessionRepresentationDao customUserSessionRepresentationDao;

	@Autowired
	public CustomUserSessionRepresentationServiceImpl(
			@Qualifier("customUserSessionRepresentationDao") CustomUserSessionRepresentationDao customUserSessionRepresentationDao) {
		super(customUserSessionRepresentationDao);
		this.customUserSessionRepresentationDao = customUserSessionRepresentationDao;
	}

	@Override
	public List<CustomUserSessionRepresentation> getLoginStats(String kcUserId) {
		return customUserSessionRepresentationDao.getLoginStats(kcUserId);
	}
}
