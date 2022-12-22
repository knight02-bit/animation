package com.kn.service;

import java.sql.SQLException;
import java.util.List;

import com.kn.dao.AnimDao;
import com.kn.entity.Anim;
import com.kn.entity.AnimPage;

public class AnimService {
	private AnimDao dao = new AnimDao();
	
	public List<Anim> findAll() throws ClassNotFoundException, SQLException{
		return dao.findAll();
	}
	
	public void add(Anim anim) throws ClassNotFoundException {
		dao.add(anim);
	}
	
	public void deleteByAid(int aid) throws ClassNotFoundException {
		dao.deleteByAid(aid);
	}
	
	public void update(Anim anim) throws ClassNotFoundException{
		dao.update(anim);
	}
	
	public Anim findByAid(int aid) throws ClassNotFoundException {
		Anim anim = dao.findByAid(aid);
		return anim;
	}
	
	public List<Anim> findByPage(AnimPage animPage) throws ClassNotFoundException{
		return dao.findByPage(animPage);
	} 
	
	public int findRowNum(AnimPage animPage) throws ClassNotFoundException{
		return dao.findRowNum(animPage);
	}
	
	public int countFavorNumByAid(int aid) throws ClassNotFoundException{
		return dao.countFavorNumByAid(aid);
	}
}
