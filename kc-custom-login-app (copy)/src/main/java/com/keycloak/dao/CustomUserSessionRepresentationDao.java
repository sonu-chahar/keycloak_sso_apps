package com.keycloak.dao;

import java.util.List;

import com.keycloak.model.CustomUserSessionRepresentation;

public interface CustomUserSessionRepresentationDao extends GenericDao<CustomUserSessionRepresentation, Long> {
	public List<CustomUserSessionRepresentation> getLoginStats(String kcUserId);
}