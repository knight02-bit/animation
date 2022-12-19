package com.kn.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

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
//				System.out.println(user);
				
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
			return user;
		}
}
