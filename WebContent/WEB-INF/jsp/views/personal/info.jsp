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
				<a href="${path }/web/userinfo" class="on"><i class="i1"></i>我的信息</a>
				<a href="${path }/web/useravatar"><i class="i2"></i>我的头像</a>
				<a href="${path }/web/updatepwd"><i class="i3"></i>修改密码</a>
			</div>

			<div class="content">
				<div class="hd">
					<strong>我的信息</strong>
				</div>
				<div class="userinfo">
					<form action="${path }/web/updateuserinfo" method="post" id="_j_form">
						<dl class="clearfix" style="display: none">
							<dt>id：</dt>
							<dd><input type="text" name="id" value="${dbuser.id }" ></dd>
						</dl>
						<dl class="clearfix">
							<dt>用户名：</dt>
							<dd><input type="text" name="username" value="${dbuser.username }" maxlength="16" autocomplete="off" data-verification-name="用户名" class="verification[required,funcCall[checkNickname]]" data-verification-result="success"></dd>
						</dl>
						<dl class="clearfix">
							<dt>性别：</dt>
							<dd>
								<label>
									<span class="cssradio"><input type="radio" name="sex" value="0" <c:if test="${dbuser.sex eq '0'}"> checked=true</c:if>><span></span></span>男
								</label>
								<label>
									<span class="cssradio"><input type="radio" name="sex" value="1" <c:if test="${dbuser.sex eq '1'}"> checked=true</c:if>><span></span></span>女
								</label>
								<label>
									<span class="cssradio"><input type="radio" name="sex" value="2" <c:if test="${dbuser.sex eq '2'}"> checked=true</c:if>><span></span></span>保密
								</label>
							</dd>
						</dl>
						<dl class="clearfix">
							<dt>出生日期：</dt>
							<dd>
								<input type="text" readonly="true" name="birthday" value="${dbuser.birthday }" data-verification-name="出生日期" class="" autocomplete="off">
							</dd>
						</dl>
						<dl class="clearfix">
							<dt>城市：</dt>
							<dd>
								<div class="input-group">
									<input type="text" name="city" value="${dbuser.city }"  autocomplete="off" data-verification-name="城市">
								</div>
							</dd>
						</dl>
						<dl class="clearfix">
							<dt>手机号：</dt>
							<dd>
								<div class="input-group">
									<input type="text" name="phone" value="${dbuser.phone }"  autocomplete="off" data-verification-name="手机号">
								</div>
							</dd>
						</dl>
						<dl class="clearfix">
							<dt>邮箱：</dt>
							<dd>
								<div class="input-group">
									<input type="text" name="email" value="${dbuser.email }"  autocomplete="off" data-verification-name="邮箱">
								</div>
							</dd>
						</dl>
						<dl class="clearfix">
							<dt>个性签名：</dt>
							<dd><textarea name="resume" data-verification-name="个性签名" placeholder="" class="verification[maxSize[100]]" maxlength="100">${dbuser.resume }</textarea></dd>
						</dl>
						<div class="alert alert-danger" style="color: #a94442;background-color: #f2dede;border-color: #ebccd1;display:none"></div>
						<div class="btn-sub">
							<button type="submit">保存</button>
						</div>
					</form>
				</div>

			</div>
		</div>
		<script>
		<script type="text/javascript">
			$(function() {
				$('.aside a').not('.on').on('click', function(e) {
					var left, top;
					$('.aside .ripple').removeClass('animate');
					0 === $(this).children('.ripple').size() && $(this).prepend('<span class="ripple"></span>');
					var ripple = $(this).children('.ripple');
					left = e.pageX - $(this).offset().left - ripple.width() / 2,
						top = e.pageY - $(this).offset().top - ripple.height() / 2,
						ripple.css({
							top: top,
							left: left
						}).addClass('animate');
				});
				$('.content .alert .close').on('click', function() {
					$(this).closest('.alert').fadeOut(500, function() {
						$(this).remove();
					});
				});
			});
		</script>

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
				$('#_j_form')
					.delegate('[name="city"]', eventName, function() {
						var self = $(this),
							parentGroup = self.closest('.input-group'),
							oldWord = self.data('city'),
							word = $.trim(self.val()),
							suggest = parentGroup.find('.input-suggest');

						if(oldWord != word) {
							clearTimeout(timer);
							citySuggestXHR && citySuggestXHR.abort();
							parentGroup.find('input[name="citymddid"]').val('');
							if(!word) {
								suggest.empty().hide();
							} else {
								timer = setTimeout(function() {
									citySuggestXHR = $.getJSON('/home/setting.php/citySuggest?word=' + encodeURIComponent(word), function(data) {
										self.data('city', word);
										suggest.empty();
										if(data.length > 0) {
											for(var i in data) {
												$('<li><a href="#" data-mddid="' + data[i].mddid + '"><i class="place"></i><span class="mddname">' + data[i].name + '</span>' + (data[i].parent ? '(' + data[i].parent.name + ')' : '') + '</a></li>').appendTo(suggest);
											}
											suggest.show();
										}
									});
								}, 200);
							}
						}
					})
					.delegate('.input-group .input-suggest a', 'click', function(e) {
						e.preventDefault();
						var self = $(this);
						var group = self.closest('.input-group');
						group.find('input[name="city"]').val(self.find('.mddname').text());
						group.find('input[name="citymddid"]').val(self.data('mddid'));
						group.find('.input-suggest').empty().hide();
						$('#_j_form').verification('verifyField', group.find(':text'));
					})
					.verification({
						customFuncs: {
							checkNickname: function(field) {
								var value = $.trim(field.val());
								var len = 0;
								for(var i = 0; i < value.length; i++) {
									if(value.charAt(i).match(/[^\x4e00-\x9fa5]/ig)) {
										len += 2;
									} else {
										len++;
									}
								}
								if(len > 16) {
									failed(field, '名号不能长于8个汉字长度（或16个英文字符）');
									$.verification.verifyFailed(field);
								} else {
									success(field);
									$.verification.verifySuccess(field);
								}
							},
							checkCity: function(field) {
								$.get('/home/setting.php/checkCity', {
									city: $.trim(field.val())
								}, function(data) {
									if(data) {
										failed(field, '居住城市填写不正确');
										$.verification.verifyFailed(field);
									} else {
										success(field);
										$.verification.verifySuccess(field);
									}
								});
							}
						},
						success: function(field) {
							success(field);
						},
						failed: function(field, message) {
							failed(field, message);
						}
					});

				$('[name="birthday"]', '#_j_form').datepicker({
					endDate: new Date()
				}).on('changeDate', function() {
					$('#_j_form').verification('verifyField', $(this));
					$(this).datepicker('hide');
				});
			});
		</script>
		
		<%@include file="../common/footer.jsp"%>

</html>