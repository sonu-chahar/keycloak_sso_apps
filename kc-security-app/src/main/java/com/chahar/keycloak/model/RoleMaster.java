package com.chahar.keycloak.model;

import java.io.Serializable;
import java.util.Set;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToMany;
import javax.persistence.Table;

import org.directwebremoting.annotations.DataTransferObject;
import org.directwebremoting.annotations.Param;
import org.directwebremoting.hibernate.H4BeanConverter;

/*
@Entity
@Table(name = "kcbase_roleMaster")
@DataTransferObject(type = "hibernate4", converter = H4BeanConverter.class, params = @Param(name = "assumeSession", value = "true"))
*/public class RoleMaster implements Serializable {
	/*
	 * private static final long serialVersionUID = 9003748736670020659L;
	 * 
	 * private Long id; private String name; private Set<UserMaster> users;
	 * 
	 * @Id
	 * 
	 * @GeneratedValue(strategy = GenerationType.IDENTITY)
	 * 
	 * @Column(name = "pk_roleMaster") public Long getId() { return id; }
	 * 
	 * public void setId(Long id) { this.id = id; }
	 * 
	 * @Column(name = "name") public String getName() { return name; }
	 * 
	 * public void setName(String name) { this.name = name; }
	 * 
	 * @ManyToMany(mappedBy = "roles") public Set<UserMaster> getUsers() { return
	 * users; }
	 * 
	 * public void setUsers(Set<UserMaster> users) { this.users = users; }
	 */
}
