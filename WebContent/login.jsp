<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
	<title>番荒之冢-登录</title>
		<meta charset="utf-8">
		<link href="static/css/login.css" rel='stylesheet' type='text/css' />
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
</head>
<body class="bg">
	 <div class="main">
		<div class="login-form">
			<h1>用户登录</h1>
				<form>
						<tr>
							<td><span>邮箱:</span></td>
							<td>
								<input type="text" class="text" title="请输入用户名" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = '';}" >
							</td>
						</tr>
						<tr>
							<td><span>密码:</span></td>
							<td>
								<input type="text" class="text" title="请输入用户名" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = '';}" >
							</td>
						</tr>
						<div class="submit">
							<input type="submit" onclick="myFunction()" value="登录" >
						</div>
					<!-- <p><a href="#">Forgot Password ?</a></p> -->
				</form>
			</div>
   			<!-- <div class="copy-right"></div> -->
		</div>	 		
</body>
</html>