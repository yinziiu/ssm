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

		<title>住宿收银台</title>
		<meta name="renderer" content="webkit">
		<link href="${path}/style/hotel_order_pay/cashier_hotel.css" rel="stylesheet" />
		<link href="${path}/style/hotel_order_pay/hotel_order_pay1.css" rel="stylesheet" />
		<link href="${path}/style/hotel_order_pay/hotel_order_pay2.css" rel="stylesheet" />
		<script src="${path}/style/js/jquery/2.0.0/jquery.min.js" type="text/javascript"></script>
		<script src="${path}/style/hotel_order_pay/decimal.min.js" type="text/javascript"></script>
		<script src="${path}/style/hotel_order_pay/hotel_order_pay1.js" type="text/javascript"></script>
		<script src="${path}/style/hotel_order_pay/hotel_order_pay2.js" type="text/javascript"></script>
		<script src="${path}/style/hotel_order_pay/sdk.js" type="text/javascript"></script>
		<script src="${path}/style/hotel_order_pay/seed.js" type="text/javascript"></script>

	</head>

	<body>
		<script>
			if(window.loggerPlusPre && window.loggerPlusPre.setOption) {
				window.loggerPlusPre.setOption({
					projectName: 'pay_core_pc'
				})
			}
		</script>

		<div class="top-bar">
			<div class="content">
				<a href="" target="_blank">${dbuser.username }</a><span>|</span>
				<a href="" target="_blank">我的订单</a>
			</div>
		</div>
		<div class="container">
			<div class="main-title"><span class="sub">收银台</span></div>
		<c:forEach items="${hotelOrders }" var="list">
			<div class="message">
				<h3>
	        		<i class="i-success"></i>您的订单提交成功！
	            </h3>
				<div class="item clearfix">
					<span class="label">订单号：</span>
					<span class="num">${list.hordernum }</span>
				</div>
			</div>

			<div class="message _j_split_container">
				<div class="item clearfix">
					<span class="label">应付金额：</span>
					<span class="price"><em>￥</em>${list.hprice }</span>
				</div>
			</div>

			<div class="cashier-wrapper">
				<div class="hotel-info">
					<div class="hd">
						<h2>${list.hname }</h2>
						<p>地址：${list.address } </p>
					</div>
					<div class="bd clearfix">
						<ul>
							<li><span class="label">入住时间：</span><span class="txt-red">${list.checkintime }</span></li>
							<li><span class="label">退房时间：</span><span class="txt-red">${list.checkouttime }</span></li>
							<li><span class="label">房型：</span>${list.htype }</li>
							<li><span class="label">房间数量：</span>${list.roomnum }间</li>
							<li><span class="label">入住人：</span>${list.relationname }</li>
						</ul>
						<ul>
							<li><span class="label">联系人：</span>${list.relationname }</li>
							<li><span class="label">手机：</span>${list.relationphone }</li>
						</ul>
					</div>
					<div class="notice">
						<p>取消政策： 此房价预订后酒店不接受取消或变更的请求。

						</p>
					</div>
					<div class="notice">
						<p>特别提示： 此订单可由供应商开具增值税普通发票。成功入住后6个月内仍可以申请补开发票。
						</p>
					</div>
				</div>
			</div>
			<form action="${path }/web/updateStatus" method="post">
				<input type="text" value="${list.id }" name="id" id="id" style="display: none;"/>
				<input type="text" value="${dbuser.id }" name="uid" id="uid" style="display: none;"/>
				<div class="order-action ">
	                <input style="margin: 0;padding: 0;border: 1px solid transparent;outline: none;background-color: orange;width: 80px;height: 40px" type="submit" value="确实支付"/>
	            </div>
            </form>
		</c:forEach>
       </div>
</body></html>