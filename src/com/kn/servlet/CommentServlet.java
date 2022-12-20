package com.kn.servlet;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.kn.entity.Comment;
import com.kn.entity.User;
import com.kn.service.CommentService;

public class CommentServlet extends HttpServlet {

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		HttpSession session = request.getSession();
		
		Object obj = session.getAttribute("u");
		if(obj == null){
			//跳转回登录页面 
			response.sendRedirect("login.jsp");
			return;
		}
		
		String uri = request.getRequestURI();
		String path = uri.substring(uri.lastIndexOf("/"),uri.lastIndexOf("."));
		
		CommentService service = new CommentService();
		if(path.equals("/list")){
			List<Comment> comments = null;
			
			try {
				comments = service.list();
				
				request.setAttribute("comments", comments);
				RequestDispatcher dispatcher = request.getRequestDispatcher("bbs.jsp");
				dispatcher.forward(request, response);
			} catch (ClassNotFoundException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		else if(path.equals("/add")){
			User user = (User)session.getAttribute("u");
			int uid = user.getUid();
			
			//获取时间
			Calendar calendar= Calendar.getInstance();
			SimpleDateFormat dateFormat= new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			String time = dateFormat.format(calendar.getTime()).toString();
			String message = (String)request.getParameter("message");
			
			Comment comment = new Comment();
			comment.setUid(uid);
			comment.setTime(time);
			comment.setContent(message);
			try {
				service.add(comment);
			} catch (ClassNotFoundException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
			response.sendRedirect("list.chat");
		}
		else if(path.equals("/del")){
			int uid = Integer.parseInt(request.getParameter("uid"));
			String time = (String)request.getParameter("time");
			Comment comment = new Comment();
			comment.setUid(uid);
			comment.setTime(time);
			
			try {
				service.delete(comment);
			} catch (ClassNotFoundException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
					
			response.sendRedirect("list.chat");
		}
	}

}
