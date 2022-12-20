package com.kn.service;

import java.util.List;

import com.kn.dao.UserDao;
import com.kn.entity.Anim;
import com.kn.entity.User;

public class UserService {
	private UserDao dao =  new UserDao();
	
	public User login(String email) throws ClassNotFoundException{
		return dao.findByEmail(email);
	}
	
	public User findByUid(int uid) throws ClassNotFoundException{
		return dao.findByUid(uid);
	}
	
	public List<Anim> findFavorListByUid(int uid) throws ClassNotFoundException{
		return dao.findFavorListByUid(uid);
	}
	
	public void deleteFavorAnim(int uid, int aid) throws ClassNotFoundException{
		dao.deleteFavorAnim(uid, aid);
	}
}
