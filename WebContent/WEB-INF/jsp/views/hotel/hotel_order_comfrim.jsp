<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="com.hz.model.HotelRoomType"%>
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
		<link href="${path}/style/hotel_order_comfrim/hotel_order_comfrim1.css" rel="stylesheet" />
		<link href="${path}/style/hotel_order_comfrim/hotel_order_comfrim2.css" rel="stylesheet" />
		<link href="${path}/style/hotel_order_comfrim/hotel_order_comfrim3.css" rel="stylesheet" />
		<script src="${path}/style/js/jquery/2.0.0/jquery.min.js" type="text/javascript"></script>
		<script src="${path}/style/hotel_order_comfrim/booking_form.js" type="text/javascript"></script>
		<script src="${path}/style/hotel_order_comfrim/hotel_order_comfrim1.js" type="text/javascript"></script>
		<script src="${path}/style/hotel_order_comfrim/index.js" type="text/javascript"></script>
		<script type="text/javascript" src="${path }/admin/lib/My97DatePicker/4.8/WdatePicker.js"></script>
	</head>

	<body>
	
		<%@include file="../common/head.jsp"%>
		<div class="container">
			<div class="wrapper" id="_j_wrapper">
				<div class="process">
					<ul class="clearfix">
						<li class="visited"><i></i>1. 选择房间 </li>
						<li class="on"><i></i>2. 填写入住详情</li>
						<li><i></i>3. 确认支付信息</li>
						<li><i></i>4. 预订完成</li>
					</ul>
				</div>
				
				<%
					HotelRoomType hotelRoomType = (HotelRoomType)request.getAttribute("hotelRoomType");
					System.out.println("前端获取："+hotelRoomType);
				%>
				<form action="${path }/web/saveHotelOrder" method="post">
				<div class="order-main">
					<!-- 酒店信息 S -->
					<div class="hotel-panel">
						<div class="img">
							<a href="">
								<c:choose>
									<c:when test="${list.roomphoto==null || list.roomphoto =='' }">
										<img  src="${path}/images/icon/hotel.jpg" width="200px;" height="200px">
									</c:when>
									<c:otherwise>
										<img   src="${path}${roomphoto }" />
									</c:otherwise>
								</c:choose>
							</a>
						</div>
						<div class="info">
							<a href="">
								<h2>${hname}</h2>
							</a>
							<p class="address">地址：${address } </p>
						</div>
					</div>
					<!-- 酒店信息 E -->

					<!-- 填写表单 S -->
					<div class="form-panel">
						<!-- 房间信息 S -->
						<div class="form-block form-room" id="_j_form_room_container">
							<div class="room-item">
								<div class="mod-title">房间 - <em class="room-name">${htype }</em> (必填)</div>
								<p class="sub">入住人信息：<span class="text">${hnum }成人</span>
								</p>
								<div class="extra-tips">此入住人数为查询价格时设置的人数,如变更请在前一页日期旁修改并重新查询价格</div>
								<div class="f-row select-container _j_select_container"></div>
								<div class="line"></div>
								<div class="name-list-container _j_name_list_container">
									<div class="f-row">
										<div class="ui-input ui-input-long ui-input-success">
											<input type="text" class="phone input-name" name="relationname" id="relationname">
											<label>姓名</label><i class="icon-success"></i>
										</div>
									</div>
									<div class="f-row">
										<div class="ui-input ui-input-long ui-input-success" >
											<input type="text" class="phone input-name"  name="relationphone" id="relationphone">
											<label>手机</label>
										</div>
									</div>
									<div class="tips" style="padding-top: 0; padding-bottom: 10px;">*请按相应证件准确填写第一入住人信息，订单提交后将无法变更或收费变更。</div>
								</div>
								<div class="tips">
									*<span class="tips-language">与证件姓名一致</span>，填写1人即可。				
								</div>
							</div>
						</div>
						<!-- 房间信息 E -->
						<div class="form-block form-contact" id="_j_contact_information_container">
							<div class="mod-title">房间信息 (必填)</div>
							<div class="f-row" style="display: none;">
								<div class="ui-input ui-input-long ui-input-success">
									<input type="text" class="name input-name" name="htpid"  id="htpid" value="${id1 }">
									<label>房型id</label>
								</div>
							</div>
							<div class="f-row" style="display: none;">
								<div class="ui-input ui-input-long ui-input-success" >
									<input type="text" class="phone input-name" id="uid" name="uid" value="${dbuser.id }" >
									<label>用户id</label>
								</div>
							</div>
							<div class="f-row" style="display: none;">
								<div class="ui-input ui-input-long ui-input-success">
									<input type="text" class="name input-name" id="hid" name="hid" value="${hid }" >
									<label>酒店id</label>
								</div>
							</div>
							<div class="f-row">
								<div class="ui-input ui-input-long ui-input-success">
									<input type="text" class="name input-name" name="htype"  id="htype" value="${htype }">
									<label>房型</label>
								</div>
							</div>
							<div class="f-row">
								<div class="ui-input ui-input-long ui-input-success" >
									<input type="text" class="phone input-name"  name="hprice" id="hprice" value="${hprice }" readonly="readonly" >
									<label>单价</label>
								</div>
							</div>
							<div class="f-row">
								<div class="ui-input ui-input-long ui-input-success">
									<input name="checkintime" type="text" id="checkintime" class="input date Wdate" onfocus="WdatePicker({dateFmt:'yyyy-MM-dd',maxDate:'#F{$dp.$D(\'checkouttime\')}'})">
									<label>入住时间(2019-03-01)</label>
								</div>
							</div>
							<div class="f-row">
								<div class="ui-input ui-input-long ui-input-success" >
									<input name="checkouttime" type="text" id="checkouttime" class="input date Wdate" onfocus="WdatePicker({dateFmt:'yyyy-MM-dd',minDate:'#F{$dp.$D(\'checkintime\')}'})">
									<label>离店时间(2019-03-01,要比入住时间迟)</label>
								</div>
							</div>
							<div class="f-row">
								<div class="ui-input ui-input-long ui-input-success">
									<input type="text" class="email input-name"  name="roomnum" id="roomnum">
									<label>房间数(总房间数为：${roomtotal })</label>
								</div>
							</div>
						</div>
					</div>
					<div class="special-panel mod-wrap extend" id="_j_special_panel_container"  style="height: 81px; overflow: visible;">
						<div class="mod-title special">特殊要求<i class="i-arrow"></i></div>
						<div class="mod-bd">

							<div class="tips" id="_j_arrive_time">酒店办理入住时间为14:00-22:00，请您做好出行安排。</div>
							<div class="tips" id="_j_special_tips">*其他要求请到酒店前台与酒店协商。</div>
						</div>
					</div>
					<input class="btn-action" style=" margin: 0;padding: 0;border: 1px solid transparent;outline: none;width: 650px;height: 45px;font-weight: 45px" type="submit" value="提交订单"/>
					<br>
					<br>
				</div>
			</form>
				<div class="order-side-wrap show" id="_j_order_side">
					<!-- 全部费用明细 S -->
					<div class="order-side" id="_j_expense_container">
						<div class="expense-detail">
						</div>
						<div class="state danger">该订单不可取消和变更</div>
					</div>
					<div class="order-side" id="_j_hotel_insure_container">
						<div class="expense-detail">
							<div class="hd">有房保障</div>
							<ul class="bd">
								<li class="hotel-insure-tit-wrap">
									<p class="hotel-insure-tit">有房保障 订单无忧</p>
									<span class="hotel-insure-desc">为您的订单负责，确认订单后发生无房，经马蜂窝协调处理，仍无法安排原订单入住，最高承担原订单首晚房费。</span>
								</li>
								<li class="hotel-insure-tit-wrap">
									<p class="hotel-insure-tit">专业服务 安心出行</p>
									<span class="hotel-insure-desc">为您的出行负责，7 x 24小时海内外服务热线。</span>
								</li>
							</ul>
						</div>
					</div>
					<!-- 有房保障 E -->
				</div>
			</div>
		</div>
		
		<%@include file="../common/footer.jsp"%>
	</body>
</html>