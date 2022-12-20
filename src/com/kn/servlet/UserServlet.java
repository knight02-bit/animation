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

import com.kn.entity.Anim;
import com.kn.entity.User;
import com.kn.service.UserService;

public class UserServlet extends HttpServlet {

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		HttpSession session = request.getSession();
		UserService service = new UserService();
		
		String uri = request.getRequestURI();
		String path = uri.substring(uri.lastIndexOf("/"), uri.lastIndexOf("."));

		if(path.equals("/login")){
			String email = request.getParameter("email");
			String pwd = request.getParameter("pwd");
			User user = null;

			
			try {
				user = service.login(email);
				request.setAttribute("email", email);
				if (user == null) {
					if(email != null){
						request.setAttribute("umsg", "该用户未注册");
					}
					request.getRequestDispatcher("login.jsp").forward(request, response);
					return;
				}
				if (!user.getPwd().equals(pwd)) {
					// 说明密码错误
					request.setAttribute("pmsg", "密码错误");
					request.getRequestDispatcher("login.jsp").forward(request, response);
					return;
				}
				session.setAttribute("u", user);
				response.sendRedirect("list.do");
			} catch (ClassNotFoundException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}else if(path.equals("/logout")){
			session.setAttribute("u", null);
			response.sendRedirect("login.info");
			
		}else if(path.equals("/details")){
			Object obj = session.getAttribute("u");
			if(obj == null){
				//跳转回登录页面 
				response.sendRedirect("login.jsp");
				return;
			}
			
			int uidToFind = Integer.parseInt(request.getParameter("uid"));
			request.setAttribute("uidToFind", uidToFind);
			
			try {
				User user = service.findByUid(uidToFind);
				
				request.setAttribute("user", user);
				RequestDispatcher dispatcher = request.getRequestDispatcher("info.jsp");
				dispatcher.forward(request, response);
			} catch (ClassNotFoundException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}else if(path.equals("/favorList")){
			Object obj = session.getAttribute("u");
			if(obj == null){
				//跳转回登录页面 
				response.sendRedirect("login.jsp");
				return;
			}
			
			List<Anim> favorAnims = null;
			User user = (User)session.getAttribute("u");
			int uid = user.getUid();
			
			try {
				favorAnims = service.findFavorListByUid(uid);
			} catch (ClassNotFoundException e) {
				e.printStackTrace();
			}
			request.setAttribute("favorAnims", favorAnims);
			
			//获取转发器,转发
			RequestDispatcher dispatcher = request.getRequestDispatcher("favorList.jsp");
			dispatcher.forward(request, response);
		}else if(path.equals("/favorDel")){
			Object obj = session.getAttribute("u");
			if(obj == null){
				//跳转回登录页面 
				response.sendRedirect("login.jsp");
				return;
			}
			
			int uid = Integer.parseInt(request.getParameter("uid"));
			int aid = Integer.parseInt(request.getParameter("aid"));
			try {
				service.deleteFavorAnim(uid, aid);
			} catch (ClassNotFoundException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			response.sendRedirect("favorList.info");
		}
	}
}
