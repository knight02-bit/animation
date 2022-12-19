package com.kn.test;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.List;

import com.kn.dao.CommentDao;
import com.kn.entity.Comment;

public class CommentDaoTest {

	public static void main(String[] args) throws ClassNotFoundException {
//		CommentDao dao = new CommentDao();
		
//		List<Comment> comments = dao.findAll();
//		for(Comment comment : comments){
//			System.out.println(comment);
//		}
		
		//获取时间
		Calendar calendar= Calendar.getInstance();
		SimpleDateFormat dateFormat= new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
		String s = dateFormat.format(calendar.getTime()).toString();
		System.out.println(s);
	}

}
