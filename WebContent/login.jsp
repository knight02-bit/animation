<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
	<title>番荒之冢-登录</title>
		<meta charset="utf-8">
		<link href="static/css/login.css" rel='stylesheet' type='text/css' />
		<meta name="viewport" content="width=device-width, initial-scale=1">

</head>
<body class="bg">
	 <div class="main">
		<div class="login-form">
			<h1>用户登录</h1>
				<form action="login.info" method="post">
						<tr>
							<td><span>邮箱:</span></td>
							<td>
								<span style="color:red">
										<%=request.getAttribute("umsg")==null?"":request.getAttribute("umsg") %>
								</span>
							</td>
							<td>
								<input type="text" class="text" name="email"/>
							</td>
						</tr>
						<tr>
							<td><span>密码:</span></td>
							<td>
								<span style="color:red">
										<%=request.getAttribute("pmsg")==null?"":request.getAttribute("pmsg") %>
								</span>
							</td>
							
							<td>
								<input type="password" class="text" name="pwd" />
							</td>
						</tr>
						<div class="submit">
							<input type="submit" value="登录" >
						</div>
				</form>
			</div>
   			<!-- <div class="copy-right"></div> -->
		</div>	 		
</body>
</html>