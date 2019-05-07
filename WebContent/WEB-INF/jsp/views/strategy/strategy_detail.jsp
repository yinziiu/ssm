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
		<title>攻略详情</title>
		<link href="${path}/style/strategy_detail/strategy_detail.css" rel="stylesheet" />
		<link href="${path}/style/strategy_detail/strategy_detail2.css" rel="stylesheet" />
		<script src="${path}/style/js/jquery/2.0.0/jquery.min.js" type="text/javascript"></script>
		<script src="${path}/style/strategy_detail/strategy_detail1.js" type="text/javascript"></script>
		<script src="${path}/style/strategy_detail/strategy_detail2.js" type="text/javascript"></script>
		<script src="${path}/style/strategy_detail/strategy_detail3.js" type="text/javascript"></script>
		<script src="${path}/style/strategy_detail/salesapp.js" type="text/javascript"></script>
		<style type="text/css">
			._j_fix_block_fix_1 {
				position: fixed;
				top: 0px;
				bottom: 0px
			}
		</style>
		<style type="text/css">
			._j_fix_block_abs_2 {
				position: absolute;
				top: 21010px;
				height: 657px
			}
		</style>
		<style type="text/css">
			._j_fix_block_abs_3 {
				position: absolute;
				top: 21216px;
				height: 657px
			}
		</style>
		<style type="text/css">
			._j_fix_block_abs_4 {
				position: absolute;
				top: 21265px;
				height: 608px
			}
		</style>
	</head>

	<body style="position: relative;">

		<%@include file="../common/head.jsp"%>

		<div class="wrap clearfix">
			<div class="crumb">
				<a href="${path}/web/index">首页</a> &gt;
				<a href="${path}/web/strategy">攻略</a> &gt;<em>攻略详情</em>
			</div>
			<div class="local-con clearfix">
			<c:forEach items="${strategies }" var="list">
				<div class="sideL">
					<div class="l-topic">
						<h1>${list.stname }</h1>
						<div class="sub-tit">
							<span class="time" style="margin-left: 20px;"><em>阅读 ${list.streadnum }</em></span>
							<span class="time">攻略详情<em>${list.sttime }</em>
                    		</span>
						</div>
					</div>

					<div class="_j_content">
						<div class="f-block">
							<div class="p-section">
								${list.stcontent }
							</div>
						</div>
						<div class="f-block">
							<img class="_j_lazyload" style="height: 360px; width: 600px; background: rgb(252, 242, 220); display: block;" src="${path }${list.stphoto}">
						</div>
					</div>
					<br>
					<p style="font-size: 15px;"><span style="font-weight: bold;">该攻略来自于：</span>${list.comefrom }</p>
					<br>
				</div>
				</c:forEach>
			</div>
			<hr>

			<div id="relate">
				<div class="relate_pro">
					<p class="title">更多攻略</p>
					<a class="pro_more" href="${path}/web/strategy">查看更多&gt;</a>
					<ul class="bd clearfix">
					<c:forEach items="${strategieList }" var="list">
						<li>
							<a title="${list.stname }" href="${path }/web/strategy_detail?id=${list.id}">
								<div class="img">
									<c:choose>
										<c:when test="${list.stphoto==null || list.stphoto =='' }">
											<img  src="${path}/images/icon/view.jpg">
										</c:when>
										<c:otherwise>
											<img  src="${path}${list.stphoto }" />
										</c:otherwise>
									</c:choose>
								</div>
								<div class="info">
									<h3>${list.stname }</h3>
									<div class="sub">
										<p>时间：${list.sttime }</p>
										<p>阅读：${list.streadnum }</p>
									</div>
								</div>
							</a>
						</li>
					</c:forEach>
					</ul>
				</div>
			</div>
		</div>
		<%@include file="../common/footer.jsp"%>
	</body>

</html>