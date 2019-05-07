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
		<title>景点订单确认</title>
		<link href="${path}/style/view_order_comfrim/view_order_comfrim.css" rel="stylesheet" />
		<link href="${path}/style/view_order_comfrim/view_order_comfrim2.css" rel="stylesheet" />
		<script src="${path}/style/js/jquery/2.0.0/jquery.min.js" type="text/javascript"></script>
		<script src="${path}/style/common/js/BrowserState.js" type="text/javascript"></script>
		<script src="${path}/style/common/js/calendar.js" type="text/javascript"></script>
		<script src="${path}/style/view_order_comfrim/jquery.datetimepicker.js" type="text/javascript"></script>
		<script src="${path}/style/view_order_comfrim/jquery.mailAutoComplete-3.1.js" type="text/javascript"></script>
		<script src="${path}/style/view_order_comfrim/view_order_comfrim.js" type="text/javascript"></script>
		<script src="${path}/style/view_order_comfrim/view_order_comfrim2.js" type="text/javascript"></script>
		<script src="${path}/style/view_order_comfrim/view_order_comfrim3.js" type="text/javascript"></script>
		<script type="text/javascript" src="${path }/admin/lib/My97DatePicker/4.8/WdatePicker.js"></script>
	
	</head>

	<body style="position: relative;">
		<%@include file="../common/head.jsp"%>
		<div class="wrapper">
			<div  class="pagelet-block"></div>
			<div class="order-cont clearfix">
				<div class="order-lt">
					<div class="buy-step">
						<ul class="clearfix">
							<li class="step1">
								<p>
									<i></i>
								</p>
								<em>提交订单</em></li>
							<li class="step2">
								<p>
									<i></i>
								</p>
								<em>确认支付</em></li>
							<li class="step3">
								<p>
									<i></i>
								</p>
								<em>完成购买</em></li>
						</ul>
					</div>
					<form action="${path }/web/saveViewOrder" method="post">
						<div class="pagelet-block">
							<div id="_j_pagelet_booked_by" class="pagelet-block" >
								<div class="res-inf" id="baseInfoForm">
									<h2>订单信息</h2>
									<div class="user-int clearfix">
										<div class="form-sec flt1 form-sec-focus" style="clear: both;display: none">
											<label for="base_name">用户id</label> 
											<input id="uid" name="uid" type="text" value="${dbuser.id }" style="width: 400px" readonly="readonly">
										</div>
										<div class="form-sec flt1 form-sec-focus" style="clear: both;display: none" >
											<label for="base_name">门票id</label> 
											<input id="vtid" name="vtid" type="text" value="${viewTicket.id }" style="width: 400px" readonly="readonly">
										</div>
										<div class="form-sec flt1 form-sec-focus" style="clear: both;display: none">
											<label for="base_name">销量</label> 
											<input id="sales" name="sales" type="text" value="${viewTicket.sales }" style="width: 400px" readonly="readonly">
										</div>
										<div class="form-sec flt1 form-sec-focus" style="clear: both">
											<label for="base_name">门票名称</label> 
											<input id="tname" name="tname" type="text" value="${viewTicket.tname }" style="width: 400px" readonly="readonly">
										</div>
										<div class="form-sec flt1 form-sec-focus" style="clear: both">
											<label for="base_name">门票价格</label> 
											<input id="tprice" name="tprice" type="text" value="${viewTicket.tprice }" style="width: 400px" readonly="readonly">
										</div>
										<div class="form-sec flt1 form-sec-focus" style="clear: both">
											<label for="base_name">门票类型</label> 
											<input id="ttype" name="ttype" type="text" value="${viewTicket.ttype }" style="width: 400px" readonly="readonly">
										</div>
										<div class="form-sec flt1 form-sec-focus" style="clear: both">
											<label for="base_name">出行时间(写法：2019-03-09)</label> 
											<input type="text" onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',minDate:'%y-%M-%d {%H+1}:%16:%00'})" class="input-text Wdate" style="width: 400px">
										</div>
										<div class="form-sec flt1 form-sec-focus" style="clear: both">
											<label for="base_name">购买门票数</label> 
											<input id="ordertotal" name="ordertotal" type="text"  style="width: 400px" >
										</div>
										<div class="form-sec flt1 form-sec-focus" style="clear: both">
											<label for="base_name">姓名</label> 
											<input id="bookname" name="bookname" type="text" class="bord-red _j_booked_check" placeholder="请填写您的真实姓名" value=""  title="姓名" style="width: 400px" >
										</div>
										<div class="ver-code clearfix">
											<p class="form-sec flt1  form-sec-focus">
												<input id="bookphone" name="bookphone" type="tel" placeholder="手机"  title="手机号" class="_j_booked_check" style="width: 400px"> 
												<label for="base_phone">手机</label>
											</p>
										</div>
										<div class="form-sec flt1 form-tare form-sec-focus">
											<label for="base_description">备注信息</label>
											<textarea id="remark" name="remark" ></textarea>
										</div>
									</div>
								</div>
							</div>
						</div>
						<div class="sub-order" style="margin-bottom: 200px;">
							<div class="btn-order _j_confirm" >
								<input style="margin: 0;padding: 0;border: 1px solid transparent;outline: none;background-color: orange;width: 80px;height: 40px" type="submit" value="提交订单"/>
							</div>
						</div>
					</form>
				</div>
			</div>
		</div>

		<%@include file="../common/footer.jsp"%>

	</body>

</html>