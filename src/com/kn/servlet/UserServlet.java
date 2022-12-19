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
						request.setAttribute("umsg", "¸ÃÓÃ»§Î´×¢²á");
					}
					request.getRequestDispatcher("login.jsp").forward(request, response);
					return;
				}
				if (!user.getPwd().equals(pwd)) {
					// ËµÃ÷ÃÜÂë´íÎó
					request.setAttribute("pmsg", "ÃÜÂë´íÎó");
					request.getRequestDispatcher("login.jsp").forward(request, response);
					return;
				}
				session.setAttribute("u", user);
				response.sendRedirect("list.do");
			} catch (ClassNotFoundException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}
}
