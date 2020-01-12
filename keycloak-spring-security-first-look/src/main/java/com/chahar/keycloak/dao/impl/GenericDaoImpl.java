package com.chahar.keycloak.dao.impl;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.Collection;
import java.util.LinkedHashSet;
import java.util.List;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.ObjectRetrievalFailureException;
import org.springframework.orm.hibernate5.support.HibernateDaoSupport;

import com.chahar.keycloak.dao.GenericDao;

/**
 * This class serves as the Base class for all other DAOs - namely to hold
 * common CRUD methods that they might all use. You should only need to extend
 * this class when your require custom CRUD logic.
 * 
 * <p>
 * To register this class in your Spring context file, use the following XML.
 * 
 * <pre>
 *      &lt;bean id=&quot;fooDao&quot; class=&quot;org.appfuse.dao.hibernate.GenericDaoImpl&quot;&gt;
 *          &lt;constructor-arg value=&quot;org.appfuse.model.Foo&quot;/&gt;
 *          &lt;property name=&quot;sessionFactory&quot; ref=&quot;sessionFactory&quot;/&gt;
 *      &lt;/bean&gt;
 * </pre>
 * 
 * @param <T>  a type variable
 * @param <PK> the primary key for that type
 */
public class GenericDaoImpl<T, PK extends Serializable> extends HibernateDaoSupport implements GenericDao<T, PK> {
	/**
	 * Log variable for all child classes. Uses LogFactory.getLog(getClass()) from
	 * Commons Logging
	 */
	protected final Log log = LogFactory.getLog(getClass());

	private Class<T> persistentClass;

	@Autowired
	private SessionFactory sessionFactory;

//	@Autowired
//	private EntityManagerFactory entityManagerFactory;

	@Autowired
	public void wireSessionFactory(SessionFactory sessionFactory) {
//		this.sessionFactory=entityManagerFactory.unwrap(SessionFactory.class);
//		setSessionFactory(this.sessionFactory);
		setSessionFactory(sessionFactory);
		// injecting sessionFactory manually for using GenericDaoImpl directly.
		this.sessionFactory = sessionFactory;
	}

	public Session getCurrentSession() {
		return sessionFactory.getCurrentSession();
	}

	/**
	 * Constructor that takes in a class to see which type of entity to persist
	 * 
	 * @param persistentClass the class type you'd like to persist
	 */
	public GenericDaoImpl(final Class<T> persistentClass) {

		this.persistentClass = persistentClass;
	}

	public Class<T> getPersistentClass() {
		return this.persistentClass;
	}

	/**
	 * {@inheritDoc}
	 */
	@SuppressWarnings("unchecked")
	public List<T> getAll() {
		return getCurrentSession().createCriteria(this.persistentClass)
				.add(Restrictions.or(Restrictions.eq("isDeleted", false), Restrictions.isNull("isDeleted"))).list();
	}

	/**
	 * {@inheritDoc}
	 */
	@SuppressWarnings("unchecked")
	public List<T> getAllNew() {
		return getCurrentSession().createCriteria(this.persistentClass).list();
	}

	/**
	 * {@inheritDoc}
	 */
//	@SuppressWarnings("unchecked")
	public List<T> getAllDistinct() {
		Collection<T> result = new LinkedHashSet<>(getAllNew());
		return new ArrayList<T>(result);
	}

	/**
	 * {@inheritDoc}
	 */

	public T get(PK id) {
		T entity = (T) getCurrentSession().get(this.persistentClass, id);

		if (entity == null)
			try {
				{
					log.warn("Uh oh, '" + this.persistentClass + "' object with id '" + id + "' not found...");

					throw new ObjectRetrievalFailureException(this.persistentClass, id);

				}
			} catch (ObjectRetrievalFailureException r) {
				return entity;
			}

		return entity;
	}

	/**
	 * {@inheritDoc}
	 */
	public boolean exists(PK id) {
		T entity = (T) getCurrentSession().get(this.persistentClass, id);
		return entity != null;
	}

