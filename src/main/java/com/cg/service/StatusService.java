package com.cg.service;

import com.cg.bean.Status;

public interface StatusService {
	public Status addDetails(Status status);
	 public boolean isUsernameRegistered(String username);
}
