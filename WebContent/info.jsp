<%@ page language="java" contentType="text/html; charset=utf-8" import="java.util.*,com.kn.entity.*,java.text.*"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html lang="en">
<head>

    <meta charset="UTF-8">
    <title>番荒之冢-个人资料</title>
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
	User myUser = (User)request.getSession().getAttribute("u");
	int uidToFind = Integer.parseInt(request.getAttribute("uidToFind").toString());
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
            <%
            	// 判断是否查看本人资料
              	if(uidToFind == myUser.getUid()){
            %>
            <li class="menu-item-has-children active">
                <a href="#">我的</a>
                <ul class="sub-menu">
                    <li class="active"><a href="#">我的资料</a></li>
                    <li><a href="favorList.info">追番清单</a></li>
                </ul>
            </li>
            
            <%
                }else{
            %>
            <li class="menu-item-has-children">
                <a href="#">我的</a>
                <ul class="sub-menu">
                	<li><a href="details.info?uid=<%=myUser.getUid() %>">我的资料</a></li>
                    <li><a href="favorList.info">追番清单</a></li>
                </ul>
            </li>
            <%
              	}
            %>
            <li>
                <a href="list.chat">留言区</a>
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


<div class="container maincont">
		
		<%
			User user = (User)request.getAttribute("user");
		%>
		
        <div class="agent-detail">
        <p class="agent-detail-img" style="background-image: url(<%=user.getAvatar() %>);">
            <img src="<%=user.getAvatar() %>" alt="">
        </p>
        <div class="agent-detail-cont">
            <h1 class="agent-detail-ttl"><%=user.getUname() %></h1>

            <dl class="agent-detail-info">

                <dt>
                    <span class="agent-detail-info-icon"><img src="static/picture/h-ico-2.png" alt=""></span>
                    Email
                </dt>
                <dd><%=user.getEmail() %></dd>
                <dt>
                    <span class="agent-detail-info-icon"><img src="static/picture/ico-user.png" alt=""></span>
                    	权限等级
                </dt>
                <dd><%=user.getLevel()==1 ? "普通用户":"管理员" %></dd>
                <%
                	if(uidToFind == myUser.getUid()){
                		session.setAttribute("error_msg", "");
                %>
                <dt> </dt>
                <dd>
                	<a href="userToUpdate.jsp"><button>修改资料</button></a>
                </dd>
                <%
                	}
                %>
            </dl>
        </div>
    </div>

    <div class="stylization agent-about">
        <h2 class="agent-about-ttl">关于 <b><%=user.getUname() %></b></h2>
        <p>
        <%
        	if(user.getIntro() == null || user.getIntro().length()==0){
        %>
       		这个人很懒,还未留个人介绍
        <%
        	}else{
        %>
        	<%=user.getIntro() %> 
        <%
        	}
        %>
        
        </p>
    </div>
</div>

</body>
</html>