package com.kn.test;

import java.util.List;

import com.kn.dao.UserDao;
import com.kn.entity.Anim;

public class UserDaoTest {

	public static void main(String[] args) throws ClassNotFoundException {
		UserDao dao = new UserDao();

//		List<Anim> favorAnims = dao.findFavorListByUid(7);
//		
//		for(Anim anim : favorAnims){
//			System.out.println(anim);
//		}
		
		dao.addFavorAnim(4, 10);
	}

}
