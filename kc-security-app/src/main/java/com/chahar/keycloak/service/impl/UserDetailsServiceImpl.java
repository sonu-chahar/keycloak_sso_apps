package com.chahar.keycloak.service.impl;

import java.util.HashSet;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.chahar.keycloak.model.UserMaster;
import com.chahar.keycloak.service.UserMasterService;

@Service("jdbcUserDetailsService")
public class UserDetailsServiceImpl  implements UserDetailsService  {
	@Autowired
	private UserMasterService userRepository;

//	@Override
	@Transactional
	public UserDetails loadUserByUsername(String username) {
		UserMaster userMaster = userRepository.findByUsername(username);
		if (userMaster == null)
			throw new UsernameNotFoundException(username);

		Set<GrantedAuthority> grantedAuthorities = new HashSet<>();
		grantedAuthorities.add(new SimpleGrantedAuthority("ROLE_" + "ADMIN"));

		/*
		 * for (RoleMaster role : userMaster.getRoles()) { }
		 */
		return new User(userMaster.getUsername(), userMaster.getPassword(), grantedAuthorities);
	}
}
