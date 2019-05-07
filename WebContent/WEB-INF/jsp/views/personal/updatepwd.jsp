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
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>我的信息</title>
		<link href="${path}/style/info/info1.css" rel="stylesheet" />
		<link href="${path}/style/info/isettings.css" rel="stylesheet" />
		<script src="${path}/style/js/jquery/2.0.0/jquery.min.js" type="text/javascript"></script>
		<script src="${path}/style/info/info1.js" type="text/javascript"></script>
		<script src="${path}/style/info/info2.js" type="text/javascript"></script>
		<script src="${path}/style/info/info3.js" type="text/javascript"></script>
	</head>

	<body>
		
		<%@include file="../common/head.jsp"%>
	
		<div class="wrapper clearfix">
			<div class="aside">
				<a href="${path }/web/userinfo" ><i class="i1"></i>我的信息</a>
				<a href="${path }/web/useravatar"><i class="i2"></i>我的头像</a>
				<a href="${path }/web/updatepwd" class="on"><i class="i3"></i>修改密码</a>
			</div>

			<div class="content">
				<div class="hd">
					<strong>我的信息</strong>
				</div>
				<div class="userinfo">
					<form action="${path }/web/updatepwd2" method="post" id="_j_form">
						<dl class="clearfix" style="display: none">
							<dt>id：</dt>
							<dd><input type="text" name="id" value="${dbuser.id }" ></dd>
						</dl>
						<dl class="clearfix">
							<dt>用户名：</dt>
							<dd>
								<input type="text" name="username" value="${dbuser.username }" maxlength="16" autocomplete="off" data-verification-name="用户名" class="verification[required,funcCall[checkNickname]]" data-verification-result="success">
							</dd>
						</dl>
						<dl class="clearfix">
							<dt>旧密码：</dt>
							<dd>
								<input type="password" name="password" value="" maxlength="16" autocomplete="off" data-verification-name="旧密码" class="verification[required,funcCall[checkNickname]]" data-verification-result="success">
								<span style="color: red;margin-top: 5px">${msg2 }</span>
							</dd>
						</dl>
						<dl class="clearfix">
							<dt>新密码：</dt>
							<dd>
								<input type="password" name="pwd" value="" maxlength="16" autocomplete="off" data-verification-name="新密码" class="verification[required,funcCall[checkNickname]]" data-verification-result="success">
							</dd>
						</dl>
						<dl class="clearfix">
							<dt>确认密码：</dt>
							<dd>
								<input type="password" name="pwd2" value="" maxlength="16" autocomplete="off" data-verification-name="确认新密码" class="verification[required,funcCall[checkNickname]]" data-verification-result="success">
								<span style="color: red;margin-top: 5px">${msg1 }</span>
							</dd>
						</dl>
						<div class="alert alert-danger" style="color: #a94442;background-color: #f2dede;border-color: #ebccd1;display:none"></div>
						<div class="btn-sub">
							<button type="submit">更改</button>
						</div>
					</form>
				</div>

			</div>
		</div>

		<script type="text/javascript">
			$(function() {
				var timer = 0,
					citySuggestXHR = null;
				var eventName = ($.browser.msie && parseInt($.browser.version, 10) < 9) ? 'keyup' : 'input';
				var success = function(field) {
					field.closest('dl').removeClass('error');
					$(".alert-danger").html("");
					$(".alert-danger").hide();
					console.log('show succ');
					console.log(field);
				};
				var failed = function(field, message) {
					field.closest('dl').addClass('error');
					$(".alert-danger").html(message);
					$(".alert-danger").show();
					console.log('show failed');
					console.log(field);
				};
				
		</script>
		
		<%@include file="../common/footer.jsp"%>

</html>