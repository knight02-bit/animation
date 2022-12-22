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
		
		//首页分页列表
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
		}
		
		//查看番剧详情
		else if(path.equals("/details")){
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
		
		//更新番剧信息
		else if(path.equals("/update")){
			int aid = Integer.parseInt(request.getParameter("aid"));
			int state = Integer.parseInt(request.getParameter("state"));
			int year = Integer.parseInt(request.getParameter("year"));
			String aname = request.getParameter("aname");
			String cover = request.getParameter("cover");
			String link = request.getParameter("link");
			String content = request.getParameter("content");
			
			String error_msg = "";
			
			if(aname == null || aname.length()==0){
				error_msg = "番名不可为空";
			}else{
				//判断url格式是否合法
				String regex = "[a-zA-z]+://[^\\s]*"; // (注：\为转义字符）
				boolean flag = link.matches(regex);
				
				//若填就得合规
				if(link.length() != 0 && !flag) {
					error_msg = "播放链接格式错误";
				}
			}
			
			if(error_msg != ""){
				session.setAttribute("error_msg", error_msg);
				
				RequestDispatcher dispatcher = request.getRequestDispatcher("animToUpdate.jsp");
				dispatcher.forward(request, response);
				
			}else{
				if(cover == null || cover.length() == 0){
					cover = "static/picture/pic404.png";
				}
				
				Anim anim = new Anim();
				anim.setAid(aid);
				anim.setAname(aname);
				anim.setState(state);
				anim.setYear(year);
				anim.setCover(cover);
				anim.setLink(link);
				anim.setContent(content);
				
				try {
					service.update(anim);
				} catch (ClassNotFoundException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				
				//!!!记得及时修改session中的信息
				session.setAttribute("anim0", anim);
				
				//重定向
				response.sendRedirect("details.do?aid="+aid);
			}
		}
		
		else if(path.equals("/animAdd")){
			int state = Integer.parseInt(request.getParameter("state"));
			int year = Integer.parseInt(request.getParameter("year"));
			String aname = request.getParameter("aname");
			String cover = request.getParameter("cover");
			String link = request.getParameter("link");
			String content = request.getParameter("content");
			
			String error_msg = "";
			
			if(aname == null || aname.length()==0){
				error_msg = "番名不可为空";
			}else{
				//判断url格式是否合法
				String regex = "[a-zA-z]+://[^\\s]*"; // (注：\为转义字符）
				boolean flag = link.matches(regex);
				
				//若填就得合规
				if(link.length() != 0 && !flag) {
					error_msg = "播放链接格式错误";
				}
			}
			
			if(error_msg != ""){
				session.setAttribute("error_msg", error_msg);
				
				RequestDispatcher dispatcher = request.getRequestDispatcher("animAdd.jsp");
				dispatcher.forward(request, response);
				
			}else{
				if(cover == null || cover.length() == 0){
					cover = "static/picture/pic404.png";
				}
				
				Anim anim = new Anim();
				anim.setAname(aname);
				anim.setState(state);
				anim.setYear(year);
				anim.setCover(cover);
				anim.setLink(link);
				anim.setContent(content);
				
				try {
					service.add(anim);
				} catch (ClassNotFoundException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				
				//重定向
				response.sendRedirect("list.do");
			}
		}
		
		else if(path.equals("/animDel")){
			int aid = Integer.parseInt(request.getParameter("aid"));
			try {
				service.deleteByAid(aid);
			} catch (ClassNotFoundException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			response.sendRedirect("list.do");
		}
	}

}
