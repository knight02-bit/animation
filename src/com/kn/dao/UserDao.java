package com.kn.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.kn.entity.Anim;
import com.kn.entity.User;
import com.kn.util.DBUtil;

public class UserDao {
		//根据用户名查询用户信息
		public User findByEmail(String email) throws ClassNotFoundException{
			Connection con = DBUtil.getConnection();
			User user = null;

			String sql = "select * from user where email=?";
			
			try {
				PreparedStatement prep = con.prepareStatement(sql);
				prep.setString(1, email);

				ResultSet resultSet = prep.executeQuery();
				while(resultSet.next()){
					user = new User();
					user.setUid(resultSet.getInt("uid"));
					user.setEmail(resultSet.getString("email"));
					user.setPwd(resultSet.getString("pwd"));
					user.setUname(resultSet.getString("uname"));
					user.setLevel(resultSet.getInt("level"));
					user.setAvatar(resultSet.getString("avatar"));
					user.setIntro(resultSet.getString("intro"));
					
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
			return user;
		}
		
		//根据uid查询个人资料
		public User findByUid(int uid) throws ClassNotFoundException{
			Connection con = DBUtil.getConnection();
			User user = null;

			String sql = "select * from user where uid=?";
			
			try {
				PreparedStatement prep = con.prepareStatement(sql);
				prep.setInt(1, uid);

				ResultSet resultSet = prep.executeQuery();
				while(resultSet.next()){
					user = new User();
					user.setUid(resultSet.getInt("uid"));
					user.setEmail(resultSet.getString("email"));
					user.setPwd(resultSet.getString("pwd"));
					user.setUname(resultSet.getString("uname"));
					user.setLevel(resultSet.getInt("level"));
					user.setAvatar(resultSet.getString("avatar"));
					user.setIntro(resultSet.getString("intro"));
					
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
			return user;
		}
		
		public List<Anim> findFavorListByUid(int uid) throws ClassNotFoundException{
			List<Anim> favorAnims = new ArrayList<Anim>();
			Connection conn = DBUtil.getConnection();
			String sql = "select animation.aid,aname,state,year,cover,link,content from favorAnim, animation "
					+ "where favorAnim.uid=? and favorAnim.aid=animation.aid";
			
			try{
				PreparedStatement prep = conn.prepareStatement(sql);
				prep.setInt(1, uid);
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
					
					favorAnims.add(anim);
				}
				
			}catch (SQLException e) {
				e.printStackTrace();
			}
			
			return favorAnims;
		}
		
		public void deleteFavorAnim(int uid, int aid) throws ClassNotFoundException{
			Connection conn = DBUtil.getConnection();
			String sql = "delete from favoranim where uid=? and aid=?";
			
			try {
				PreparedStatement prep = conn.prepareStatement(sql);
				prep.setInt(1, uid);
				prep.setInt(2, aid);
				
				prep.executeUpdate();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		
		public void addFavorAnim(int uid, int aid) throws ClassNotFoundException{
			Connection conn = DBUtil.getConnection();
			String sql = "insert into favoranim values(?,?);";
			
			try {
				PreparedStatement prep = conn.prepareStatement(sql);
				prep.setInt(1, uid);
				prep.setInt(2, aid);
				
				prep.executeUpdate();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		
		public boolean isFavor(int uid, int aid) throws ClassNotFoundException{
			Connection conn = DBUtil.getConnection();
			String sql = "select * from favorAnim where uid=? and aid=?";
			boolean res = false;
			try {
				PreparedStatement prep = conn.prepareStatement(sql);
				prep.setInt(1, uid);
				prep.setInt(2, aid);
				ResultSet resultSet = prep.executeQuery();
				
				if(resultSet.next()){
					res = true;
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
			return res;
		}
}
