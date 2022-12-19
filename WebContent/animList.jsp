<%@ page language="java" contentType="text/html; charset=utf-8" import="java.util.*,com.kn.entity.*,java.text.*"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html lang="en">
<head>

    <meta charset="UTF-8">
    <title>番荒之冢-首页</title>
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
                <li class="active">
                    <a href="list.do">首页</a>
                </li>
                <li class="menu-item-has-children">
                    <a href="#">我的</a>
                    <ul class="sub-menu">
                        <li><a href="info.html">我的资料</a></li>
                        <li><a href="favor-list.html">追番清单</a></li>
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
	    	AnimPage p = (AnimPage)request.getAttribute("page");
	    	int current_page = p.getCurrentPage();
	    	int pageNum = p.getPageNum();
	    %>
		<span>
			<%=request.getSession().getAttribute("u") %>
		</span>
        <h1 class="mainttl"><span>为您找到相关结果 <%=p.getRowNum() %> 个</span></h1>


        <!--
        Full Width: remove .cont-withsb & .cont-sb-lt or .cont-sb-rt element
        Right sidebar: .cont-sb-rt instead .cont-sb-lt and replace after .cont-content
        Left Sidebar: .cont-sb-lt instead .cont-sb-rt and replace before .cont-content
        -->
        <div class="cont-withsb">
            <div class="cont-sb-lt">
                <div class="widget widget-search">
                    <h3 class="widget-ttl"><b>搜索</b> </h3>
                    <form action="list.do" method="post">
                        <input name="aname" type="text" placeholder="输入番名或者关键字">
                        <button><img src="static/picture/ico-search.png" alt=""></button>
                    </form>
                </div>
                <div class="widget widget-categories">
                    <h3 class="widget-ttl">💠分类</h3>
                    <ul>
                        <li><a href="">所有 </a></li>
                        <li><b>🔴类型</b></li>
                        <td>
                            <tr><a href="">热血 </a></tr>
                            <tr><a href="">恋爱 </a></tr>
                            <tr><a href="">搞笑 </a></tr>
                            <tr><a href="">励志 </a></tr>
                            <tr><a href="">战斗 </a></tr>
                            <tr><a href="">校园 </a></tr>
                            <tr><a href="">青春 </a></tr>
                        </strong>
                        </td>
                        <li><b>🟡年份</b> </li>
                        <td>
                            <tr><a href="">2022 </a></tr>
                            <tr><a href="">2021 </a></tr>
                            <tr><a href="">...(后续用jsp循环) </a></tr>
                            <tr><a href="">2000以前 </a></tr>
                        </td>
                        <li><b>🟢状态</b> </li>
                        <td>
                            <tr><a href="">连载中 </a></tr>
                            <tr><a href="">已完结 </a></tr>
                            <!-- <tr><a href="">未上映 </a></tr> -->
                        </td>
                    </ul>
                </div>
                <div class="widget widget-comments">
                    <h3 class="widget-ttl"><b>💬最新留言</b> </h3>
                    <ul>
                        <li>
                            <p class="widget-comments-author"><b>🕵🏼‍♀️ <a href="#">萨拉低昂的魔咒</a></b> </p>
                            <p>有妹妹，有青梅，有天降——还是对姐妹花，但只想过佛系生活的男主</p>
                        </li>
                        <li>
                            <p class="widget-comments-author"><b>🕵🏼‍♀️ <a href="#">哈利</a></b> </p>
                            <p>🧐我好饿</p>
                        </li>
                    </ul>
                </div>
            </div>
            <div class="cont-content">
                <div class="row post-grid" align="center">
                	
                	<%
                		List<Anim> anims = (List<Anim>)request.getAttribute("anims");
                		for(Anim anim : anims)	
                		{
                	%>
                
                    <div class="cf-xs-6 cf-sm-6 cf-lg-6 col-xs-6 col-sm-6 col-md-6 post-i-col">
                        <div class="post-i">
                            <a href="details.do?aid=<%=anim.getAid() %>">
                                <img src="<%=anim.getCover() %>" alt="">
                            </a>
                            <h3 class="post-i-ttl">
                            	<a href="details.do?aid=<%=anim.getAid() %>">
                            		<%=anim.getAname() %>
                            	</a>
                            </h3>
                            <p class="post-i-info">
                                <a href="details.do?aid=<%=anim.getAid() %>" class="post-i-more">了解更多</a>
                            </p>
                        </div>
                    </div>
                    
                    <%
                		}
                	%>
                </div>
                
                <!--
                .pagi-left - left align
                .pagi-right - right align
                -->
                <ul class="pagi pagi-right" text-align="center">
                	<%
                		if(current_page != 1){
                	%>
                    		<li><a href="list.do?current=<%=current_page-1 %>">👈</a></li>
                    <%
						}
					%>

                    <%
						for(int i = 1; i <= pageNum; i++){
							
							if(current_page == i){
					%>
								<li><span><%=i %></span></li>
					<%
							}else if(p.getAname() == null){
					%>
								<li><a href="list.do?current=<%=i %>"><%=i %></a></li>
					<%
							}else{
							
					%>
								<li><a href="list.do?current=<%=i %>&&aname=<%=p.getAname() %>"><%=i %></a></li>
					<%
							}
						}
					%>
                    	
                    <%
                		if(current_page != pageNum)
                		{
                			if(p.getAname() == null)
                			{
                	%>
                    			<li><a href="list.do?current=<%=current_page+1 %>">👉</a></li>
                    <%
                			}else if(p.getPageNum() > 1){
                				
                	%>
                				<li><a href="list.do?current=<%=current_page+1 %>&&aname=<%=p.getAname() %>">👉</a></li>
                	<%
                			}
                		}
					%>
                </ul>
            </div>
        </div>

    </div>

</body>
</html>