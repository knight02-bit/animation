package com.kn.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.kn.entity.Anim;
import com.kn.entity.AnimPage;
import com.kn.util.DBUtil;

public class AnimDao {
	
	public List<Anim> findAll() throws ClassNotFoundException{
		List<Anim> anims = new ArrayList<>();
		Connection conn = DBUtil.getConnection();
		String sql = "select * from animation order by aid asc";
		
		try{
			PreparedStatement prep = conn.prepareStatement(sql);
			ResultSet resultSet = prep.executeQuery();
			
			while(resultSet.next()){
				Anim anim = new Anim();
				anim.setAid(resultSet.getInt("aid"));
				anim.setAname(resultSet.getString("aname"));
				anim.setState(resultSet.getInt("state"));
				anim.setYear(resultSet.getInt("year"));
				anim.setCover(resultSet.getString("cover"));
				anim.setLink(resultSet.getString("link"));
				anim.setContent(resultSet.getString("content"));
				
				anims.add(anim);
			}
			
		}catch (SQLException e) {
			e.printStackTrace();
		}
		
		return anims;
	}
	
	public void add(Anim anim) throws ClassNotFoundException{
		Connection conn = DBUtil.getConnection();
		String sql = "insert into animation(aname, state, year, cover, link, content) values(?, ?, ?, ?, ?, ?)";
		
		try{
			PreparedStatement prep = conn.prepareStatement(sql);
			prep.setString(1, anim.getAname());
			prep.setInt(2, anim.getState());
			prep.setInt(3, anim.getYear());
			prep.setString(4, anim.getCover());
			prep.setString(5, anim.getLink());
			prep.setString(6, anim.getContent());
			
			prep.executeUpdate();
		}catch(Exception e){
			e.printStackTrace();
		}
	}
	
