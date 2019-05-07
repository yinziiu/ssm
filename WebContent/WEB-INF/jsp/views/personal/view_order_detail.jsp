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
		<title>门票订单详情</title>
		<link href="${path}/style/view_order_detail/order-detail.css" rel="stylesheet" />
		<link href="${path}/style/view_order_detail/view_order_detail1.css" rel="stylesheet" />
		<script src="${path}/style/js/jquery/2.0.0/jquery.min.js" type="text/javascript"></script>
		<script src="${path}/style/common/js/BrowserState.js" type="text/javascript"></script>
		<script src="${path}/style/view_order_detail/plugins.js" type="text/javascript"></script>
		<script src="${path}/style/view_order_detail/view_order_detail1.js" type="text/javascript"></script>
		<script src="${path}/style/view_order_detail/view_order_detail2.js" type="text/javascript"></script>
	</head>

	<body style="position: relative;">
	
		<%@include file="../common/head.jsp"%>
		
		<div class="wrapper">
			<div class="crumb">
				<a href="${path }/web/index">首页</a><em>&gt;</em>头像<em>&gt;</em><a href="${path }/web/myvieworder?id=${user.id}">景点订单</a><em>&gt;</em>订单详情
			</div>
			<c:forEach items="${viewOrders }" var="list">
			<div class="order-detail">
				<div class="status">
					<div class="t1">
						${list.status }
						<span style="font-size:14px;color:#767676;"></span>
					</div>
					<div class="t2">订单号<span class="m-l16">${list.ordernumber }</span>
					<span class="m-l30">下单时间</span><span class="m-l16">${list.booktime }</span> 
					</div>
					<div class="aside">
						<p>
							总金额<i>￥</i><strong>${list.tprice }</strong>
						</p>
						<div class="priceDetail">
							<a href="" class="price">价格明细</a>
							<!--pop-->
							<div class="tipFlot">
								<div class="corner"></div>
								<div class="box">
									<dl>
										<c:if test="${not empty list.tname }">
											<dt>${list.tname }</dt>
										</c:if>
										<dd>
											${list.vname }门票 ${list.ttype }
										</dd>
										<dd>
											门票
											<div class="rText">￥${price } x ${list.ordertotal }</div>
										</dd>
									</dl>
								</div>
							</div>
							<!--popEnd-->
						</div>
						<c:if test="${list.status eq '已关闭' }">
							<div class="btns">
								<a href="${path }/web/view_order?id=${list.id}&&vid=${list.vid}">重新购买</a>
							</div>
						</c:if>
						<c:if test="${list.status eq '待支付' }">
							<div class="btns">
								<a href="${path }/web/payViewOrder?id=${list.id}">去支付</a>
							</div>
						</c:if>
					</div>
				</div>

				<div class="items">
					<div class="hd">产品信息</div>
					<div class="item">
						<div class="title">
							<c:if test="${not empty list.tname }">
								<a href="" target="_blank">
									${list.tname }
								</a>
							</c:if>
						</div>
						<div class="desc">
							${list.vname }门票 ${list.ttype }
							<span class="m-l30">
                               	使用日期：${list.tratime }
                            </span>
						</div>
						<div class="btns">
						</div>
					</div>

					<div class="item">
						<div class="desc">
							<span class="tit">门票</span>￥${price } x ${list.ordertotal }
							<div class="rText">价格：<span class="orange">￥${list.tprice }</span></div>
						</div>
					</div>

				</div>

				<div class="pagelet-block"></div>

				<div class="items">
					<div class="hd">联系人信息</div>
					<div class="clearfix">
						<div class="userInfo w100">
							<p><span class="dt">姓名：</span>${list.bookname }</p>
							<p><span class="dt">联系电话：</span>${list.bookphone }</p>
							<p><span class="dt">备注：</span>${list.remark }</p>
						</div>
					</div>
				</div>
			</div>
		</c:forEach>
		</div>
		

		<div class="popup-box" style="display:none;">
			<a class="close-btn" href="javascript:void(0);" id="popup_close_1"><i></i></a>
			<div class="pop-ico">
				<i class="i2"></i>
			</div>
			<div class="pop-ctn">
				<p class="hd"></p>
				<p class="bd">来晚一步，被抢光了:(<br>三个工作日内，如有库存，客服会第一时间联系您！</p>
			</div>
			<div class="pop-btn">
				<input type="button" class="btn-sub" value=" 有货提醒我 " id="btn_notice_me">
				<input type="button" class="btn-esc" value=" 我不要了 " id="btn_cancel">
			</div>
		</div>

		<div  class="popup-box" style="display:none;">
			<a class="close-btn" href="javascript:void(0);" data-id="popup_close_2"><i></i></a>
			<div class="pop-ico">
				<i class="i2"></i>
			</div>
			<div class="pop-ctn">
				<p class="hd"></p>
				<p class="bd">您的库存需求已被记录在候补名单里，有货后会致电您！</p>
				<div class="pop-btn">
					<input type="button" class="btn-sub" value=" 确定 " data-id="popup_close_2">
				</div>
			</div>
		</div>


		<%@include file="../common/footer.jsp"%>
	</body>
</html>