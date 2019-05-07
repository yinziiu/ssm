<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set value="${pageContext.request.contextPath}" var="path" scope="page" />
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<script type="text/javascript">
	var path = "${path}";
</script>
<html>
<head>
	<title>登录</title>
	<link href="${path}/style/common/css/style.css" rel="stylesheet" />
	<style type="text/css">
		body {
			background: url(${path}/images/icon/i3.png) no-repeat;
			padding: 80px 0px 10px 0px;
			font-family: 'Roboto', sans-serif;
			font-size: 100%;
			background-size:100% 100%,10%,contain; 
		}	
	</style>
	
</head>
<body>
	<div class="login">
		<div class="login-top">
			<h1>游客登录</h1>
			<form action="${path}/weblogin" method="post">
				<input type="text" value="username" id="username" name="username" placeholder="用户名" /> 
				<input type="password" value="password" id="password" name="password" placeholder="密码" />
				<span style="color: red;margin-top: 5px">${msg }</span>
				<div class="forgot">
					<a href="#">忘记密码</a> 
					<input type="submit" value="登录" />
				</div>
			</form>
			
		</div>
		<div class="login-bottom">
			<h3>
				新用户&nbsp;<a href="${path}/register">注册</a>
			</h3>
		</div>
	</div>
	<div class="copyright">
		<p>
			Copyright &copy; 2019.冯秀茵 All rights reserved.
		</p>
	</div>
</body>
</html>