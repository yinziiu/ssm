<%@page import="com.hz.model.User"%>
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
		<title>头部</title>
		<link href="${path}/style/common/css/mfw-toolbar.css" rel="stylesheet" />
		<script type="text/javascript">
			/* function addClass() {
				var class_li = $("#_j_head_nav li").attr("class");
				if(class_li == "head-nav-active"){
					$("#_j_head_nav li").removeAttr("class");
				}else{
					$("#_j_head_nav li").attr("class","head-nav-active");
				}
			} */
			
		</script>
	</head>

	<body>
		<div id="header">
			<div class="mfw-header">
				<div class="header-wrap clearfix">
					<ul class="head-nav" id="_j_head_nav">
						<li class="">
							<a href="${path}/web/index" onclick="addClass()">首页</a>
						</li>
						<li>
							<a href="${path}/web/view" title="景点" onclick="addClass()">景点</a>
						</li>
						<li>
							<a href="${path}/web/shop" title="门票" onclick="addClass()">门票</a>
						</li>
						<li>
							<a href="${path}/web/strategy" title="攻略" onclick="addClass()">攻略</a>
						</li>
						<li>
							<a href="${path}/web/hotel" title="酒店" onclick="addClass()">酒店</a>
						</li>
						<li>
							<a href="${path}/web/food" title="美食" onclick="addClass()">美食</a>
						</li>
						<li>
							<a href="${path}/web/notes" title="游记" onclick="addClass()">游记</a>
						</li>
					</ul>

					<c:if test="${dbuser==null }">
						<div class="data-pagelet">
							<div class="login-out">
								<a id="" title="登录" class="" href="${path}/web/login">登录</a>
								<span class="split">|</span>
								<a href="${path}/web/register" title="注册帐号" rel="nofollow">注册</a>
							</div>
						</div>
					</c:if>
					
					<%
						User user = (User) session.getAttribute("dbuser");
						System.out.print(user);
					%>

					<c:if test="${dbuser!=null }">
						<div class="pagelet-block" >
							<div class="login-info">
								<div class="head-msg" id="_j_head_msg">
									<a class="" href="${path }/logout" rel="nofollow">
										【注销】
									</a>
								</div>
								<div class="head-msg" id="_j_head_msg">
									<a class="" href="${path }/web/userinfo" rel="nofollow">
										个人中心
									</a>
								</div>
								<div class="head-user" id="_j_head_user">
									<a class="drop-trigger" href="${path }/web/personal?id=${dbuser.id }" title="${dbuser.username }" rel="nofollow">
										<div class="user-image">
											<c:choose>
												<c:when test="${dbuser.photo==null || dbuser.photo =='' }">
													<img src="${path}/images/icon/1.jpeg" height="32" width="32" alt="${dbuser.username }">
												</c:when>
												<c:otherwise>
													<img src="${path}${dbuser.photo }" height="32" width="32" alt="${dbuser.username }" />
												</c:otherwise>
											</c:choose>
										</div>
									</a>
								</div>
							</div>
						</div>
					</c:if>
				</div>
				<div class="shadow"></div>
			</div>
		</div>
	</body>

</html>