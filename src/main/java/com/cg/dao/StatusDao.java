package com.cg.dao;

import com.cg.bean.Status;

public interface StatusDao {

	public Status addDetails(Status status);
	public boolean isUsernameRegistered(String userName);
}
