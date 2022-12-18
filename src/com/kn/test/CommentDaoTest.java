package com.kn.test;

import java.util.List;

import com.kn.dao.CommentDao;
import com.kn.entity.Comment;

public class CommentDaoTest {

	public static void main(String[] args) throws ClassNotFoundException {
		CommentDao dao = new CommentDao();
		
		List<Comment> comments = dao.findAll();
		for(Comment comment : comments){
			System.out.println(comment);
		}
	}

}
