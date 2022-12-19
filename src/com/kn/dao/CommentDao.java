package com.kn.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.kn.entity.Comment;
import com.kn.util.DBUtil;

import sun.launcher.resources.launcher;

public class CommentDao {
	
	public List<Comment> findAll() throws ClassNotFoundException{
		Connection conn = DBUtil.getConnection();
		List<Comment> comments = new ArrayList<>();
		String sql = "select comment.uid, uname, avatar, time, content from user,comment where user.uid=comment.uid order by time desc";
		
		try{
			PreparedStatement prep = conn.prepareStatement(sql);
			ResultSet resultSet = prep.executeQuery();
			
			while(resultSet.next()){
				Comment comment = new Comment();
				comment.setUid(resultSet.getInt("uid"));
				comment.setUname(resultSet.getString("uname"));
				comment.setAvatar(resultSet.getString("avatar"));
				comment.setTime(resultSet.getString("time"));
				comment.setContent(resultSet.getString("content"));
				
				comments.add(comment);
			}
			
		}catch (SQLException e) {
			e.printStackTrace();
		}
		
		return comments;
	}
	
	public void add(Comment comment) throws ClassNotFoundException{
		Connection conn = DBUtil.getConnection();
		String sql = "insert into comment(uid, time, content) values(?,?,?)";
		
		try {
			PreparedStatement prep = conn.prepareStatement(sql);
			prep.setInt(1, comment.getUid());
			prep.setString(2, comment.getTime());
			prep.setString(3, comment.getContent());
			
			prep.execute();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	public List<Comment> findLatestComment() throws ClassNotFoundException{
		Connection conn = DBUtil.getConnection();
		List<Comment> comments = new ArrayList<>();
		
		String sql = "select comment.uid, uname, avatar, time, content from user,comment where user.uid=comment.uid order by time desc limit 0,3";
		try{
			PreparedStatement prep = conn.prepareStatement(sql);
			ResultSet resultSet = prep.executeQuery();
			
			while(resultSet.next()){
				Comment comment = new Comment();
				comment.setUid(resultSet.getInt("uid"));
				comment.setUname(resultSet.getString("uname"));
				comment.setAvatar(resultSet.getString("avatar"));
				comment.setTime(resultSet.getString("time"));
				comment.setContent(resultSet.getString("content"));
				
				comments.add(comment);
			}
			
		}catch (SQLException e) {
			e.printStackTrace();
		}
		
		return comments;
	}
}