	/**
	 * {@inheritDoc}
	 */
	@SuppressWarnings("unchecked")
	public T save(T object) {
		return (T) getCurrentSession().merge(object);
	}

	@Override
	public T saveOrupdate(T object) {
		getCurrentSession().saveOrUpdate(object);
		return object;
	}

	/**
	 * {@inheritDoc}
	 */
	public void remove(PK id) {
		getCurrentSession().delete(this.get(id));
	}

	/**
	 * {@inheritDoc}
	 * 
	 * @SuppressWarnings("unchecked") public List<T> findByNamedQuery(String
	 * queryName, Map<String, Object> queryParams) { String[] params = new
	 * String[queryParams.size()]; Object[] values = new Object[queryParams.size()];
	 * int index = 0; Iterator<String> i = queryParams.keySet().iterator(); while
	 * (i.hasNext()) { String key = i.next(); params[index] = key; values[index++] =
	 * queryParams.get(key); } return getCurrentSession ().getHibernateTemplate().
	 * findByNamedQueryAndNamedParam(queryName, params, values);
	 * } @SuppressWarnings("unchecked") public T findByColumnValue(String name,
	 * Serializable value) { Session session = getSession(); Criteria criteria =
	 * session.createCriteria (persistentClass).add (Restrictions.eq(name, value));
	 * T entity = (T) criteria.uniqueResult(); releaseSession(session); return
	 * entity; }
	 */
	/**
	 * 
	 */
	@SuppressWarnings("unchecked")
	public List<T> findValuesByColumn(String columnName, Serializable value) {
		Session session = getCurrentSession();
		Criteria criteria = session.createCriteria(persistentClass).add(Restrictions.eq(columnName, value));
		List<T> entity = (List<T>) criteria.list();
//		SessionFactoryUtils.closeSession(session);
		return entity;
	}

	/**
	 * 
	 */
	@SuppressWarnings("unchecked")
	public List<T> findValuesByColumns(String[] columns, Serializable[] value) {
		Session session = getCurrentSession();
		Criteria criteria = session.createCriteria(persistentClass);
		for (int i = 0; i < columns.length; i++) {
			criteria.add(Restrictions.eq(columns[i], value[i]));
		}
		List<T> entity = (List<T>) criteria.list();
//		SessionFactoryUtils.closeSession(session);
		return entity;
	}

	/*
	 * public List find(final String queryString, final Object[] values,final int
	 * maxResults, final int firstResult) throws DataAccessException { return (List)
	 * getHibernateTemplate().executeWithNativeSession(new HibernateCallback() {
	 * public Object doInHibernate(Session session) throws HibernateException {
	 * Query queryObject = session.createQuery(queryString);
	 * queryObject.setFirstResult(firstResult);
	 * queryObject.setMaxResults(maxResults); prepareQuery(queryObject); if (values
	 * != null) { for (int i = 0; i < values.length; i++) {
	 * queryObject.setParameter(i, values[i]); } } return queryObject.list(); } });
	 * }
	 */

	/*
	 * private void prepareQuery(Query queryObject) { if
	 * (getHibernateTemplate().isCacheQueries()) { queryObject.setCacheable(true);
	 * if (getHibernateTemplate().getQueryCacheRegion() != null) {
	 * queryObject.setCacheRegion(getHibernateTemplate().getQueryCacheRegion()); } }
	 * if (getHibernateTemplate().getFetchSize() > 0) {
	 * queryObject.setFetchSize(getHibernateTemplate().getFetchSize()); } if
	 * (getHibernateTemplate().getMaxResults() > 0) {
	 * queryObject.setMaxResults(getHibernateTemplate().getMaxResults()); }
	 * SessionFactoryUtils.applyTransactionTimeout(queryObject,
	 * getSessionFactory()); }
	 */

	public void flushSession() {
		getCurrentSession().flush();
	}
}
