package com.keycloak.service;

import java.io.Serializable;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.keycloak.dao.GenDao;

@Service("genService")
@org.springframework.transaction.annotation.Transactional
public class GenServices<T> implements GenServicein<T> {

	@Autowired
	protected GenDao<T> genericDao;

	@Override
	public List<T> getAllNew(Class<T> type) {
		// TODO Auto-generated method stub
		return genericDao.getAllNew(type);
	}

	@Override
	public List<T> getAllDistinct() {
		// TODO Auto-generated method stub
		return genericDao.getAllDistinct();
	}

	@Override
	public T get(Integer id) {
		// TODO Auto-generated method stub
		return genericDao.get(id);
	}

	@Override
	public T get(Class<T> clazz, Integer id) {
		// TODO Auto-generated method stub
		return genericDao.get(id);
	}

	@Override
	public boolean exists(Integer id) {
		// TODO Auto-generated method stub
		return genericDao.exists(id);
	}

	@Override
	public T save(T object) {
		// TODO Auto-generated method stub
		return genericDao.save(object);
	}

	@Override
	public void remove(Integer id) {
		// TODO Auto-generated method stub

	}

	@Override
	public List<T> findValuesByColumn(String columnName, Serializable value, Class<T> type) {
		// TODO Auto-generated method stub
		return genericDao.findValuesByColumn(columnName, value, type);
	}

	@Override
	public List<T> findValuesByColumns(String[] columns, Serializable[] value, Class<T> type) {
		// TODO Auto-generated method stub
		return genericDao.findValuesByColumns(columns, value, type);
	}

	@Override
	public void persist(Object o) {
		// TODO Auto-generated method stub

	}

	@Override
	public void flushSession() {
		// TODO Auto-generated method stub

	}

	@Override
	public List<T> getAll() {
		// TODO Auto-generated method stub
		return null;
	}

}
