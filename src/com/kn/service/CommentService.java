package com.kn.service;

import java.util.List;

import com.kn.dao.CommentDao;
import com.kn.entity.Comment;

public class CommentService {
	private CommentDao dao = new CommentDao();
	
	public List<Comment> list() throws ClassNotFoundException{
		return dao.findAll();
	}
	
	public void add(Comment comment) throws ClassNotFoundException{
		dao.add(comment);
	}
	
	public void delete(Comment comment) throws ClassNotFoundException{
		dao.delete(comment);
	}
	
	public List<Comment> findLatestComment() throws ClassNotFoundException{
		return dao.findLatestComment();
	}
}
