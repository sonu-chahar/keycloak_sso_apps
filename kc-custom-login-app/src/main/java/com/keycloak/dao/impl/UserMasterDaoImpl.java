package com.keycloak.dao.impl;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.criterion.Projections;
import org.hibernate.criterion.Restrictions;
import org.springframework.stereotype.Repository;

import com.keycloak.dao.UserMasterDao;
import com.keycloak.model.ApplicationMaster;
import com.keycloak.model.UserApplicationMapping;
import com.keycloak.model.UserMaster;
import com.keycloak.model.UserStats;

@Repository("userMasterDao")
public class UserMasterDaoImpl extends GenericDaoImpl<UserMaster, Long> implements UserMasterDao {

	public UserMasterDaoImpl() {
		super(UserMaster.class);
	}

	@Override
	public Long saveUser(UserMaster userMaster) {
		return (Long) getCurrentSession().save(userMaster);
	}

	@SuppressWarnings("unchecked")
	@Override
	public UserMaster findByUsername(String username) {
		List<UserMaster> userMasterList = getCurrentSession().createCriteria(UserMaster.class)
				.add(Restrictions.eq("username", username)).list();
		if (userMasterList != null && userMasterList.size() > 0) {
			return userMasterList.get(0);
		} else {
			return null;
		}
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<ApplicationMaster> getApplicationListByUserId(Long userId) {

		List<Integer> applicationIds = getCurrentSession().createCriteria(UserApplicationMapping.class)
				.add(Restrictions.eq("userMasterId", userId))
				.setProjection(
						Projections.projectionList().add(Projections.property("applicationId").as("applicationId")))
				.list();
		if (applicationIds.size() > 0) {
			return getCurrentSession().createCriteria(ApplicationMaster.class)
					.add(Restrictions.in("id", applicationIds)).list();
		}
		return null;

	}

	@SuppressWarnings("unchecked")
	@Override
	public List<ApplicationMaster> getApplicationList() {
		return getCurrentSession().createCriteria(ApplicationMaster.class).list();
	}

	@Override
	public UserStats getStats() {
		@SuppressWarnings("unchecked")
		List<UserStats> list = getCurrentSession().createCriteria(UserStats.class).list();
		String intialCounter = "0";
		if (!list.isEmpty()) {
			return list.get(0);
		} else {
			return new UserStats(intialCounter, intialCounter, intialCounter, intialCounter);
		}
	}

	@Override
	public void saveUserStats(UserStats userStats) {
		getCurrentSession().merge(userStats);
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<ApplicationMaster> getApplicationListByUserId(Long userId, Boolean isEmployee) {

		List<Integer> applicationIds = getCurrentSession().createCriteria(UserApplicationMapping.class)
				.add(Restrictions.eq("userMasterId", userId))
				.setProjection(
						Projections.projectionList().add(Projections.property("applicationId").as("applicationId")))
				.list();
		if (!applicationIds.isEmpty()) {
			Criteria criteria = getCurrentSession().createCriteria(ApplicationMaster.class)
					.add(Restrictions.in("id", applicationIds));
			if (isEmployee != null) {
				criteria.add(Restrictions.eq("isNdmcEmployee", isEmployee));
			}
			return criteria.list();
		}
		return null;
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<ApplicationMaster> getApplicationList(Boolean isEmployee) {
		return getCurrentSession().createCriteria(ApplicationMaster.class)
				.add(Restrictions.eq("isNdmcEmployee", isEmployee)).list();
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<UserMaster> getUserListByMobileNumber(String mobileNumber) {
		return getCurrentSession().createCriteria(UserMaster.class).add(Restrictions.eq("mobileNumber", mobileNumber))
				.list();
	}

}
