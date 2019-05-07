<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set value="${pageContext.request.contextPath}" var="path" scope="page"/>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<script type="text/javascript">
    var path = "${path}";
</script>
<html class=" hasFontSmoothing-true">

	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>贺州酒店推荐</title>		
		<link href="${path}/style/hotel/hotel1.css" rel="stylesheet" />
		<link href="${path}/style/hotel/hotel2.css" rel="stylesheet" />
		<link href="${path}/style/hotel/hotel3.css" rel="stylesheet" />
		<link href="${path}/style/hotel/hotel4.css" rel="stylesheet" />
		<link href="${path}/style/hotel/captcha.css" rel="stylesheet" />
		<link href="${path}/style/hotel/place-crumb.css" rel="stylesheet" />
		<link href="${path}/style/hotel/style1536672475627.css" rel="stylesheet" />
		<link href="${path}/style/hotel/dialog.css" rel="stylesheet" />
		<script src="${path}/style/js/jquery/2.0.0/jquery.min.js" type="text/javascript"></script>
		<script src="${path}/style/common/js/BrowserState.js" type="text/javascript"></script>
		<script src="${path}/style/hotel/jquery-ui-1.11.0.min.js" type="text/javascript"></script>
		<script src="${path}/style/hotel/underscore-1.6.0.jss" type="text/javascript"></script>	
		<script src="${path}/style/hotel/index.js" type="text/javascript"></script>
		<script src="${path}/style/hotel/hotel1.js" type="text/javascript"></script>
		<script src="${path}/style/hotel/hotel2.js" type="text/javascript"></script>
		<script src="${path}/style/hotel/hotel3.js" type="text/javascript"></script>
		<script src="${path}/style/hotel/hotel4.js" type="text/javascript"></script>
		<script src="${path}/style/hotel/MouseTip.js" type="text/javascript"></script>
		
		<style type="text/css">
			.search{
				border: 1px solid ghostwhite;
				
			}
			.search input {
				border: none;
				background-color: white;
			}
		
		</style>
		

	</head>

	<body style="position: relative;">
	
		<%@include file="../common/head.jsp"%>
		<div class="wrapper">
			<br><br>
			<div class="hotel-sortbar clearfix">
				<div class="sortbar-info">
					<div class="total" id="_j_total_text"><span>${listTotal }</span> 家酒店</div>
					<div class="htb-search" id="_j_keyword_filter">
						<div class="search">
							<form action="" method="post">
								<input type="text" placeholder="搜索关键词">
								<input type="submit" value="搜索"/>
							</form>
						</div>
					</div>
				</div>
				<div class="sortbar-nav" id="_j_sorter">
					<a href="javascript:;" data-type="comment" class="on">浏览排序</a>
				</div>
			</div>

			<div class="n-content">
				<div class="hotel-list" id="_j_hotel_list">
					<c:forEach items="${hotelList }" var="list">
					<div class="hotel-item clearfix _j_hotel_item"  >
							<div class="hotel-pic">
								<a href="${path }/web/hotel_detail?hid=${list.id}" class="_j_hotel_info_link" target="_blank" data-cs-p="图片">
									<c:choose>
										<c:when test="${list.hphoto==null || list.hphoto =='' }">
											<img alt="${list.hname }" style="width: 330px;" height="230px"
												src="${path}/images/icon/hotel.jpg">
										</c:when>
										<c:otherwise>
											<img alt="${list.hname }" style="width: 330px;" height="230px"
												src="${path}${list.hphoto }" />
										</c:otherwise>
									</c:choose>
								</a>
							</div>
							<div class="hotel-title">
								<div class="title">
									<h3><a href="${path }/web/hotel_detail?hid=${list.id}" class="_j_hotel_info_link" target="_blank" title="" data-cs-p="标题">${list.hname }</a></h3>
									<a href="" target="_blank"><i class="icon-bird"></i></a>
									<br>
									<span class="hotel-rate rate2" style="margin-left:0;"></span>
								</div>
							</div>
							<div class="hotel-info ">
								<div style="overflow: hidden; text-overflow: ellipsis; display: -webkit-box; -webkit-line-clamp: 3; -webkit-box-orient: vertical;">
									<p class="summary" title="">${list.hotelintro }</p>
								</div>
								<div class="location">
									<span title="">地址:&nbsp;&nbsp;${list.address }</span>
								</div>
	
							</div>
							<div class="hotel-btns">
								<a class="btn-booking _j_booking_btn" href="${path }/web/hotel_detail?hid=${list.id}" rel="nofollow" style="" data-ota="youyu_pkg">
									<div class="ota">
										<div class="name">
											<strong>价格</strong>
											<i class="icon-alipay" style=""></i>
											<i class="icon-wxpay" style=""></i>
										</div>
										<p class="tips" style="display:none;"></p>
									</div>
									<div class="price _j_booking_price">
										<strong>￥</strong><strong>${list.lowprice }</strong><strong style="font-size: 12px;color: #666;padding-left: 2px;vertical-align: 1px;">起</strong>
										<i class="arrow"></i>
									</div>
								</a>
							</div>
						</div>
						</c:forEach>
					</div>
					<div class="page-hotel" align="right" id="list_paginator" rel="nofollow">
						<span class="count">共<span>${page.pages }</span>页 / <span>${page.total }</span>条</span>
						<a class="ti _j_pageitem prev" <c:if test="${page.pageNum != page.firstPage}"> href=${paht}/web/hotel?currentPage=${page.pageNum - 1 }"</c:if> <c:if test="${page.pageNum == page.firstPage}"> href="javascript:void(0)" class="disabled"</c:if>  title="前一页">前一页</a>
						 <c:forEach begin="1" end="${page.pages }" varStatus="status">
							<a class="ti _j_pageitem" href="${path}/web/hotel?currentPage=${status.count }" <c:if test="${status.count == page.pageNum}">class="select"</c:if>>${status.count }</a>
						</c:forEach>
						<a class="ti _j_pageitem prev" <c:if test="${page.pageNum == page.lastPage}">class="disabled" href="javascript:void(0)"</c:if> <c:if test="${page.pageNum != page.lastPage}">href="${path}/web/hotel?currentPage=${page.pageNum + 1 }"</c:if>   title="后一页">后一页</a>
					</div>
				</div>
			</div>


		<%@include file="../common/footer.jsp"%>
	</body>

</html>