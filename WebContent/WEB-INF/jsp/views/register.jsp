<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set value="${pageContext.request.contextPath}" var="path"
	scope="page" />
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<script type="text/javascript">
	var path = "${path}";
</script>
<html>
<head>
	<title>注册</title>
	<link href="${path }/style/common/css/style2.css" rel="stylesheet" />
	<style type="text/css">
		body {
			background: url(${path}/images/icon/i3.png) no-repeat;
			padding: 30px 0px 10px 0px;
			font-family: 'Roboto', sans-serif;
			font-size: 100%;
			background-size:100% 100%,10%,contain; 
		}
		.register {
			width: 500px;
			margin: 0 auto;
		}
		.register h2 {
			font-size: 30px;
			font-weight: 700;
			color: #fff;
			text-align: center;
			margin: 0px 0px 50px 0px;
			font-family: 'Droid Serif', serif;
		}
		
		.register-top {
			background: #E1E1E1;
			border-radius: 25px 25px 0px 0px;
			-webkit-border-radius: 25px 25px 0px 0px;
			-moz-border-radius: 25px 25px 0px 0px;
			-o-border-radius: 25px 25px 0px 0px;
			padding: 40px 60px;
		}
		
		.register-top h1 {
			text-align: center;
			font-size: 27px;
			font-weight: 500;
			color: #F45B4B;
			margin: 0px 0px 20px 0px;
		}
		.forgot  a {
			font-size: 13px;
			font-weight: 500;
			color: #F45B4B;
			display: inline-block;
			border-right: 2px solid #F45B4B;
			padding: 0px 7px 0px 0px;
		}
		
		.forgot  a:hover {
			color: #818181;
		}
		
		.forgot input[type="submit"] {
			background: #F45B4B;
			color: #FFF;
			font-size: 17px;
			font-weight: 400;
			padding: 8px 7px;
			width: 20%;
			display: inline-block;
			cursor: pointer;
			border-radius: 6px;
			-webkit-border-radius: 19px;
			-moz-border-radius: 6px;
			-o-border-radius: 6px;
			margin: 20px 7px 0px 3px;
			outline: none;
			border: none;
		}
		
		.forgot input[type="submit"]:hover {
			background: #818181;
			transition: 0.5s all;
			-webkit-transition: 0.5s all;
			-moz-transition: 0.5s all;
			-o-transition: 0.5s all;
		}
		
		.forgot {
			text-align: right;
		}
		
		.register-bottom {
			background: #E15748;
			padding: 30px 65px;
			border-radius: 0px 0px 25px 25px;
			-webkit-border-radius: 0px 0px 25px 25px;
			-moz-border-radius: 0px 0px 25px 25px;
			-o-border-radius: 0px 0px 25px 25px;
			text-align: right;
			border-top: 2px solid #AD4337;
		}
		
		.register-bottom h3 {
			font-size: 14px;
			font-weight: 500;
			color: #fff;
		}
		
		.register-bottom h3 a {
			font-size: 25px;
			font-weight: 500;
			color: #fff;
		}
		
		.register-bottom h3 a:hover {
			color: #696969;
			transition: 0.5s all;
			-webkit-transition: 0.5s all;
			-moz-transition: 0.5s all;
			-o-transition: 0.5s all;
		}
		
		.copyright {
			padding: 100px 0px 0px 0px;
			text-align: center;
		}
		
		.copyright p {
			font-size: 15px;
			font-weight: 400;
			color: #fff;
		}
		
		.copyright p a {
			font-size: 15px;
			font-weight: 400;
			color: #E15748;
		}
		
		.copyright p a:hover {
			color: #fff;
			transition: 0.5s all;
			-webkit-transition: 0.5s all;
			-moz-transition: 0.5s all;
			-o-transition: 0.5s all;
		}
		table td.f_name,table td.f_input{
			line-height: 2;
			padding-top: 10px;
		}
		table td.f_input{
			width: 300px;
		}
		table td.f_name{
			width: 120px;
			text-align: left;
		}
		td.f_input input[type="text"],
		td.f_input input[type="password"]{
			padding:8px;
			border: 1px solid #eee;
			color:#333;
			width: 88%;
		}
	</style>
	
</head>
<body>
<div  class="register">
	<div  class="register-top">		
		<h1>游客注册</h1>
		<form action="${path}/register" method="post" enctype="multipart/form-data">
			<table id="register_box">
				<tr style="display: none;">
					<td class="f_name"><span style="color:red;">*</span>角色id</td>
					<td class="f_input">
						<input type="text" name="rid" id="rid" value="1" />
					</td>
				</tr>
				<tr>
					<td class="f_name"><span style="color:red;">*</span>用户名</td>
					<td class="f_input">
						<input type="text" name="username" id="username" value="" />
					</td>
				</tr>
				<tr>
					<td class="f_name"><span style="color:red;">*</span>密码</td>
					<td class="f_input">
						<input type="password" name="password" id="password" value="" />
					</td>
				</tr>
				<tr>
					<td class="f_name"><span style="color:red;">*</span>确认密码</td>
					<td class="f_input">
						<input type="password" name="password2" id="password2" value="" />
					</td>
				</tr>
				<tr>
					<td class="f_name">头像</td>
					<td class="f_input">
						<input type="file" name="myphoto" id="myphoto" value="" />
					</td>
				</tr>
				<tr>
					<td class="f_name">性别</td>
					<td class="f_input">
						<input type="radio" name="sex" id="sex" value="0" />男
						<input type="radio" name="sex" id="sex" value="1" />女
						<input type="radio" name="sex" id="sex" value="2" />保密
					</td>
				</tr>
				<tr>
					<td class="f_name">出生日期</td>
					<td class="f_input">
						<input type="text" name="birthday" id="birthday" value="" />
					</td>
				</tr>
				<tr>
					<td class="f_name">城市</td>
					<td class="f_input">
						<input type="text" name="city" id="city" value="" />
					</td>
				</tr>
				<tr>
					<td class="f_name">手机号</td>
					<td class="f_input">
						<input type="text" name="phone" id="phone" value="" />
					</td>
				</tr>
				<tr>
					<td class="f_name">邮箱</td>
					<td class="f_input">
						<input type="text" name="email" id="email" value="" />
					</td>
				</tr>
				<tr>
					<td class="f_name">个性签名</td>
					<td class="f_input">
						<textarea rows="5" cols="36" name="resume" id="resume" ></textarea>
					</td>
				</tr>
				<tr>
					<td colspan="2">
						<p style="color: red;">${msg }</p>
					</td>
				</tr>
			</table>
			<div class="forgot"> 
				<input type="submit" value="注册" />
			</div>
		</form>
	</div>
	<div class="register-bottom">
		<h3>
			用户&nbsp;<a href="${path}/web/login">登录</a>
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