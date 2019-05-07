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
		<title>收银台 </title>
		<link href="${path}/style/view_order_pay/view_order_pay1.css" rel="stylesheet" />
		<link href="${path}/style/view_order_pay/view_order_pay2.css" rel="stylesheet" />
		<script src="${path}/style/js/jquery/2.0.0/jquery.min.js" type="text/javascript"></script>
		<script src="${path}/style/view_order_pay/decimal.min.js" type="text/javascript"></script>
		<script src="${path}/style/view_order_pay/sdk.js" type="text/javascript"></script>
		<script src="${path}/style/view_order_pay/seed.js" type="text/javascript"></script>
		<script src="${path}/style/view_order_pay/view_order_pay1.js" type="text/javascript"></script>
		<script src="${path}/style/view_order_pay/view_order_pay2.js" type="text/javascript"></script>
	</head>

	<body>

		<div class="top-bar">
			<div class="content">
				<a href="" target="_blank">${dbuser.username }</a><span>|</span>
				<a href="" target="_blank">我的订单</a>
			</div>
		</div>
		<div class="container">
			<div class="main-title">
				<span class="sub">收银台</span>
			</div>
			
			<div class="message">
				<h3>
        			<i class="i-success"></i>您的订单提交成功！               
            	</h3>
				<div class="item clearfix">
					<span class="label">订单号：</span>
					<span class="num">${viewOrders.ordernumber }</span>
				</div>
			</div>
			<div class="message">
				<div class="item clearfix">
					<span class="label">门票名称：</span>
					<span class="num">${viewOrders.tname }</span>
				</div>
			</div>
			<div class="message">
				<div class="item clearfix">
					<span class="label">门票类型：</span>
					<span class="num">${viewOrders.ttype }</span>
				</div>
			</div>
			<div class="message">
				<div class="item clearfix">
					<span class="label">门票数量：</span>
					<span class="num">${viewOrders.ordertotal }</span>
				</div>
			</div>
			<div class="message">
				<div class="item clearfix">
					<span class="label">单价：</span>
					<span class="num">${price }</span>
				</div>
			</div>
			<div class="message">
				<div class="item clearfix">
					<span class="label">出行时间：</span>
					<span class="num">${viewOrders.tratime }</span>
				</div>
			</div>
			<div class="message _j_split_container">
				<div class="item clearfix">
					<span class="label">应付金额：</span>
					<span class="price"><em>￥</em>${viewOrders.tprice }</span>
				</div>
			</div>
			<form action="${path }/web/payViewOrderend">
				<input type="text" id="uid" name="uid" value="${dbuser.id }" style="display: none;" />
				<input type="text" id="id" name="id" value="${viewOrders.id }" style="display: none;" />
				<div class="order-action ">
					<input style="margin: 0;padding: 0;border: 1px solid transparent;outline: none;background-color: orange;width: 80px;height: 40px" type="submit" value="确实支付"/>
					<p>支付成功后，请注意接受短信和邮件。</p>
				</div>
			</form>
		</div>
	</body>
</html>