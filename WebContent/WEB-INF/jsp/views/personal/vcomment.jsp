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
		<title>景点点评</title>
		<link href="${path}/style/comment/comment1.css" rel="stylesheet" />
		<link href="${path}/style/comment/comment2.css" rel="stylesheet" />
		<script src="${path}/style/js/jquery/2.0.0/jquery.min.js" type="text/javascript"></script>
		<script src="${path}/style/common/js/BrowserState.js" type="text/javascript"></script>
		<script src="${path}/style/comment/comment1.js" type="text/javascript"></script>
		<script src="${path}/style/comment/comment2.js" type="text/javascript"></script>
		<style type="text/css">
		
			body{
				background: url("${path}/images/icon/ban.jpg");
				margin: 0 auto;
				background-size: 100% 100%;
			}
			.main{
				margin-top: -48px;
			}
		</style>
	</head>

	<body style="position: relative;">
		
		<%@include file="../common/head1.jsp"%>
		
		<div class="container">
			<div class="banner">
				<div class="banner_img banner_extra" id="_j_banner">
					<img alt="banner" src="${path}/images/icon/ban3.jpg" width="100%" height="260px">
				</div>
				<div class="tags_bar second_tags_bar">
					<div class="center clearfix">
						<div class="MAvatar clearfix">
							<div class="MAvaImg flt1">
								<a href="${path }/web/useravatar">
									<c:choose>
										<c:when test="${user.photo==null || user.photo =='' }">
											<img src="${path}/images/icon/1.jpeg" height="120" width="120" alt="${user.username }">
										</c:when>
										<c:otherwise>
											<img src="${path}${user.photo }" height="120" width="120" alt="${user.username }" />
										</c:otherwise>
									</c:choose>
								</a>
							</div>
							<div class="MAvaEasyWord flt1">
								<span class="MAvaName">${user.username }</span>
							</div>
						</div>
						<ul class="flt2">
							<li>
								<a class="tags_link" href="${path }/web/personal?id=${user.id}" title="我的窝">我的窝</a>
							</li>
							<li>
								<a class="tags_link" href="${path }/web/mynotes?id=${user.id}" title="我的游记">我的游记</a>
							</li>
							<li>
								<a class="tags_link" href="${path }/web/myvieworder?id=${user.id}" title="景点订单">门票订单</a>
							</li>
							<li >
								<a class="tags_link" href="${path }/web/myhotelorder?id=${user.id}" title="景点订单">酒店订单</a>
							</li>
							<li class="on">
								<a class="tags_link" href="${path }/web/myvcomment?id=${user.id}" title="景点点评">景点点评</a>
							</li>
							<li>
								<a class="tags_link" href="${path }/web/myhcomment?id=${user.id}" title="酒店点评">酒店点评</a>
							</li>
							<li>
								<a class="tags_link" href="${path }/web/myfcomment?id=${user.id}" title="美食点评">美食点评</a>
							</li>
						</ul>
					</div>
				</div>
			</div>

			<div class="wrapper">
				<div class="line-nav line-time" style="margin-top:210px" id="_j_sidenav">
					<dl class="nav-group nav-sort _j_navitem on" >
						<dt><a><strong>按时间排序</strong><i></i></a></dt>
					</dl>
				</div>
				<div class="line-main">
					<div class="reviews-list">
						<div id="_j_poilist">
						<c:forEach items="${viewComments }" var="list">
							<div class="poi-item  have _j_poiitem _j_poiitem_5429128 _j_commentitem_190312744" >
								<span class="cover">
						        	<a href="${path }/web/view_detail?vid=${list.id}" target="_blank">
						        		<c:choose>
											<c:when test="${list.viewphoto==null || list.viewphoto =='' }">
												<img src="${path}/images/icon/view.jpg" height="120" width="120" alt="${list.vname }">
											</c:when>
											<c:otherwise>
												<img src="${path}${list.viewphoto }" height="120" width="120" alt="${list.vname  }" />
											</c:otherwise>
										</c:choose>
						        	</a>
						         </span>
								<div class="poi-detail">
									<h3 class="title">
										<a href="${path }/web/view_detail?vid=${list.id}" target="_blank">${list.vname }</a>
									</h3>
									<div class="poi-rev _j_comment">
										${list.vcomment }
									</div>
									<div class="poi-photo" >
										<a href="${path }/web/view_detail?vid=${list.id}">
											<c:choose>
												<c:when test="${list.vphoto==null || list.vphoto =='' }">
													<img class="_j_poi_photo" src="${path}/images/icon/view.jpg" width="100px" height="100px">
												</c:when>
												<c:otherwise>
													<img class="_j_poi_photo" src="${path}${list.vphoto }" width="100px" height="100px" />
												</c:otherwise>
											</c:choose>
										</a>
									</div>
								</div>
								<div class="poi-btns">
									<span class="time">${list.vcommenttime }</span> </div>
								</div>
							</c:forEach>
						</div>
					</div>
				</div>
			</div>
		</div>
		<%@include file="../common/footer.jsp"%>
	</body>
</html>