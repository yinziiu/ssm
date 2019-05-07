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
		<title>旅游攻略</title>
		<link href="${path}/style/strategy/strategy.css" rel="stylesheet" />
		<link href="${path}/style/strategy/gonglve.css" rel="stylesheet" />
		<script src="${path}/style/js/jquery/2.0.0/jquery.min.js" type="text/javascript"></script>
		<script src="${path}/style/strategy/BrowserState.js" type="text/javascript"></script>
		<script src="${path}/style/strategy/strategy1.js" type="text/javascript"></script>
		<script src="${path}/style/strategy/strategy2.js" type="text/javascript"></script>
		<script type="text/javascript" src="${path}/style/lunbotu/js/Choices.js"></script>
		<link href="${path}/style/lunbotu/css/style.css" rel="stylesheet" />

		<style type="text/css">
			.search {
				border-bottom: 2px solid ghostwhite;
				text-align: right;
			}
			
			.search input {
				border: none;
				background-color: white;
			}
		</style>

	</head>

	<body style="position: relative;">

		<%@include file="../common/head.jsp"%>

		<style type="text/css">
			.domn_in p a:hover {
				text-decoration: none;
				color: #666;
			}
			
			.highlight {
				color: #FFA801;
			}
			
			.search-box {
				width: 400px;
				right: 15px;
				top: 30px;
			}
			
			.search-box .txt {
				width: 380px;
			}
			
			._j_page_loader {
				background-color: #fff5e5;
				border-radius: 4px;
				color: #666;
				display: block;
				height: 40px;
				line-height: 40px;
				text-align: center;
				width: 100%;
			}
		</style>

		<div class="Choices">
			<div class="Choices_text">
				<div class="Choices_content">
					<div class="Choices_banner">
						<ul>
							<li>
								<div class="Choices_left">
									<img src="${path}/images/icon/s1.jpg" width="100%" height="399px">
								</div>
								<div class="Choices_right">
									<h1>黄姚古镇龙爪榕</h1>
									<h2></h2>
									<p style="color: #999;font-size: 15px">
										龙爪榕因其气根形似龙爪而得名，已有500多年树龄。从正门进入沿右岔路寻去即可见。古树竟是在石头中生长，与岩石紧紧相拥，根须没法充分伸展，故又名“石上榕”。而枝干却盘根错节，参天繁茂，伸展至半空，倒影清溪，参差斑驳。 最有趣的是，有调皮的孩童还躺卧在巨大的根窝间，被如老人般的古榕慈祥地怀抱着。
									</p>
								</div>
							</li>
							<li>
								<div class="Choices_left">
									<img src="${path}/images/icon/s2.jpg" width="100%" height="399px">
								</div>
								<div class="Choices_right">
									<h1>姑婆山天堂顶的杜鹃花</h1>
									<h2></h2>
									<p style="color: #999;font-size: 15px">
										姑婆山是国家四A级旅游景区，旅游区总面积65平方公里，分布有仙姑寨、仙姑大草坪、仙姑瀑布、天堂顶、九天峡谷、情人林、古窑冲和方家茶园八大主题景区，内含茶寿石、聚宝盆、仙人指路、八步仙踪等88处神奇景观，故有“南国仙山”之美誉。 园内有千米以上山峰数十座，天堂顶海拔1844米，为三省交界高峰
									</p>
								</div>
							</li>
							<li>
								<div class="Choices_left">
									<img src="${path}/images/icon/s3.jpg" width="100%" height="399px">
								</div>
								<div class="Choices_right">
									<h1>贺州园博园</h1>
									<h2></h2>
									<p style="color: #999;font-size: 15px">
										贺州园博园是广西第十届园林园艺博览会会址，占地1405亩，以“山水贺寿，诗意乡愁”为设计主题，园区依山傍水，自然和谐。园内所有建筑仿唐宋风格，气势恢宏，处处透析着古朴神韵。麒麟广场占地近30000平方米，立贺州出土的国家一级甲等文物战国神兽——麒麟尊像。长寿阁巍峨耸立，立长寿赋石碑，供彭祖雕像，展长寿文化。 14城市展园各具特色，充分展现了八桂大地不同城市的民俗文化和园林景观特征。
									</p>
								</div>
							</li>
						</ul>
					</div>
				</div>
			</div>
		</div>

		<div class="wrapper">
			<div class="gonglve_wrap clearfix">
				<div class="cont-main _j_feed_list">
					<div class="hd clearfix">
						<h3>推荐攻略</h3>
						<div class="search">
							<form action="" method="post">
								<input type="text" placeholder="你想去的景点">
								<input type="submit" value="搜索" />
							</form>
						</div>
					</div>
					<div class="gl-post">
						<div class="_j_feed_data">
							<c:forEach items="${strategiesList }" var="list">
								<div class="feed-item _j_feed_item">
									<a href="${path }/web/strategy_detail?id=${list.id}" target="_blank">
										<div class="title">
											${list.stname }
										</div>
										<div class="txt">
											<div class="info" style="font-size:13px;">
												攻略来自于:“${list.comefrom }”
											</div>
										</div>
										<div class="imgs">
											<ul class="clearfix">
												<li>
													<c:choose>
														<c:when test="${list.stphoto==null || list.stphoto =='' }">
															<img class="lazy" width="200" height="130" src="${path}/images/icon/view.jpg">
														</c:when>
														<c:otherwise>
															<img class="lazy" width="200" height="130" src="${path}${list.stphoto }" />
														</c:otherwise>
													</c:choose>
												</li>
												<li class="ext-r">
													${list.streadnum }浏览
												</li>
											</ul>
										</div>
									</a>
								</div>
								<div class="hr"></div>
							</c:forEach>
						</div>
					</div>
					<div class="_j_tn_pagination">
						<div align="right" class="m-pagination">
							<span class="count">共<span>${page.pages }</span>页 / <span>${page.total }</span>条</span>
							<a class="pi pg-next" <c:if test="${page.pageNum != page.firstPage}"> href=${paht}/web/notes?currentPage=${page.pageNum - 1 }"</c:if> <c:if test="${page.pageNum == page.firstPage}"> href="javascript:void(0)" class="disabled"</c:if>  title="前一页">前一页</a>
							 <c:forEach begin="1" end="${page.pages }" varStatus="status">
								<a class="pi" href="${path}/web/notes?currentPage=${status.count }" <c:if test="${status.count == page.pageNum}">class="select"</c:if>>${status.count }</a>
							</c:forEach>
							<a class="pi pg-next" <c:if test="${page.pageNum == page.lastPage}">class="disabled" href="javascript:void(0)"</c:if> <c:if test="${page.pageNum != page.lastPage}">href="${path}/web/notes?currentPage=${page.pageNum + 1 }"</c:if>   title="后一页">后一页</a>
						</div>
					</div>
				</div>
				<div class="sidebar">
					<div class="side-hd">旅游景点导航</div>
					<div class="rank">
						<ul>
							<c:forEach items="${vname }" var="list">
								<li>
									<a href="${path }/web/view_detail?vid=${list.id}"  target="_blank">${list.vname }</a>
								</li>
							</c:forEach>
						</ul>
					</div>
				</div>
			</div>
		</div>

		<!-- 底部 -->
		<%@include file="../common/footer.jsp"%>
	</body>

</html>