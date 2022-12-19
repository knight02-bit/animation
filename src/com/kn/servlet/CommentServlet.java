package com.kn.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.kn.entity.Comment;
import com.kn.service.CommentService;

public class CommentServlet extends HttpServlet {

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		HttpSession session = request.getSession();
		
		String uri = request.getRequestURI();
		String path = uri.substring(uri.lastIndexOf("/"),uri.lastIndexOf("."));
		
		CommentService service = new CommentService();
		if(path.equals("/list")){
			
			Object obj = session.getAttribute("u");
			if(obj == null){
				//��ת�ص�¼ҳ�� 
				response.sendRedirect("login.jsp");
				return;
			}
			
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
	}

}
