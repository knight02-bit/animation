<%@ page language="java" contentType="text/html; charset=utf-8" import="java.util.*,com.kn.entity.*,java.text.*"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html lang="en">
<head>

    <meta charset="UTF-8">
    <title>番荒之冢-留言区</title>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="format-detection" content="telephone=no">

    <link href="static/css/css.css" rel="stylesheet">

    <link rel="stylesheet" href="static/css/font-awesome.min.css">
    <link rel="stylesheet" href="static/css/ionicons.min.css">
    <link rel="stylesheet" href="static/css/bootstrap.min.css">
    <link rel="stylesheet" href="static/css/swiper.css">
    <link rel="stylesheet" href="static/css/chosen.css">
    <link rel="stylesheet" href="static/css/ion.rangeSlider.css">
    <link rel="stylesheet" href="static/css/ion.rangeSlider.skinFlat.css">
    <link rel="stylesheet" href="static/css/jquery-ui.css">
    <link rel="stylesheet" href="static/css/jquery.fancybox.css">
    <link rel="stylesheet" href="static/css/style.css">

</head>
<body>

<%
	User user = (User)request.getSession().getAttribute("u");
%>

<header class="site-header3">
    <a href="list.do" class="h-logo overlay">
        <div class="h-logo-inner">
            <img src="static/picture/番荒之冢1.png" alt="有一种脑干缺失的美">
        </div>
    </a>
    <nav class="submenu1 mainmenu3">
        <ul>
            <li>
                <a href="list.do">首页</a>
            </li>
            <li class="menu-item-has-children">
                <a href="#">我的</a>
                <ul class="sub-menu">
                    <li><a href="details.info?uid=<%=user.getUid() %>">我的资料</a></li>
                    <li><a href="favorList.info">追番清单</a></li>
                </ul>
            </li>
            <li class="active">
                <a href="#">留言区</a>
            </li>
            <li>
                <a href="logout.info">
                    <img src="static/image/modal-close.png" alt="">
                    退出登录
                </a>
            </li>
        </ul>
    </nav>
</header>

	<div class="container maincont stylization">
		<form action="add.chat" method="post">
	        <div >
	            <textarea name="message" id="message" placeholder="发送一条友善的留言" font-size="20px" cols="30" rows="5"></textarea>
	        </div>
	        <button type="submit" >发送留言</button>
	    </form>
	    <div class="cont-boxed">
	        <div class="testimonials-list style-1">
	        	
	        	<%
					List<Comment> comments = (ArrayList)request.getAttribute("comments");
					for(Comment comment : comments)
					{
				%>
					<div class="testimonials-i">
		                <div class="testimonials-i-cont">
		                    💡<p><%=comment.getContent() %></p>
		                    <%
		                    	if(user.getLevel() == 2 || comment.getUid() == user.getUid())
		                    	{
		                    %>
		                    	<a href="del.chat?uid=<%=comment.getUid() %>&&time=<%=comment.getTime() %>">✖删除</a>
		                    <%
		                    	}
		                    %>
		                </div>
		                <p class="testimonials-i-img">
		                    <a href="details.info?uid=<%=comment.getUid() %>"><img src="<%=comment.getAvatar() %>" alt=""></a> 
		                </p>
		                <div class="testimonials-i-info">
		                    <h3><a href="details.info?uid=<%=comment.getUid() %>"><%=comment.getUname() %></a> </h3>
		                    <p class="testimonials-i-position"> <%=comment.getTime() %> </p>
		                </div>
		            </div>
				<%
					}
				%>
	        </div>
	    </div>
	</div>
	
	<jsp:include page="footer.jsp"/>
</body>
</html>