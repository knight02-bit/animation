<%@ page language="java" contentType="text/html; charset=utf-8" import="java.util.*,com.kn.entity.*,java.text.*"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html lang="en">
<head>

    <meta charset="UTF-8">
    <title>番荒之冢-追番清单</title>
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

<header class="site-header3">
    <a href="menu.html" class="h-logo overlay">
        <div class="h-logo-inner">
            <img src="static/picture/番荒之冢1.png" alt="有一种脑干缺失的美">
        </div>
    </a>
    <nav class="submenu1 mainmenu3">
        <ul>
            <li>
                <a href="list.do">首页</a>
            </li>
            <li class="menu-item-has-children active">
                <a href="#">我的</a>
                <ul class="sub-menu">
                    <li><a href="info.jsp">我的资料</a></li>
                    <li class="active"><a href="#">追番清单</a></li>
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
		User user = (User)request.getSession().getAttribute("u");
		List<Anim> favorAnims = (List<Anim>)request.getAttribute("favorAnims");
	%>

    <div class="mainttl-wrap">
        <h1 class="mainttl"><span>你有 <%=favorAnims.size() %> 部番在追</span></h1>
    </div>
    
    <div class="row agents-list">
	    <%
	    	
	    	for(Anim anim : favorAnims)
	    	{
	    %>
    	<div class="cf-xs-6 cf-sm-6 cf-lg-4 col-xs-6 col-sm-6 col-md-4 agent-i-col">
            <div class="agent-i">
                <a href="" class="agent-i-img">
                    <img src="<%=anim.getCover() %>" alt="">
                </a>

                <h3 class="agent-i-ttl">
                    <a href=""><%=anim.getAname() %></a>
                </h3>
                <a href="favorDel.info?uid=<%=user.getUid() %>&&aid=<%=anim.getAid() %>" class="modalform-btn agent-i-call">取消追番</a>
            </div>
        </div>
        <%
	    	}
        %>
    </div>
    <!-- 追番清单分页 -->
</div>
</body>
</html>