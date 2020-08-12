package com.keycloak.service;

import java.util.List;

import com.keycloak.model.CustomUserSessionRepresentation;

public interface CustomUserSessionRepresentationService extends GenericService<CustomUserSessionRepresentation, Long> {
	public List<CustomUserSessionRepresentation> getLoginStats(String kcUserId);
}