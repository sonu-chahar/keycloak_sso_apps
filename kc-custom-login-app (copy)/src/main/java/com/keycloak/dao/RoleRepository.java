package com.keycloak.dao;

import org.springframework.data.jpa.repository.JpaRepository;

import com.keycloak.model.RoleMaster;

public interface RoleRepository extends JpaRepository<RoleMaster, Long> {
}
