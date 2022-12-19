package com.kn.service;

import java.util.List;

import com.kn.dao.CommentDao;
import com.kn.entity.Comment;

public class CommentService {
	private CommentDao dao = new CommentDao();
	
	public List<Comment> list() throws ClassNotFoundException{
		return dao.findAll();
	}
}