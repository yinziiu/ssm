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
		<title>酒店详情</title>
		<link href="${path}/style/hotel_detail/hotel_detail1.css" rel="stylesheet" />
		<link href="${path}/style/hotel_detail/hotel_detail2.css" rel="stylesheet" />
		<link href="${path}/style/hotel_detail/hotel_detail3.css" rel="stylesheet" />
		<link href="${path}/style/hotel_detail/hotel_detail4.css" rel="stylesheet" />
		<link href="${path}/style/hotel_detail/littleWeather.css" rel="stylesheet" />
		<link href="${path}/style/hotel_detail/style1536672475627.css" rel="stylesheet" />
		<script src="${path}/style/js/jquery/2.0.0/jquery.min.js" type="text/javascript"></script>
		<script src="${path}/style/common/js/BrowserState.js" type="text/javascript"></script>
		<script src="${path}/style/hotel_detail/hotel_detail1.js" type="text/javascript"></script>
		<script src="${path}/style/hotel_detail/hotel_detail2.js" type="text/javascript"></script>
		<script src="${path}/style/hotel_detail/index.js" type="text/javascript"></script>
	</head>

	<body style="position: relative;">
	
		<%@include file="../common/head.jsp"%>
		<div class="container">
			<div class="top-info clearfix" id="_j_crumb">
				<div class="crumb">
					<span class="tit">您在这里：</span>
					<div class="item">
						<div class="drop">
							<span class="hd"><a href="${path}/web/hotel" target="_blank">酒店</a></span>
						</div>
						<em>&gt;</em>
					</div>
					<div class="item">
						<div class="drop">
							<span class="hd">
								<a href="" target="_blank" title="中国酒店预订">酒店详情</a>
							</span>
						</div>
					</div>
				</div>

			</div>
			<div class="hotel-intro">
			<c:forEach items="${hotelList }" var="list">
				<div class="intro-hd">
					<div class="main-title">
						<h1>${list.hname }</h1>
						<i class="icon-bg icon-bird _j_icon_bird"></i>
					</div>
					<div class="en-title"><span>${list.hreadnum }人浏览</span> </div>
					<div class="location"><span>地址：${list.address }</span></div>
				</div>

				<div class="intro-bd clearfix">
					<div class="img-big ">
						<c:choose>
							<c:when test="${list.hphoto==null || list.hphoto =='' }">
								<img alt="${list.hname }" src="${path}/images/icon/hotel.jpg">
							</c:when>
							<c:otherwise>
								<img alt="${list.hname }" src="${path}${list.hphoto }" />
							</c:otherwise>
						</c:choose>
					</div>
					<ul class="img-small">
						<li>
							<c:choose>
								<c:when test="${list.hphoto==null || list.hphoto =='' }">
									<img alt="${list.hname }" src="${path}/images/icon/hotel.jpg">
								</c:when>
								<c:otherwise>
									<img alt="${list.hname }" src="${path}${list.hphoto }" />
								</c:otherwise>
							</c:choose>
						</li>
						<li>
							<c:choose>
								<c:when test="${list.hphoto==null || list.hphoto =='' }">
									<img alt="${list.hname }" src="${path}/images/icon/hotel.jpg">
								</c:when>
								<c:otherwise>
									<img alt="${list.hname }" src="${path}${list.hphoto }" />
								</c:otherwise>
							</c:choose>
						</li>
						<li>
							<c:choose>
								<c:when test="${list.hphoto==null || list.hphoto =='' }">
									<img alt="${list.hname }" src="${path}/images/icon/hotel.jpg">
								</c:when>
								<c:otherwise>
									<img alt="${list.hname }" src="${path}${list.hphoto }" />
								</c:otherwise>
							</c:choose>
						</li>
						<li>
							<c:choose>
								<c:when test="${list.hphoto==null || list.hphoto =='' }">
									<img alt="${list.hname }" src="${path}/images/icon/hotel.jpg">
								</c:when>
								<c:otherwise>
									<img alt="${list.hname }" src="${path}${list.hphoto }" />
								</c:otherwise>
							</c:choose>
						</li>
						<li>
							<c:choose>
								<c:when test="${list.hphoto==null || list.hphoto =='' }">
									<img alt="${list.hname }" src="${path}/images/icon/hotel.jpg">
								</c:when>
								<c:otherwise>
									<img alt="${list.hname }" src="${path}${list.hphoto }" />
								</c:otherwise>
							</c:choose>
						</li>
						<li>
							<c:choose>
								<c:when test="${list.hphoto==null || list.hphoto =='' }">
									<img alt="${list.hname }" src="${path}/images/icon/hotel.jpg">
								</c:when>
								<c:otherwise>
									<img alt="${list.hname }" src="${path}${list.hphoto }" />
								</c:otherwise>
							</c:choose>
						</li>
					</ul>
				</div>
				</c:forEach>
			</div>
		</div>

		<div class="hotel-navbar">
			<div class="navbar-content clearfix">
				<ul class="nav">
					<li class="on" data-type="bookingInfo">
						<a href="javascript:;">预订</a>
					</li>
				</ul>
			</div>
		</div>

		<div class="container">
			<div class="hotel-booking row-bg" id="_j_booking_date">
				
				<div class="room-table" id="_j_booking_info">
					<ul class="thd" style="transform: translateY(0px);">
						<li class="td-room">房型</li>
						<li class="td-person">人数上限</li>
						<li class="td-policy">相关政策</li>
						<li class="td-price">价格
							<span class="not-tax" id="lbTaxInfo"></span>
						</li>
					</ul>
					<div id="box_room_list" class="ota_room_box" data-ota="" style="display: block;">
					<c:forEach items="${hotelRooms }" var="list">
						<div class="row-item clearfix" data-type_name="${list.htype }" >
							
							<div class="td-room">
								<div class="room-name">${list.htype }</div>
								<div class="room-img" style="overflow:hidden;width:220px;height:132px;">
									<c:choose>
										<c:when test="${list.roomphoto==null || list.roomphoto =='' }">
											<img  alt="${list.htype }" src="${path}/images/icon/hotel.jpg" width="220px" height="130px">
										</c:when>
										<c:otherwise>
											<img alt="${list.htype }" src="${path}${list.roomphoto }" width="220px" height="130px"/>
										</c:otherwise>
									</c:choose>
								</div>
							</div>
							<div class="sub-group clearfix">
								<div class="td-person">
									<div><i class="icon-bg icon-person icon-p2"></i> ${list.hnum }住客</div>
								</div>
								<ul class="td-policy">
									<li class="c-red">不可取消和变更</li>
									<li>二次确认</li>
									<li>持身份证的中国居民</li>
								</ul>
								<div class="td-price"><strong>￥${list.hprice }</strong><strong style="font-size: 12px; font-style: normal;font-weight: normal; display: inline-block; margin-left: 5px; vertical-align: 1px;">(已含税)</strong></div>
								<c:if test="${dbuser!=null }">
									<div class="td-action">
										<a class="btn-action btn_booking"  href="${path }/web/hotel_order?id=${list.id}">预订</a>
									</div>
								</c:if>
								<c:if test="${dbuser==null }">
									<div class="td-action">
										<a class="btn-action btn_booking"  href="${path }/web/login">登录</a>
									</div>
								</c:if>
							</div>
						</div>
					</c:forEach>
					</div>
				</div>
			</div>
		</div>
			
		<div class="hotel-navbar">
			<div class="navbar-content clearfix">
				<ul class="nav">
					<li class="on" data-type="bookingInfo">
						<a href="javascript:;">详情</a>
					</li>
				</ul>
			</div>
		</div>
		
		<div class="container">
			<div class="hotel-info" id="_j_hotel_info">
				<div class="info-section">
				<c:if test="${! empty hotelInfos }">
					<dl class="clearfix">
						<dt>基本信息</dt>
					<c:forEach items="${hotelInfos }" var="list">
						<dd class="clearfix" id="_j_hotel_base_info_container">
							<div class="cell">
								<span class="label">入住时间: </span>
								<span class="content"><strong>${list.checkintime }</strong>之后</span>
							</div>
							<div class="cell">
								<span class="label">离店时间: </span>
								<span class="content"><strong>${list.checkouttime }</strong>之前</span>
							</div>
							<div class="cell">
								<span class="label">建成于: </span>
								<span class="content"><strong>${list.activate }</strong>年</span>
							</div>
							<div class="cell">
								<span class="label">酒店规模: </span>
								<span class="content"><strong>${list.scale }</strong>间客房</span>
							</div>
						</dd>
					</c:forEach>
					</dl>
				</c:if>
				</div>
				
				
				<div class="info-section">
					<div class="expand-wrap" id="_j_facility_info" style="height: auto;">
						<c:if test="${! empty hotelService1s }">
							<dl class="clearfix">
								<dt>酒店服务</dt>
								<dd>
									<ul class="facility-item clearfix">
										<c:forEach items="${hotelService1s }" var="list">
											<li>${list.name }</li>
										</c:forEach>
									</ul>
								</dd>
							</dl>
						</c:if>
						<c:if test="${! empty hotelFacs }">
							<dl class="clearfix">
								<dt>酒店设施</dt>
								<dd>
									<ul class="facility-item clearfix">
										<c:forEach items="${hotelFacs }" var="list">
											<li>${list.name }</li>
										</c:forEach>
									</ul>
								</dd>
							</dl>
						</c:if>
						<c:if test="${! empty hRoomInfos }">
							<dl class="clearfix">
								<dt>房间设施</dt>
								<dd>
									<ul class="facility-item clearfix">
										<c:forEach items="${hRoomInfos }" var="list">
											<li>${list.name }</li>
										</c:forEach>
									</ul>
								</dd>
							</dl>
						</c:if>
					</div>
				</div>
				<div class="info-section">
					<div class="expand-wrap" id="_j_description" style="height: auto;">
						<dl class="clearfix">
							<dt>酒店攻略</dt>
							<c:forEach items="${hotelStories }" var="list">
							<dd>
								${list.gushi }
							</dd>
							</c:forEach>
						</dl>
					</div>
				</div>
			</div>
		</div>
		
		<div class="hotel-navbar" id="hotelcomment">
			<div class="navbar-content clearfix">
				<ul class="nav">
					<li class="on" data-type="bookingInfo">
						<a href="javascript:;">点评</a>
					</li>
				</ul>
			</div>
		</div>
		
		<div class="container">
			<div class="hotel-comment" id="_j_comment" data-cs-t="酒店详情页">
				<div class="comm-bar">
					<ul class="comm-tab">
						<li class="on">
							<a class="_j_comment_type" href="javascript:;">全部点评${listTotal }条</a>
						</li>
					</ul>
					<a class="btn-add" href="javascript:;" >写点评</a>
				</div>

				<div class="comm-list sign-font-family" id="_j_comment_list">
				<c:forEach items="${hotelComments }" var="list">
					<div class="comm-item _j_comment_item">
						<div class="user">
							<a class="avatar" href="">
								<c:choose>
									<c:when test="${list.photo==null || list.photo =='' }">
										<img alt="${list.username }" src="${path}/images/icon/1.jpeg">
									</c:when>
									<c:otherwise>
										<img alt="${list.username }" src="${list.photo }" />
									</c:otherwise>
								</c:choose>
							</a>
							<a class="name" href="">${list.username }</a>
							<br>
							<div class="prop clearfix">

							</div>
						</div>
						<div class="txt">
							${list.hcomment }
						</div>
						<div class="img clearfix">
							<a href="javascript:;" class="_j_album_comment_trigger" >
								<c:choose>
									<c:when test="${list.hcphoto==null || list.hcphoto =='' }">
										<img alt="${list.hname }" src="${path}/images/icon/hotel.jpg">
									</c:when>
									<c:otherwise>
										<img alt="${list.hname }" src="${path}${list.hcphoto }" />
									</c:otherwise>
								</c:choose>
							</a>
						</div>
						<div class="comm-meta">
							<span class="time">${list.hcommenttime }</span>
						</div>
					</div>
					</c:forEach>
				</div>
				
				<div class="m-pagination" id="_j_comment_pagination" style="">
					<span class="count">共<span>${page.pages }</span>页 / <span>${page.total }</span>条</span>
					<a class="pg-next _j_pageitem" <c:if test="${page.pageNum != page.firstPage}"> href=${paht}/web/hotel_detail?currentPage=${page.pageNum - 1 }&&hid=${hid}&&#hotelcomment"</c:if> <c:if test="${page.pageNum == page.firstPage}"> href="javascript:void(0)" class="disabled"</c:if>  title="前一页">前一页</a>
					 <c:forEach begin="1" end="${page.pages }" varStatus="status">
						<a class="pi _j_pageitem" href="${path}/web/hotel_detail?currentPage=${status.count }&&hid=${hid}&&#hotelcomment" <c:if test="${status.count == page.pageNum}">class="select"</c:if>>${status.count }</a>
					</c:forEach>
					<a class="pg-next _j_pageitem" <c:if test="${page.pageNum == page.lastPage}">class="disabled" href="javascript:void(0)"</c:if> <c:if test="${page.pageNum != page.lastPage}">href="${path}/web/hotel_detail?currentPage=${page.pageNum + 1 }&&hid=${hid}&&#hotelcomment"</c:if>   title="后一页">后一页</a>
				</div>
				
			</div>
		</div>
		
		<%@include file="../common/footer.jsp"%>
	</body>

</html>