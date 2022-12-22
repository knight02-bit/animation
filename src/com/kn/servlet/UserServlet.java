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
						request.setAttribute("umsg", "���û�δע��");
					}
					request.getRequestDispatcher("login.jsp").forward(request, response);
					return;
				}
				if (!user.getPwd().equals(pwd)) {
					// ˵���������
					request.setAttribute("pmsg", "�������");
					request.getRequestDispatcher("login.jsp").forward(request, response);
					return;
				}
				session.setAttribute("u", user);
				//session.setAttribute("error_msg", "");
				response.sendRedirect("list.do");
			} catch (ClassNotFoundException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		else if(path.equals("/logout")){
			session.setAttribute("u", null);
			response.sendRedirect("login.info");
			
		}
		
		//�鿴��������
		else if(path.equals("/details")){
			Object obj = session.getAttribute("u");
			if(obj == null){
				//��ת�ص�¼ҳ�� 
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
		}
		
		//���¸�������
		else if(path.equals("/update")){
			Object obj = session.getAttribute("u");
			if(obj == null){
				//��ת�ص�¼ҳ�� 
				response.sendRedirect("login.jsp");
				return;
			}
			
			int uid = Integer.parseInt(request.getParameter("uid"));
			String uname = request.getParameter("uname");
			String email = request.getParameter("email");
			String pwd = request.getParameter("pwd");
			String intro = request.getParameter("intro");
			
			String error_msg = "";
			
			//�ж��ǳƺ������Ƿ����
			if(uname == null || uname.length()==0){
				error_msg = "�ǳƲ���Ϊ��";
			}else if(pwd.length() < 6){
				error_msg = "���벻������6λ";
			}else{
				//�ж������Ƿ�Ϸ�
				String regex = "[a-zA-Z0-9_]+@[a-zA-Z0-9_]+(\\.[a-zA-Z0-9]+)+"; // (ע��\Ϊת���ַ���
				boolean flag = email.matches(regex);
				if(!flag) {
					error_msg = "�����ʽ����";
				}
			}
			

			if(error_msg != ""){
				session.setAttribute("error_msg", error_msg);
				
				RequestDispatcher dispatcher = request.getRequestDispatcher("userToUpdate.jsp");
				dispatcher.forward(request, response);
			}else{
				User user = new User();
				user.setUid(uid);
				user.setUname(uname);
				user.setEmail(email);
				user.setPwd(pwd);
				user.setIntro(intro);
				
				try {
					service.update(user);
				} catch (ClassNotFoundException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				
				//!!!�ǵü�ʱ�޸�session�е���Ϣ
				session.setAttribute("u", user);
				
				//�ض���
				response.sendRedirect("details.info?uid="+uid);
			}
		}
		
		//�鿴����׷���嵥
		else if(path.equals("/favorList")){
			Object obj = session.getAttribute("u");
			if(obj == null){
				//��ת�ص�¼ҳ�� 
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
			
			//��ȡת����,ת��
			RequestDispatcher dispatcher = request.getRequestDispatcher("favorList.jsp");
			dispatcher.forward(request, response);
		}
		
		//ȡ��׷��
		else if(path.equals("/favorDel")){
			Object obj = session.getAttribute("u");
			if(obj == null){
				//��ת�ص�¼ҳ�� 
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
		
		//����׷��
		else if(path.equals("/favorAdd")){
			Object obj = session.getAttribute("u");
			if(obj == null){
				//��ת�ص�¼ҳ�� 
				response.sendRedirect("login.jsp");
				return;
			}
			
			int uid = Integer.parseInt(request.getParameter("uid"));
			int aid = Integer.parseInt(request.getParameter("aid"));
			try {
				service.addFavorAnim(uid, aid);
			} catch (ClassNotFoundException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
			response.sendRedirect("details.do?aid="+aid);
		}
	}
}
