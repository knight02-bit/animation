<%@ page language="java" contentType="text/html; charset=utf-8" import="java.util.*,com.kn.entity.*,java.text.*"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html lang="en">
<head>

    <meta charset="UTF-8">
    <title>番荒之冢-个人资料更新</title>
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
	    <div class="stylization agent-about">
	        <form action="update.info" method="post">
	            <table>
	            	<%
	            		String error_msg = session.getAttribute("error_msg").toString();
	            	%>
	                <tr>✍🏼个人资料修改
	                	<span style="color:red"><%=error_msg %></span>
	                </tr>
	                <tr>
	                    <td valign="middle" align="right">
	                        UID 
	                    </td>
	                    <td valign="middle" align="left">
	                    	<%=user.getUid() %>
	                    	<input type="hidden" name="uid" value="<%=user.getUid() %>"/>
	                	</td>
	                </tr>
	                <tr>
	                    <td valign="middle" align="right">
	                        昵称
	                    </td>
	                    <td valign="middle" align="left">
	                        <input type="text" name="uname" value="<%=user.getUname() %>"/>
	                    </td>
	                </tr>
	                <tr>
	                    <td valign="middle" align="right">
	                        邮箱
	                    </td>
	                    <td valign="middle" align="left">
	                        <input type="text" name="email" value="<%=user.getEmail() %>"/>
	                    </td>
	                </tr>
	                <tr>
	                    <td valign="middle" align="right">
	                        密码(不得少于6位)
	                    </td>
	                    <td valign="middle" align="left">
	                        <input type="text" name="pwd" value="<%=user.getPwd() %>"/>
	                    </td>
	                </tr>
	                
	                <tr>
	                    <td valign="middle" align="right">
	                        个人简介
	                    </td>
	                    <td valign="middle" align="left">
	                        <textarea name="intro" id="intro" placeholder="留下你的介绍吧少侠"><%=user.getIntro() %></textarea>
	                    </td>
	                </tr>
	                
	            </table>
	            <p>
	                <input type="submit" class="button" value="提交" />
	            </p>
	        </form>
	        <a href="details.info?uid=<%=user.getUid() %>"><button>取消修改</button></a>
	    </div>
	</div>
<jsp:include page="footer.jsp"/>
</body>
</html>