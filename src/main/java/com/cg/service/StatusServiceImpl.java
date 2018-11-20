package com.cg.service;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Service;

import com.cg.bean.Status;
import com.cg.dao.StatusDao;


@Service
@Component("service")
public class StatusServiceImpl implements StatusService{

	@Autowired
	StatusDao dao;
	
	public StatusDao getDao() {
		return dao;
	}

	public void setDao(StatusDao dao) {
		this.dao = dao;
	}

	@Override
	public Status addDetails(Status status) {
		// TODO Auto-generated method stub
		return dao.addDetails(status);
	}

	@Override
	public boolean isUsernameRegistered(String userName) {
		// TODO Auto-generated method stub
		return dao.isUsernameRegistered(userName);
	}

}