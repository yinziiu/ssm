<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set value="${pageContext.request.contextPath}" var="path" scope="page"/>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<script type="text/javascript">
    var path = "${path}";
</script>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>贺州美食</title>
		<link href="${path}/style/cate/1.css" rel="stylesheet" />
		<link href="${path}/style/cate/2.css" rel="stylesheet" />
		<link href="${path}/style/cate/place-crumb.css" rel="stylesheet" />
		<link href="${path}/style/cate/poi-list.css" rel="stylesheet" />
		<script src="${path}/style/js/jquery/2.0.0/jquery.min.js" type="text/javascript"></script>
		<script src="${path}/style/common/js/BrowserState.js" type="text/javascript"></script>
		<script src="${path}/style/cate/jquery.mfwSlide.js" type="text/javascript"></script>
		<script src="${path}/style/cate/cate1.js" type="text/javascript"></script>
		<script src="${path}/style/cate/cate2.js" type="text/javascript"></script>
		<script src="${path}/style/cate/cate3.js" type="text/javascript"></script>
		
		
		<style type="text/css">
			/* .search{
				border: 1px solid ghostwhite;
				
			}
			.search input {
				border: none;
				background-color: white;
			} */
		
		</style>
		
		<!--排行榜切换动态-->
		<script language="javascript" type="text/javascript">
			$(function() {
				$('.rank-item').hover(function() {
					$(this).addClass('on');
				}, function() {
					if(!$(this).hasClass('always_show')) {
						$(this).removeClass('on');
					}
				});
				$('.m-sideInfo').hover(function() {
					$('.sg-list').fadeIn();
				}, function() {
					$('.sg-list').fadeOut();
				});
			});
		</script>
		
	</head>

	<body style="position: relative;">
	
		<%@include file="../common/head.jsp"%>
		
		<div class="wrapper">
			<div class="aside" data-cs-t="目的地美食列表页攻略">
				<div class="m-box m-sideInfo">
					<h2 class="hd">贺州美食攻略</h2>
				</div>
				<div class="m-box m-rankList">
					<h2 class="hd"><i></i><a href="#">贺州特色美食排行</a></h2>
					<div class="bd">
						<ol class="list-rank">
							<c:forEach items="${foods }" var="list">
							<li class="rank-item top3">
								<a href="${path }/web/food_detail?fid=${list.id}" title="${list.fname }">
									<span class="r-img">
										<c:choose>
											<c:when test="${list.fphoto==null || list.fphoto =='' }">
												<img alt="${list.fname }" width="110" height="70"
													src="${path}/images/icon/food.jpg">
											</c:when>
											<c:otherwise>
												<img alt="${list.fname }" width="110" height="70"
													src="${path}${list.fphoto }" />
											</c:otherwise>
										</c:choose>
									</span>
									<h3>${list.fname }</h3>
									<span class="trend"><i></i>${list.freadnum }</span>
								</a>
							</li>
							</c:forEach>
						</ol>
					</div>
				</div>
			</div>

			<div class="content">
				<div class="m-slide">
					<ul class="s-img">
						<li>
							<a href="" target="_blank">
								<img src="${path }/images/icon/meishi.jpg" width="680" height="320" />
								<div class="mask">
									<p>“民以食为天”，随着回归自然食品的兴起，传统美食越来越受到人们的青睐</p>
								</div>
							</a>
						</li>
					</ul>
				</div>

				<div class="m-recList">
					<div class="hd">
						<i class="icon-repast"></i>
						<h1>贺州全部美食推荐</h1>
						<div class="hd-extra">
							<div class="sort">
								<ul>
									<li class="on">
										<a href="">按浏览</a>
									</li>
								</ul>
							</div>
						</div>
					</div>
					<hr>
					<div class="bd">
						<ul class="poi-list">
						<c:forEach items="${foodList }" var="list">
							<li class="item clearfix">
								<span class="img">
		                    		<a href="${path }/web/food_detail?fid=${list.id}" target="_blank">
		                    			<c:choose>
											<c:when test="${list.fphoto==null || list.fphoto =='' }">
												<img alt="${list.fname }" width="215" height="145"
													src="${path}/images/icon/food.jpg">
											</c:when>
											<c:otherwise>
												<img alt="${list.fname }" width="215" height="145"
													src="${path}${list.fphoto }" />
											</c:otherwise>
										</c:choose>
		                    		</a>
                            	</span>
								<div class="title">
									<h3>
										<a href="${path }/web/food_detail?fid=${list.id}" target="_blank">${list.fname }</a>
                                	</h3>
								</div>
								<div class="rev-info">
									简介：
									<div class="rev-txt">
										<div style="overflow: hidden; text-overflow: ellipsis; display: -webkit-box; -webkit-line-clamp: 2; -webkit-box-orient: vertical;">
											<p>“${list.fcontent }”</p>
										</div>
									</div>
								</div>
								<br>
								<div class="">
									<p class="rev-num">地址：&nbsp;${list.address }</p>
								</div>
							</li>
							</c:forEach>
						</ul>
						<div align="right" class="page-hotel">
							<span class="count">共<span>${page.pages }</span>页 / <span>${page.total }</span>条</span>
							<a class="ti last" <c:if test="${page.pageNum != page.firstPage}"> href=${paht}/web/food?currentPage=${page.pageNum - 1 }"</c:if> <c:if test="${page.pageNum == page.firstPage}"> href="javascript:void(0)" class="disabled"</c:if>  title="前一页">前一页</a>
							 <c:forEach begin="1" end="${page.pages }" varStatus="status">
								<a class="ti" href="${path}/web/food?currentPage=${status.count }" <c:if test="${status.count == page.pageNum}">class="select"</c:if>>${status.count }</a>
							</c:forEach>
							<a class="ti last" <c:if test="${page.pageNum == page.lastPage}">class="disabled" href="javascript:void(0)"</c:if> <c:if test="${page.pageNum != page.lastPage}">href="${path}/web/food?currentPage=${page.pageNum + 1 }"</c:if>   title="后一页">后一页</a>
						</div>
					</div>
				</div>
			</div>
		</div>
		
		<%@include file="../common/footer.jsp"%>

	</body>

</html>