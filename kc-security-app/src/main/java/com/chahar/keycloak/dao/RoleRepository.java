package com.chahar.keycloak.dao;

import org.springframework.data.jpa.repository.JpaRepository;

import com.chahar.keycloak.model.RoleMaster;

public interface RoleRepository extends JpaRepository<RoleMaster, Long> {
}
