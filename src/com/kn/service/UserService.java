package com.kn.service;

import com.kn.dao.UserDao;
import com.kn.entity.User;

public class UserService {
	private UserDao dao =  new UserDao();
	
	public User login(String email) throws ClassNotFoundException{
		return dao.findByEmail(email);
	}
}
