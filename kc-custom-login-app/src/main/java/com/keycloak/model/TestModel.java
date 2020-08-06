package com.keycloak.model;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import org.directwebremoting.annotations.DataTransferObject;
import org.directwebremoting.annotations.Param;
import org.directwebremoting.hibernate.H4BeanConverter;

@Entity
@Table(name = "kcbase_testModel")
@DataTransferObject(type = "hibernate4", converter = H4BeanConverter.class, params = @Param(name = "assumeSession", value = "true"))
public class TestModel extends BaseEntity implements Serializable {

	private static final long serialVersionUID = -840111016143580899L;

	private Integer id;

	private String name;

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "pk_testId")
	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	@Column(name = "name")
	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

}
