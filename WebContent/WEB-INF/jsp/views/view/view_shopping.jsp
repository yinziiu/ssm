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
		<title>贺州景点门票</title>
		<link href="${path}/style/view_shopping/view_shopping1.css" rel="stylesheet" />
		<link href="${path}/style/view_shopping/view_shopping2.css" rel="stylesheet" />
		<script src="${path}/style/js/jquery/2.0.0/jquery.min.js" type="text/javascript"></script>
		<script src="${path}/style/view_shopping/BrowserState.js" type="text/javascript"></script>
		<script src="${path}/style/view_shopping/view_shopping1.js" type="text/javascript"></script>
		<script src="${path}/style/view_shopping/view_shopping2.js" type="text/javascript"></script>
		<script src="${path}/style/view_shopping/view_shopping3.js" type="text/javascript"></script>
		<script src="${path}/style/view_shopping/view_shopping4.js" type="text/javascript"></script>
		<style type="text/css">
			@charset "UTF-8";
			[ng\:cloak],
			[ng-cloak],
			[data-ng-cloak],
			[x-ng-cloak],
			.ng-cloak,
			.x-ng-cloak {
				display: none;
			}
			
			ng\:form {
				display: block;
			}
		</style>

	</head>

	<body style="position: relative;">
	
		<%@include file="../common/head.jsp"%>
		<div class="container">
			<form id="formFilter" action="${path }/web/FindTicket" method="post">
				<div class="filter-panel">
					<div class="filter-hd clearfix" id="saleType">
						<a href="" id="saleType11" style="font-size: 18px;color: orange;">景点门票</a>
						<input style="margin: 0;padding: 0;border: 1px solid transparent;outline: none;width: 300px;height: 40px;margin-left: 30px;padding-left: 10px; " placeholder="根据票名查询"  type="text" name="tname" id="tname" value="" />
						<input type="submit" value="搜索" style="margin: 0;padding: 0;border: 1px solid transparent;outline: none;height: 40px;width: 60px;  "/>
					</div>
				</div>
			</form>
			<div class="sales-content">
				<div class="sort-bar">
					<ul>
						<li class="sort-item">
							<a class="active"  href="javascript:void(0);">浏览排行</a>
						</li>
					</ul>
				</div>
				<div class="list-wrap" style="display: block;">
				<c:if test="${dbuser!=null }">
					<c:forEach items="${viewsTicketList }" var="list">
						<a class="item clearfix" href="${path }/web/view_order?id=${list.id}&&vid=${list.vid}" target="_blank">
							<div class="image">
								<c:choose>
									<c:when test="${list.viewphoto==null || list.viewphoto =='' }">
										<img width="296" height="156" src="${path}/images/icon/view.jpg">
									</c:when>
									<c:otherwise>
										<img width="296" height="156" src="${path}${list.viewphoto }" />
									</c:otherwise>
								</c:choose>
								<span class="mark-type type-10">
	            					<strong>${list.ttype }</strong>
								</span>
							</div>
							<div class="detail">
								<div class="info" style="position: relative">
									<h3>
					                    ${list.tname }
					                </h3>
									<div class="s-tag">
										${list.location }
									</div>
									<p>售量${list.sales }</p>
								</div>
								<div class="extra">
									<div class="action">
										<span class="btn">立即预定</span>
										<div class="promo-tag">
										</div>
									</div>
									<span class="price"><b>￥</b><strong>${list.tprice }</strong>起</span>
								</div>
							</div>
						</a>
					</c:forEach>
				</c:if>
				<c:if test="${dbuser==null }">
					<c:forEach items="${viewsTicketList }" var="list">
						<a class="item clearfix" href="${path }/web/login" target="_blank">
							<div class="image">
								<c:choose>
									<c:when test="${list.viewphoto==null || list.viewphoto =='' }">
										<img width="296" height="156" src="${path}/images/icon/view.jpg">
									</c:when>
									<c:otherwise>
										<img width="296" height="156" src="${path}${list.viewphoto }" />
									</c:otherwise>
								</c:choose>
								<span class="mark-type type-10">
	            					<strong>${list.ttype }</strong>
								</span>
							</div>
							<div class="detail">
								<div class="info" style="position: relative">
									<h3>
					                    ${list.tname }
					                </h3>
									<div class="s-tag">
										${list.location }
									</div>
									<p>售量${list.sales }</p>
								</div>
								<div class="extra">
									<div class="action">
										<span class="btn">立即预定</span>
										<div class="promo-tag">
										</div>
									</div>
									<span class="price"><b>￥</b><strong>${list.tprice }</strong>起</span>
								</div>
							</div>
						</a>
					</c:forEach>
					</c:if>
				</div>
				<div class="_j_tn_pagination">
					<div align="right" class="m-pagination">
						<span class="count">共<span>${page.pages }</span>页 / <span>${page.total }</span>条</span>
						<a class="pi pg-next" <c:if test="${page.pageNum != page.firstPage}"> href=${paht}/web/shop?currentPage=${page.pageNum - 1 }"</c:if> <c:if test="${page.pageNum == page.firstPage}"> href="javascript:void(0)" class="disabled"</c:if>  title="前一页">前一页</a>
						 <c:forEach begin="1" end="${page.pages }" varStatus="status">
							<a class="pi" href="${path}/web/shop?currentPage=${status.count }" <c:if test="${status.count == page.pageNum}">class="select"</c:if>>${status.count }</a>
						</c:forEach>
						<a class="pi pg-next" <c:if test="${page.pageNum == page.lastPage}">class="disabled" href="javascript:void(0)"</c:if> <c:if test="${page.pageNum != page.lastPage}">href="${path}/web/shop?currentPage=${page.pageNum + 1 }"</c:if>   title="后一页">后一页</a>
					</div>
				</div>
			</div>
			<div class="sales-side">
				<div class="m-hotsale" style="display: block;">
					<h3 class="hd">热卖</h3>
					<ul>
					<c:if test="${dbuser!=null }">
						<c:forEach items="${viewsTicketList2 }" var="list">
						<li>
							<a href="${path }/web/view_order?id=${list.id}&&vid=${list.vid }" target="_blank">
								<span class="image">
									<c:choose>
										<c:when test="${list.viewphoto==null || list.viewphoto =='' }">
											<img width="120" height="80" src="${path}/images/icon/view.jpg">
										</c:when>
										<c:otherwise>
											<img width="120" height="80" src="${path}${list.viewphoto }" />
										</c:otherwise>
									</c:choose>
								</span>
								<div title="" style="overflow: hidden;text-overflow: ellipsis;display: -webkit-box;
   										 -webkit-line-clamp: 2;-webkit-box-orient: vertical;" class="title">${list.tname }</div>
								<span class="price">¥${list.tprice }起</span>
							</a>
						</li>
						</c:forEach>
					</c:if>
					<c:if test="${dbuser==null }">
						<c:forEach items="${viewsTicketList2 }" var="list">
						<li>
							<a href="${path }/web/login" target="_blank">
								<span class="image">
									<c:choose>
										<c:when test="${list.viewphoto==null || list.viewphoto =='' }">
											<img width="120" height="80" src="${path}/images/icon/view.jpg">
										</c:when>
										<c:otherwise>
											<img width="120" height="80" src="${path}${list.viewphoto }" />
										</c:otherwise>
									</c:choose>
								</span>
								<div title="" style="overflow: hidden;text-overflow: ellipsis;display: -webkit-box;
   										 -webkit-line-clamp: 2;-webkit-box-orient: vertical;" class="title">${list.tname }</div>
								<span class="price">¥${list.tprice }起</span>
							</a>
						</li>
						</c:forEach>
						</c:if>
					</ul>
				</div>
			</div>
		</div>
		<script>
			var globalListTotal = parseInt("");
			var globalGroup = parseInt("");
			var globalType = parseInt("11") ? parseInt("11") : 0;
			var FilterParam = {
				from: parseInt(""),
				kw: "",
				to: "M12913",
				salesType: parseInt("11"),
				page: 1,
				group: globalGroup,
				sort: 'smart',
				sort_type: 'desc',
				limit: 20
			};

			$('#ipt_keyword').val('贺州');
			$(function() {
				var filterList = new FilterList();
				filterList.ajaxGetList();
				// 以下代码为模拟锚点,锚点生成短连接不生效
				// 以上代码为模拟锚点

			});
		</script>
		
		<%@include file="../common/footer.jsp"%>
	</body>

</html>