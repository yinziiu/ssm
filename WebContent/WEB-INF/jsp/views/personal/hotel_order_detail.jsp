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
		<title>酒店订单详情</title>
		<link href="${path}/style/view_order_detail/view_order_detail1.css" rel="stylesheet" />
		<link href="${path}/style/hotel_order_detail/hotel_order_detail1.css" rel="stylesheet" />
		<link href="${path}/style/hotel_order_detail/hotel_order_detail2.css" rel="stylesheet" />
		<link href="${path}/style/hotel_order_detail/hotel_order_detail3.css" rel="stylesheet" />
		<script src="${path}/style/js/jquery/2.0.0/jquery.min.js" type="text/javascript"></script>
		<script src="${path}/style/hotel_order_detail/hotel_order_detail1.js" type="text/javascript"></script>
		<script src="${path}/style/hotel_order_detail/hotel_order_detail2.js" type="text/javascript"></script>
		<script src="${path}/style/hotel_order_detail/hotel_order_detail3.js" type="text/javascript"></script>
	</head>

	<body style="position: relative;">
		<%@include file="../common/head.jsp"%>
		<div class="wrapper">
			<div class="content">
				<br><br>
				<div class="hd">
					<a href="${path }/web/index">首页</a><em>&gt;</em>头像<em>&gt;</em><a href="${path }/web/myhotelorder?id=${user.id}">酒店订单</a><em>&gt;</em>订单详情
				</div>
				
				<div class="bd clearfix">
				<c:forEach items="${hotelOrders }" var="list">
					<div class="article">
						<div class="carry-out" style="width: 598px;">
							<h3>
                                                                                 订单编号：${list.hordernum }
                                <span class="pre_process pre_process1">
                                	[ ${list.status } ]
                                </span>
                            </h3>
							<p class="hotel-phone">酒店电话：${list.phone }</p>

						</div>
						<!-- 酒店信息 S -->
						<div class="hotel-panel">
							<div class="img">
								<a class="pro-img" href="${path }/web/hotel_detail?id=${list.id}" target="_blank">
									<c:choose>
										<c:when test="${list.hphoto==null || list.hphoto =='' }">
											<img width="242px" height="242px" src="${path}/images/icon/view.jpg" alt="${list.hname }">
										</c:when>
										<c:otherwise>
											<img src="${path}${list.hphoto }" alt="${list.hname }" />
										</c:otherwise>
									</c:choose>
								</a>
							</div>
							<div class="info">
								<a href="${path }/web/hotel_detail?id=${list.id}">
									<h2>${list.hname }</h2>
								</a>
								<p class="hotel-address">地址：${list.address } </p>
							</div>
							<div class="extra">
								<div class="item" >
									<div class="t">${list.checkintime }</div>
									<div class="m">入住</div>
								</div>
								<div class="item">
									<div class="t">${list.checkouttime }</div>
									<div class="m">离店</div>
								</div>
								<div class="item">
									<div class="t">共</div>
									<div class="m">${daysBetween }晚</div>
								</div>
							</div>
						</div>
						<!-- 酒店信息 E -->
						<div class="con" style="width: 648px;">
							<div class="con1 row" id="disappear">
								<div class="th">联系人信息
									<div style="position:absolute;top:50%;margin-top:-14px;right:10px;display: inline-block;" id="email_info" >
									</div>
								</div>
								<div class="bd">
									<dl class="clearfix">
										<dt>联系人姓名:</dt>
										<dd>${list.relationname }</dd>
									</dl>
									<dl class="last-bot clearfix">
										<dt>联系人手机:</dt>
										<dd>${list.relationphone }</dd>
									</dl>
								</div>
							</div>
							
							<div class="con1 con2">
								<div class="th">客房信息</div>
								<div class="bd">
									<dl class="clearfix">
										<dt>客房:</dt>
										<dd>${list.htype }房型  x  ${list.roomnum }客房 x ${daysBetween }晚</dd>
									</dl>
									<dl class="clearfix">
										<dt>可入住人数:</dt>
										<dd>${list.hnum }成人</dd>
									</dl>
								</div>
							</div>
						</div>

						<div class="art_tips">
							<div class="th">入住须知</div>
							<div class="tips_detail">
								<div class="tips_detail1">
									<p><b>出行提示</b><br></p>
									<ul>
										<li>持身份证的中国居民; 中国大陆客人专享。</li>
									</ul>
									<p></p>
								</div>
							</div>
						</div>
					</div>

					<div class="order-side">
						<div class="expense-detail">
							<div class="hd">预订费用明细</div>
							<ul class="bd">

								<li>${list.roomnum }间客房 x ${daysBetween }晚
									<span class="price">￥${price }</span>
								</li>

								<li class="total-num">总价(含税) :<span class="price price-minus">￥${list.hprice }</span></li>
							</ul>
						</div>
						<div class="state danger">此预订不可取消和变更</div>
						<div class="continue">如需继续预订，请点击<span><a href="${path }/web/hotel_detail?id=${list.id}" style="color: #666;">这里</a></span></div>
					</div>
					</c:forEach>
				</div>
			</div>
		</div>
		<br /><br />
		<%@include file="../common/footer.jsp"%>
	</body>

</html>