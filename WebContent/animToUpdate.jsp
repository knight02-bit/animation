<%@ page language="java" contentType="text/html; charset=utf-8" import="java.util.*,com.kn.entity.*,java.text.*"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html lang="en">
<head>

    <meta charset="UTF-8">
    <title>番荒之冢-番剧资料更新</title>
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
        <form action="update.do" method="post">
            <table>
            	<%
            		Anim anim = (Anim)request.getSession().getAttribute("anim0");
            		String error_msg = session.getAttribute("error_msg").toString();
            	%>
                <tr>✍🏼番剧资料修改
                	<span style="color:red"><%=error_msg %> </span>
                </tr>
                <tr>
                    <td valign="middle" align="right">
                        AID 
                    </td>
                    <td valign="middle" align="left">
                    	<%=anim.getAid() %>
                    	<input type="hidden" name="aid" value="<%=anim.getAid() %>"/>
                	</td>
                </tr>
                <tr>
                    <td valign="middle" align="right">
                        番名
                    </td>
                    <td valign="middle" align="left">
                        <input type="text" name="aname" value="<%=anim.getAname() %>"/>
                    </td>
                </tr>
                <tr>
                    <td valign="middle" align="right">
                        上映年份
                    </td>
                    <td valign="middle" align="left">
                    	<select name="year">
	                    <%
	                    	//获取今年的年份
	                    	Calendar calendar = Calendar.getInstance();
	                    	int current_year = calendar.get(Calendar.YEAR);
	                    	int year = anim.getYear();
	                    	
	                    %>
	                    	<option value="<%=year %>"><%=year %></option>
	                    <%
	                    	for(int i = current_year; i >= 1950; --i){
	                    		if(i != year){
	                    %>
	                    	<option value="<%=i %>"><%=i %></option>
	                    <%
	                    		}
	                    	}
	                    %>
                        </select>
                    </td>
                </tr>
                
                <tr>
                    <td valign="middle" align="right">
                        状态
                    </td>
                    <td valign="middle" align="left">
                        <select name="state">
                        <%
                        	if(anim.getState() == 1){
                        %>
							<option value="1">连载中</option>
							<option value="2">已完结</option>
							
						<%
                        	}else{
						%>
							<option value="2">已完结</option>
							<option value="1">连载中</option>
						<%
                        	}
						%>
						</select>
                    </td>
                </tr>
                
                <tr>
                    <td valign="middle" align="right">
                        封面外链(可为空)
                    </td>
                    <td valign="middle" align="left">
                        <input type="text" name="cover" value="<%=anim.getCover() %>"/>
                    </td>
                </tr>
                <tr>
                    <td valign="middle" align="right">
                        播放外链(可为空)
                    </td>
                    <td valign="middle" align="left">
                        <input type="text" name="link" value="<%=anim.getLink() %>"/>
                    </td>
                </tr>
                <tr>
                    <td valign="middle" align="right">
                        简介
                    </td>
                    <td valign="middle" align="left">
                        <textarea name="content" id="content" placeholder="向大伙推荐一下精彩之处吧!"><%=anim.getContent() %></textarea>
                    </td>
                </tr>
                
            </table>
            <p>
                <input type="submit" class="button" value="提交" />
            </p>
        </form>
        <a href="details.do?aid=<%=anim.getAid() %>"><button>取消修改</button></a>
    </div>
</div>

</body>
</html>