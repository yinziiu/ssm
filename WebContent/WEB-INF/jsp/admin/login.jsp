<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set value="${pageContext.request.contextPath}" var="path" scope="page" />
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">

<script type="text/javascript">
	var path = "${path}";
</script>
<html>

	<head>
		<meta charset="utf-8">
		<link href="${path}/admin/static/h-ui/css/H-ui.min.css" rel="stylesheet" type="text/css" />
		<link href="${path}/admin/static/h-ui.admin/css/H-ui.login.css" rel="stylesheet" type="text/css" />
		<link href="${path}/admin/static/h-ui.admin/css/style.css" rel="stylesheet" type="text/css" />
		<link href="${path}/admin/lib/Hui-iconfont/1.0.8/iconfont.css" rel="stylesheet" type="text/css" />
		<title>后台登录</title>
		
		<style type="text/css">
			.loginWraper{
				background: url("${path}/images/icon/bann.jpg");
				background-size: 100% 100%;
				font-family: 'Roboto', sans-serif;
			}
			.loginBox{
				width: 617px;
				height: 329px;
				left: 50%;
				top: 50%;
				margin-left: -280px;
				margin-top: -184px;
				padding-top: 38px;
				background-color: #2B3643;
				background-color: rgba(0,0,0,0.3);
			}
			.text{
				color: white;
				text-align: center;
			}
			
		</style>
		
	</head>

	<body>
		<div class="loginWraper">
			<div id="loginform" class="loginBox">
				<form class="form form-horizontal" action="${path }/adminlogin" method="post">
					<h3 class="text">管理员登录</h3>
					<div class="row cl">
						<label class="form-label col-xs-3" style="color: white;"><i class="Hui-iconfont">&#xe60d;</i>&nbsp;账户</label>
						<div class="formControls col-xs-8">
							<input id="username" name="username" type="text" placeholder="账户" class="input-text size-L">
						</div>
					</div>
					<div class="row cl">
						<label class="form-label col-xs-3" style="color: white;"><i class="Hui-iconfont">&#xe60e;</i>&nbsp;密码</label>
						<div class="formControls col-xs-8">
							<input id="password" name="password" type="password" placeholder="密码" class="input-text size-L">
						</div>
					</div>
					<div align="center">
						<span style="color: red;font-size: 15px;text-align: center;">${msg }</span>
					</div>
					<br>
					<div class="row cl">
						<div class="formControls col-xs-8 col-xs-offset-3">
							<input name="" type="submit" class="btn btn-success radius size-L" value="&nbsp;登&nbsp;&nbsp;&nbsp;&nbsp;录&nbsp;">
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							<input name="" type="reset" class="btn btn-default radius size-L" value="&nbsp;取&nbsp;&nbsp;&nbsp;&nbsp;消&nbsp;">
						</div>
					</div>
				</form>
			</div>
		</div>
		<div class="footer">Copyright 冯秀茵</div>
		<script type="text/javascript" src="${path}/admin/lib/jquery/1.9.1/jquery.min.js"></script>
		<script type="text/javascript" src="${path}/admin/static/h-ui/js/H-ui.min.js"></script>
	</body>

</html>