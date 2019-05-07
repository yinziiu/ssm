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
		<title>门票预订</title>
		<link href="${path}/style/view_order/view_order1.css" rel="stylesheet" />
		<link href="${path}/style/view_order/view_order2.css" rel="stylesheet" />
		<link href="${path}/style/view_detail/view_detail2.css" rel="stylesheet" />
		<link href="${path}/style/common/css/laydate.css" rel="stylesheet" />
		<script src="${path}/style/js/jquery/2.0.0/jquery.min.js" type="text/javascript"></script>
		<script src="${path}/style/common/js/BrowserState.js" type="text/javascript"></script>
		<script src="${path}/style/view_order/view_order1.js" type="text/javascript"></script>
		<script src="${path}/style/view_order/view_order2.js" type="text/javascript"></script>
		<script src="${path}/style/view_order/view_order3.js" type="text/javascript"></script>
		<script src="${path}/style/view_order/view_order4.js" type="text/javascript"></script>
		
		<script type="text/javascript" src="${path}/style/common/js/laydate.js"></script>
		
	</head>

	<body style="position: relative;">
		<%@include file="../common/head.jsp"%><br><br>
		<div class="container ">
			<div class="wrapper">
				<c:forEach items="${viewTicket }" var="list">
					<div class="sales-intro new-intro clearfix ">
						<div class="intro-l">
							<div class="sales-photo">
								<ul>
									<li>
										<img src="${path }/images/icon/view.jpg" width="650px" height="400px">
									</li>
								</ul>
							</div>
						</div>
						<div class="intro-r">
							<div class="sales-title">
								<span class="shop-icon">店铺</span>
								<h1>${list.tname }</h1>
							</div>

							<div class="price-panel clearfix">
								<ul>
									<li class="item-price">
										<em>￥</em><strong>${list.tprice }</strong>
										<span id="priceDesc">
		                                    <a href="javascript:void(0);" data-stat-area="2_2">价格说明</a>
		                                    <span id="priceDescMsg">
		                                    		此价格是指，本门票类型的价格
		                                    </span>
										</span>
									</li>
									<li class="item-sold">
										售量${list.sales }
									</li>
								</ul>
							</div>
							<div class="safeguard">
								<span><i></i>如实描述</span>
								<span><i></i>入园保证</span>
								<span><i></i>双倍赔付</span>
							</div>

						</div>
					</div>
				</c:forEach>
				<div class="pagelet-block">
					<div class="mod mod-promo">
						<div class="wrapper">
							<div class="mbd">
								<table>
									<thead>
										<tr>
											<th class="type">类型</th>
											<th class="pro">票名</th>
											<th class="price">价格</th>
											<th class="action">&nbsp;</th>
										</tr>
									</thead>
									<c:forEach items="${viewTickets }" var="ticket">
										<tbody>
											<tr>
												<td class="type">${ticket.ttype }</td>
												<td class="pro">
													<a href="" target="_blank" title="${ticket.tname }">${ticket.tname }</a>
												</td>
												<td class="price">￥${ticket.tprice }起</td>
												<c:if test="${dbuser!=null }">
													<td class="action">
														<a class="btn" href="${path }/web/view_order_comfrim?id=${ticket.id}" target="_blank" title="预订">预订</a>
													</td>
												</c:if>
												<c:if test="${dbuser==null }">
													<td class="action">
														<a class="btn" href="${path}/web/login" target="_blank" title="预订">预订</a>
													</td>
												</c:if>
											</tr>
										</tbody>
									</c:forEach>
								</table>
							</div>
						</div>
					</div>
				</div>
				<div class="clearfix detail-wrapper">
					<div class="main-detail">
						<a id="target_purchase" class="nav-anchor"></a>
						<!--购买须知-->
						<div class="m-panel m-notice" data-module-name="购买须知" data-stat-display="6">
							<div class="m-hd">
								<h2>购买须知</h2>
							</div>
							<div class="m-bd">

								<dl class="detail-alert">
									<dt class="subtitle">退改政策</dt>
									<dd class="notes-content">
										该产品支持取消，如需取消，请登录账户，至“我的订单”中，申请取消
										<br> 未使用随时退，退款收取10%手续费
										<br>

									</dd>
								</dl>
								<dl class="detail-notes">
									<dt class="subtitle">门票信息</dt>
									<dd class="notes-content">
										<h3>费用不含</h3>
										<p>一切个人消费及费用包含中未提及的任何费用。</p>
										<h3>生效时间</h3>
										<p>出票后2小时0分钟后使用，出行人当天可用</p>
										<h3>有效期</h3>
										<p>出行日期1天内有效</p>
										<h3>入园方式</h3>
										<p>需换票，凭商家电子码换票</p>
										<h3>换票地点</h3>
										<p>景点售票处</p>
									</dd>
								</dl>
								<dl class="detail-notes">
									<dt class="subtitle">重要提示</dt>
									<dd class="notes-content">
										<p>1. 尊重并保护用户隐私，用户信息只会用于协助用户预订旅游商品；</p>
										<p>2. 预订订单，需要支付全款，未支付将被视为无效支付</p>
										<p>3. 出行前，请您确保您自身的身体状况适合参加行程。您应将自身健康情况如实告知；</p>
										<p>4. 请尊重当地的饮食习惯、习俗禁忌、宗教礼仪，遵守当地法律法规等；</p>
										<p>5. 为了您人身、财产的安全，请您避免在公开场合暴露贵重物品及大量现金；</p>
										<p>6. 您所预订的商品可能包含高危项目（如游泳、漂流、潜水、滑雪等），参与前请根据自身条件， 并充分参考当地相关部门及其它专业机构的相关公告和建议后出行；</p>
										<p>7. 建议您自己购买旅游意外保险及其他保险，可保障您在境内旅行期间自身生命、 身体、财产或者相关利益的短期旅游意外伤害保险及紧急救援保险。</p>
									</dd>
								</dl>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>

		<script id="sales_pagination" type="text/html">
			<!--<span class="count">共${pageTotal}页 / ${total}条</span>-->
			{{if pageTotal > 1}} {{if currPage > 1}}
			<a class="pg-prev _j_pageitem" href="javascript:;" data-page="${currPage - 1}" rel="nofollow">&lt;&lt; 上一页</a>
			{{/if}} {{each(i, index) indexers}} {{if index == currPage}}
			<span class="pg-current">${index}</span> {{else}}
			<a class="pi _j_pageitem" href="javascript:void(0);" data-page="${index}" rel="nofollow">${index}</a>
			{{/if}} {{/each}} {{if currPage
			< pageTotal}} <a class="pg-next _j_pageitem" href="javascript:;" data-page="${currPage + 1}" rel="nofollow">下一页 &gt;&gt;</a>
				{{/if}} {{/if}}
		</script>

		<script>
			M.closure(function(require) {
				var SalesDetail = require('/js/sales/detail');
				var detail = new SalesDetail({
					sales: {
						'id': 2658517,
						'name': '广西黄姚古镇电子票（当天可订  电子票 取票快捷 ）',
						'img': 'http://p3-q.mafengwo.net/s11/M00/7B/F9/wKgBEFtqqHGAKH9nAALU_gO03B819.jpeg?imageMogr2%2Fthumbnail%2F%21450x300r%2Fgravity%2FCenter%2Fcrop%2F%21450x300%2Fquality%2F100',
						'scope': 'sales',
						'type': '11'
					},
					allow_show_review: true,
					gift_code: '',
					stock_version: 1
				});
				detail.init();
				window.detailPage = detail;
			});
		</script>

		<%@include file="../common/footer.jsp"%>
	</body>

</html>