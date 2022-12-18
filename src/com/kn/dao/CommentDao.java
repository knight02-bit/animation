package com.kn.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.kn.entity.Comment;
import com.kn.util.DBUtil;

public class CommentDao {
	
	public List<Comment> findAll() throws ClassNotFoundException{
		Connection conn = DBUtil.getConnection();
		List<Comment> comments = new ArrayList<>();
		String sql = "select comment.uid, uname, avatar, time, content from user,comment where user.uid=comment.uid order by time asc";
		
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
