package com.kn.servlet;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.kn.entity.Anim;
import com.kn.entity.AnimPage;
import com.kn.entity.Comment;
import com.kn.entity.User;
import com.kn.service.AnimService;
import com.kn.service.CommentService;
import com.kn.service.UserService;

public class AnimServlet extends HttpServlet {
	
	
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
		
		AnimService service = new AnimService();
		
		if(path.equals("/list")){
			List<Anim> anims = new ArrayList<Anim>();
			
			String aname = request.getParameter("aname");
			String current = request.getParameter("current");
			AnimPage animPage = new AnimPage();
			
			try {
				//初始化分页animPage对象
				if(aname != null && aname.length() != 0){
					animPage.setAname(aname);
				}
				
				int rowNum = service.findRowNum(animPage);
				animPage.setRowNum(rowNum);
				if(current != null) {
					int cur = Integer.parseInt(current);
					animPage.setCurrentPage(cur);
				}
				
				anims = service.findByPage(animPage);
				//绑定数据
				request.setAttribute("anims", anims);
				request.setAttribute("page", animPage);
				
				CommentService commentService = new CommentService();
				List<Comment> comments = commentService.findLatestComment();
				request.setAttribute("comments", comments);
				
				//获取转发器,转发
				RequestDispatcher dispatcher = request.getRequestDispatcher("animList.jsp");
				dispatcher.forward(request, response);
			} catch (ClassNotFoundException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}else if(path.equals("/details")){
			UserService userService = new UserService();
			User user = (User)session.getAttribute("u");
			int aid = Integer.parseInt(request.getParameter("aid"));
			
			Anim anim = null;
			try {
				anim = service.findByAid(aid);
				int num = service.countFavorNumByAid(aid);
				request.setAttribute("anim", anim);
				request.setAttribute("num", num);
				boolean isFavor = userService.isFavor(user.getUid(), aid);
				request.setAttribute("isFavor", isFavor?1:0);
				
				RequestDispatcher dispatcher = request.getRequestDispatcher("details.jsp");
				dispatcher.forward(request, response);
			} catch (ClassNotFoundException e) {
				e.printStackTrace();
			}
		}
	}

}
