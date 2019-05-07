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
		<title>门票订单</title>
		<link href="${path}/style/order/order1.css" rel="stylesheet" />
		<link href="${path}/style/order/order2.css" rel="stylesheet" />
		<script src="${path}/style/js/jquery/2.0.0/jquery.min.js" type="text/javascript"></script>
		<script src="${path}/style/order/order1.js" type="text/javascript"></script>
		<script src="${path}/style/order/order2.js" type="text/javascript"></script>
		<style>
			.invisible {
				opacity: 0.01;
				filter: alpha(opacity=1);
			}
			
			.invisible .maps-container {
				opacity: 0.01;
				filter: alpha(opacity=1);
			}
		</style>
	</head>

	<body>
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
							<li class="on">
								<a class="tags_link" href="${path }/web/myvieworder?id=${user.id}" title="景点订单">门票订单</a>
							</li>
							<li>
								<a class="tags_link" href="${path }/web/myhotelorder?id=${user.id}" title="景点订单">酒店订单</a>
							</li>
							<li>
								<a class="tags_link" href="${path }/web/myvcomment?id=${user.id}" title="我的点评">景点点评</a>
							</li>
							<li>
								<a class="tags_link" href="${path }/web/myhcomment?id=${user.id}" title="我的点评">酒店点评</a>
							</li>
							<li>
								<a class="tags_link" href="${path }/web/myfcomment?id=${user.id}" title="我的点评">美食点评</a>
							</li>
						</ul>
					</div>
				</div>
			</div>
			<div class="wrapper">
				<div class="home-extra">
					<br>
					<ul class="filter clearfix">
						<li class="on">
							<a href="">全部</a>
						</li>
					</ul>
					<div class="order-table">
						<table class="order-hd">
							<tbody>
								<tr>
									<th class="td-info">订单信息</th>
									<th class="td-type">类型</th>
									<th class="td-date">行程日期</th>
									<th class="td-cost">支付金额</th>
									<th class="td-status">订单状态</th>
									<th class="td-operate">操作</th>
								</tr>
							</tbody>
						</table>
						<div class="order-bd">
						<c:forEach items="${viewOrders }" var="list">
							<table  class="order-item">
								<caption>
									<span class="num">订单号：
                                        <a href="${path }/web/myvieworder_detail?id=${list.id}" target="_blank">
					                        ${list.ordernumber }
					                    </a>
                                    </span>
									<span class="time">下单时间：${list.booktime }</span>
								</caption>
								<tbody>
									<tr>
										<td class="td-info">
											<a class="pro-img" href="${path }/web/view_order?id=${list.id}&&vid=${list.vid}" target="_blank">
												<c:choose>
													<c:when test="${list.viewphoto==null || list.viewphoto =='' }">
														<img src="${path}/images/icon/view.jpg" alt="${list.vname }">
													</c:when>
													<c:otherwise>
														<img src="${path}${list.viewphoto }" alt="${list.vname }" />
													</c:otherwise>
												</c:choose>
											</a>
											<div class="pro-detail">
											<c:if test="${not empty list.tname }">
												<p class="title" title="${list.tname }">
													<a href="${path }/web/view_order?id=${list.id}&&vid=${list.vid}" target="_blank">${list.tname }</a>
												</p>
											</c:if>
											<c:if test="${empty list.tname}">
												<p class="title" title="${list.vname }">
													<a href="${path }/web/view_order?id=${list.id}&&vid=${list.vid}" target="_blank">${list.vname }</a>
												</p>
											</c:if>
												<p class="sub" >门票 × ${list.ordertotal }</p>
											</div>
										</td>
										<td class="td-type">门票</td>
										<td class="td-date">
											<p>使用日期：${list.tratime }</p>
										</td>
										<td class="td-cost">
											<strong>￥${list.tprice }</strong> </td>
										<c:if test="${list.status eq '待支付' }">
											<td class="td-status">
												<p class="s4">
													${list.status }
												</p>
											</td>
											<td class="td-operate">
												<a href="${path }/web/myvieworder_detail?id=${list.id}" target="_blank">
													查看订单
												</a>
												<a class="btn" href="${path }/web/payViewOrder?id=${list.id}" target="_blank">
													去支付
												</a>
												<form action="${path }/web/quxiaoViewOrder">
													<input type="text" id="uid" name="uid" value="${dbuser.id }" style="display: none;" />
													<input type="text" id="id" name="id" value="${list.id }" style="display: none;" />
													<input class="btn" type="submit" style=" margin: 0;padding: 0;border: 1px solid transparent;outline: none;width: 80px;height: 28px" type="submit" value="取消订单" />
												</form>
											</td>
										</c:if>
										<c:if test="${list.status eq '已关闭' }">
											<td class="td-status">
												<p class="s0">
													已关闭
												</p>
											</td>
											<td class="td-operate">
												<a  href="${path }/web/deleteViewOrderend?id=${list.id}">
													删除订单
												</a>
	
												<a href="${path }/web/myvieworder_detail?id=${list.id}" target="_blank">
													查看订单
												</a>
	
												<a href="${path }/web/view_order?id=${list.id}&&vid=${list.vid}" target="_blank">
													重新预订
												</a>
											</td>
										</c:if>
										<c:if test="${list.status eq '已完成' }">
											<td class="td-status">
												<p class="s4">
													${list.status }
												</p>
											</td>
											<td class="td-operate">
												<a  href="${path }/web/deleteViewOrderend?id=${list.id}">
													删除订单
												</a>
												<a href="${path }/web/myvieworder_detail?id=${list.id}" target="_blank">
													查看订单
												</a>
											</td>
										</c:if>
									</tr>
								</tbody>
							</table>
							</c:forEach>
						</div>
					</div>
				</div>
			</div>
			<script>
				// 攻略点击报数
				$('.review-guide a').click(function() {
					var $btn = $(this),
						url = $btn.attr('href');

					mfwPageEvent('sales', 'order_center', {
						click: '点评攻略'
					});

					setTimeout(function() {
						window.open(url);
					}, 0);

					return false;
				});
				// PV
				if(window.Env.status == 4) {
					mfwPageEvent('sales', 'page', {
						pageName: '我的订单-待点评'
					});
				}
			</script>
		</div>

		<%@include file="../common/footer.jsp"%>
	</body>

</html>