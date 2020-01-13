package com.chahar.keycloak.dao;

import java.io.Serializable;
import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component
@org.springframework.transaction.annotation.Transactional
public class GenDaoClass<T> implements GenDao<T> {

	@Autowired
	private SessionFactory sessionFactory;

//	@Autowired
//	private EntityManagerFactory entityManagerFactory;

	public Session getCurrentSession() {
		return sessionFactory.getCurrentSession();
	}

	/**
	 * {@inheritDoc}
	 */
	@SuppressWarnings("unchecked")
	public List<T> getAllNew(Class<T> type) {
		return getCurrentSession().createCriteria(type).list();
	}

	public boolean exists(Integer id) {
		// TODO Auto-generated method stub
		return false;
	}

	public T save(T object) {
		// TODO Auto-generated method stub
		return null;
	}

	public void remove(Integer id) {
		// TODO Auto-generated method stub

	}

	public List<T> getAllDistinct() {
		// TODO Auto-generated method stub
		return null;
	}

	@SuppressWarnings("unchecked")
	public List<T> findValuesByColumn(String columnName, Serializable value, Class<T> type) {
		// TODO Auto-generated method stub
		return getCurrentSession().createCriteria(type).add(Restrictions.eq(columnName, value)).list();
	}

	@SuppressWarnings("unchecked")
	public List<T> findValuesByColumns(String[] columns, Serializable[] value, Class<T> type) {
		Session session = getCurrentSession();
		Criteria criteria = session.createCriteria(type);
		for (int i = 0; i < columns.length; i++) {
			criteria.add(Restrictions.eq(columns[i], value[i]));
		}
		List<T> entity = (List<T>) criteria.list();
//		SessionFactoryUtils.closeSession(session);
		return entity;
	}

	public void flushSession() {
		// TODO Auto-generated method stub

	}

	public T saveOrupdate(T object) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Class<T> getPersistentClass() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<T> getAll() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public T get(Integer id) {
		// TODO Auto-generated method stub
		return null;
	}

}
