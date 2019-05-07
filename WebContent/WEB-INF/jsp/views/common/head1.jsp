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
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<link href="${path}/style/common/css/head.css" rel="stylesheet" />
	</head>

	<body style="position: relative;">
		<div class="topBar">
			<div class="topBarC">
				<div class="t_nav">
					<ul id="pnl_nav">
						<li>
							<strong class="t"><a href="${path}/web/index">首页</a></strong>
						</li>
						<li>
							<strong class="t"><a href="${path}/web/view" title="景点">景点</a></strong>
						</li>
						<li>
							<strong class="t"><a href="${path}/web/shop" title="门票">门票</a></strong>
						</li>
						<li>
							<strong class="t"><a href="${path}/web/strategy" title="攻略">攻略</a></strong>
						</li>
						<li>
							<strong class="t"><a href="${path}/web/hotel" title="酒店">酒店</a></strong>
						</li>
						<li>
							<strong class="t"><a href="${path}/web/food" title="美食">美食</a></strong>
						</li>
						<li>
							<strong class="t"><a href="${path}/web/notes" title="游记">游记</a></strong>
						</li>
					</ul>
				</div>
				<c:if test="${dbuser!=null }">
					<div class="t_info">
						<div  class="pagelet-block">
							<ul class="user_info">
								<li class="account _j_hoverclass" >
									<span class="t">
										<a class="infoItem" href="${path }/web/personal?id=${dbuser.id }">
											<c:choose>
												<c:when test="${dbuser.photo==null || dbuser.photo =='' }">
													<img align="absmiddle" src="${path}/images/icon/1.jpeg" width="32" height="32" alt="${dbuser.username }">
												</c:when>
												<c:otherwise>
													<img align="absmiddle" src="${path}${dbuser.photo }" width="32" height="32" alt="${dbuser.username }" />
												</c:otherwise>
											</c:choose>
										</a>
									</span>
								</li>
								<li id="pnl_user_msg"  class="msg _j_hoverclass">
									<span id="oldmsg" class="oldmsg">
										<a href="${path }/web/userinfo" class="infoItem">个人中心</a>
									</span>
								</li>
								<li id="pnl_user_msg"  class="msg _j_hoverclass">
									<span id="oldmsg" class="oldmsg">
										<a href="${path }/logout" class="infoItem">【注销】</a>
									</span>
								</li>
							</ul>
						</div>
					</div>
				</c:if>
			</div>
		</div>
	</body>
</html>