	public void delete(int aid) throws ClassNotFoundException{
		Connection conn = DBUtil.getConnection();
		String sql = "delete from animation where aid=?";

		try {
			PreparedStatement prep = conn.prepareStatement(sql);
			prep.setInt(1, aid);
			prep.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	public void update(Anim anim) throws ClassNotFoundException{
		Connection conn = DBUtil.getConnection();
		String sql = "update animation set aname=?, state=?, year=?, cover=?, link=?, content=? where aid=?";
		
		try {
			PreparedStatement prep = conn.prepareStatement(sql);
			prep.setString(1, anim.getAname());
			prep.setInt(2, anim.getState());
			prep.setInt(3, anim.getYear());
			prep.setString(4, anim.getCover());
			prep.setString(5, anim.getLink());
			prep.setString(6, anim.getContent());
			prep.setInt(7, anim.getAid());
			
			prep.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	public Anim findByAid(int aid) throws ClassNotFoundException{
		Connection conn = DBUtil.getConnection();
		Anim anim = null;
		String sql = "select * from animation where aid=?";
		
		try{
			PreparedStatement prep = conn.prepareStatement(sql);
			prep.setInt(1, aid);
			ResultSet resultSet = prep.executeQuery();
			while(resultSet.next()){
				anim = new Anim();
				anim.setAid(resultSet.getInt("aid"));
				anim.setAname(resultSet.getString("aname"));
				anim.setState(resultSet.getInt("state"));
				anim.setYear(resultSet.getInt("year"));
				anim.setCover(resultSet.getString("cover"));
				anim.setLink(resultSet.getString("link"));
				anim.setContent(resultSet.getString("content"));
			}
		}catch(Exception e){
			e.printStackTrace();
		}
		return anim;
	}
	
	public List<Anim> findByAname(String aname) throws ClassNotFoundException{
		List<Anim> anims = new ArrayList<>();
		Connection conn = DBUtil.getConnection();
		String sql = "select * from animation where aname like ?";
		
		try{
			PreparedStatement prep = conn.prepareStatement(sql);
			String pattern = "%" + aname + "%";
			prep.setString(1, pattern);
			ResultSet resultSet = prep.executeQuery();
			while(resultSet.next()){
				Anim anim = new Anim();
				anim.setAid(resultSet.getInt("aid"));
				anim.setAname(resultSet.getString("aname"));
				anim.setState(resultSet.getInt("state"));
				anim.setYear(resultSet.getInt("year"));
				anim.setCover(resultSet.getString("cover"));
				anim.setLink(resultSet.getString("link"));
				anim.setContent(resultSet.getString("content"));
				
				anims.add(anim);
			}
		}catch(Exception e){
			e.printStackTrace();
		}
		return anims;
	}
	
	public List<Anim> findByPage(AnimPage animPage) throws ClassNotFoundException{
		Connection conn = DBUtil.getConnection();
		List<Anim> anims = new ArrayList<Anim>();
		
		//无约束条件分页查询
		if(animPage.getAname() == null) {
			String sql = "select * from animation limit ?,?";
			try {
				PreparedStatement prep = conn.prepareStatement(sql);
				prep.setInt(1, animPage.getBegin());
				prep.setInt(2, animPage.getPageSize());
				ResultSet resultSet = prep.executeQuery();
				
				while(resultSet.next()){
					Anim anim = new Anim();
					anim.setAid(resultSet.getInt("aid"));
					anim.setAname(resultSet.getString("aname"));
					anim.setState(resultSet.getInt("state"));
					anim.setYear(resultSet.getInt("year"));
					anim.setCover(resultSet.getString("cover"));
					anim.setLink(resultSet.getString("link"));
					anim.setContent(resultSet.getString("content"));
					
					anims.add(anim);
				}
				
			} catch (SQLException e) {
				e.printStackTrace();
			}
			
		}
		//按照番名分页查询
		else {
			String sql = "select * from animation where aname like ? limit ?,?";
			try {
				PreparedStatement prep = conn.prepareStatement(sql);
				prep.setString(1, "%"+animPage.getAname()+"%");
				prep.setInt(2, animPage.getBegin());
				prep.setInt(3, animPage.getPageSize());
				ResultSet resultSet = prep.executeQuery();
				
				while(resultSet.next()){
					Anim anim = new Anim();
					anim.setAid(resultSet.getInt("aid"));
					anim.setAname(resultSet.getString("aname"));
					anim.setState(resultSet.getInt("state"));
					anim.setYear(resultSet.getInt("year"));
					anim.setCover(resultSet.getString("cover"));
					anim.setLink(resultSet.getString("link"));
					anim.setContent(resultSet.getString("content"));
					
					anims.add(anim);
				}
				
			} catch (SQLException e) {
				e.printStackTrace();
			}
			
		}
		
		return anims;
	}
	
	public int findRowNum(AnimPage animPage) throws ClassNotFoundException{
		Connection conn = DBUtil.getConnection();
		int cnt = 0;
		
		if(animPage.getAname() == null) {
			String sql = "select count(*) cnt from animation";
			
			try {
				PreparedStatement prep = conn.prepareStatement(sql);
				ResultSet resultSet = prep.executeQuery();
				
				if(resultSet.next()){
					cnt = resultSet.getInt("cnt");
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}else{
			String sql = "select count(*) cnt from animation where aname like ?";
			
			try {
				PreparedStatement prep = conn.prepareStatement(sql);
				prep.setString(1, "%"+animPage.getAname()+"%");
				ResultSet resultSet = prep.executeQuery();
				
				if(resultSet.next()){
					cnt = resultSet.getInt("cnt");
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		
		return cnt;
	}
	
	//查询追番人数
	public int countFavorNumByAid(int aid) throws ClassNotFoundException{
		Connection conn = DBUtil.getConnection();
		int cnt = 0;
		String sql = "select count(*) cnt from favoranim where aid=?";
		
		try {
			PreparedStatement prep = conn.prepareStatement(sql);
			prep.setInt(1, aid);
			ResultSet resultSet = prep.executeQuery();
			
			if(resultSet.next()){
				cnt = resultSet.getInt("cnt");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return cnt;
	}
}



