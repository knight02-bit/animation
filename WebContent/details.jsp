<%@ page language="java" contentType="text/html; charset=utf-8" import="java.util.*,com.kn.entity.*,java.text.*"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html lang="en">
<head>

    <meta charset="UTF-8">
    <title>番荒之冢-番剧详情</title>
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
			Anim anim = (Anim)request.getAttribute("anim");
			int favorNum = Integer.parseInt(request.getAttribute("num").toString());
		%>
	    <div class="agent-detail">
	      
	        <div class="agent-detail-cont">
	        	<p class="agent-detail-img" style="background-image: url(<%=anim.getCover() %>);">
	            	<img src="<%=anim.getCover() %>" alt="">
	        	</p>
	            <h1 class="agent-detail-ttl"><%=anim.getAname() %></h1>
	            <dl class="agent-detail-info">
	                <dt>
	                    上映时间
	                </dt>
	                <dd><%=anim.getYear() %></dd>
	                <dt>
	                    状态
	                </dt>
	                <dd>
	                	<%
	                		if(anim.getState() == 1){
	                	%>
	                		连载中
	                	<%
	                		}else{
	                	%>
	                		已完结
	                	<%
	                		}
	                	%>
	                </dd>
	                
	                <dt>
	                    <span class="agent-detail-info-icon"><img src="static/picture/h-ico-1.png" alt=""></span>
	                    有效链接
	                </dt>
	                <dd>
	                	<%
	                		if(anim.getLink() == null || anim.getLink().length()==0){
	                	%>
	                		<p>暂无, 欢迎在留言区咨询, <br/>或者提交修改意见</p>
	                	<%
	                		}else{
	                	%>
	                		<a href="<%=anim.getLink() %>">👉点击直达👈</a>
	                	<%
	                		}
	                	%>
	                	
	                </dd>
	
	                <dt>
	                    <span class="agent-detail-info-icon"><img src="static/picture/ico-user.png" alt=""></span>
	                    追番人数
	                </dt>
	                <dd><%=favorNum %></dd>
	                <dt> </dt>
	                
	                <dd>
	                	
	                	<%
	                		int isFavor = Integer.parseInt(request.getAttribute("isFavor").toString());
	                		if(isFavor == 0){
	                	%>
		                	<a href="favorAdd.info?uid=<%=user.getUid() %>&&aid=<%=anim.getAid() %>">
		                		<button>俺也要追!</button>
		                	</a>
	                	<%
	                		}else{
	                	%>
	                		<span style="color:red">(已追番)</span>
	                	<%
	                		}
	                	%>
	                	
	                </dd>
	                <%
	               		if(user.getLevel() == 2){
	               			session.setAttribute("anim0", anim);
	               			session.setAttribute("error_msg", "");
	               	%>
	                <dt> </dt>
	                <dd>
	                	<a href="animToUpdate.jsp"><button>编辑信息 </button></a>
	                </dd>
					<%
	               		}
	               	%>
	            </dl>
	        </div>
	    </div>
	
	    <div class="stylization agent-about">
	        <h2 class="agent-about-ttl">About <b><%=anim.getAname() %></b></h2>
	        <%
	        	if(anim.getContent() == null || anim.getContent().length() == 0){
	        %>
	        	暂无介绍
	        <%
	        	}else{
	        %>
	        	<%=anim.getContent() %>
	        <%
	        	}
	        %>
	    </div>
	</div>
<jsp:include page="footer.jsp"/>
</body>
</html>