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
		<title>贺州景点推荐</title>
		<meta name="description" content="贺州景点介绍贺州旅游景点攻略信息,贺州景点介绍包括景点地址,景点门票,景点点评等,推荐贺州最值得去的热门旅游景点,寻找更多贺州旅游景点信息">
		<meta name="keywords" content="贺州景点,贺州景点介绍,贺州景点推荐">
		<meta name="renderer" content="webkit">
		<script src="${path}/style/js/jquery/2.0.0/jquery.min.js" type="text/javascript"></script>
		<link href="${path}/style/view/view1.css" rel="stylesheet" />
		<link href="${path}/style/view/view2.css" rel="stylesheet" />
		<link href="${path}/style/view/view3.css" rel="stylesheet" />
		<link href="${path}/style/view/mfw-toolbar.css" rel="stylesheet" />
		<link href="${path}/style/view/place-crumb.css" rel="stylesheet" />
		<link href="${path}/style/view/mfw-footer.css" rel="stylesheet" />
		
		<style type="text/css">
			.wrapper{
			}
		</style>
		
	</head>

	<body style="position: relative;">
		
		<%@include file="../common/head.jsp"%>
		
		<div class="row row-summary row-bg" style="background: url('${path}/images/icon/s3.jpg') no-repeat;background-size: 100% 300px">
			<div class="wrapper">
				
				<h2 class="title" style="color: white;">景点概况</h2>
				<div>
					<p style="color: white;">&nbsp;&nbsp;&nbsp;除了黄姚古镇（国家AAAA级旅游景区）外，贺州还有诸多好玩的去处。<br>
							贺州已开发的国家AAAA级旅游景区为：姑婆山国家森林公园、贺州玉石林景区、贺州温泉景区；
							国家AAA级旅游景区为：紫云仙境景区、十八水景区等，其中还有玉印浮山、临贺故城、客家围屋、
							大桂山国家森林公园等风景名胜区，贺州形成了以森林度假、自然生态、温泉疗养、
							民族风情旅游为主的有地方特色的旅游业。
					</p>
				</div>
			</div>
				
		</div>
		<div class="row row-top5" data-cs-p="必游景点">
			<div class="wrapper">
				<h2 class="title">必游景点TOP5</h2>
				<c:forEach items="${viewListtop5 }" var="list">
				<div class="item clearfix">
					<div class="info">
						<div class="middle">
							<h3>
                                <a href="${path }/web/view_detail?vid=${list.id}" target="_blank" title="黄姚古镇">${list.vname }</a>
							</h3>
							<p style="overflow: hidden;text-indent:2em;font-size:15px;text-overflow: ellipsis;display: -webkit-box;
   								-webkit-line-clamp: 6;-webkit-box-orient: vertical;">
   								${list.intro }
   							</p>
							<a href="${path }/web/view_detail?vid=${list.id}" target="_blank" title="">
                                <span class="rev-total">
                                   <em>
                                      ${list.location }
                                    </em> 
                                </span>
                            </a>
                            
						</div>
					</div>
					<div class="pic">
						<a href="${path }/web/view_detail?vid=${list.id}" target="_blank" title="黄姚古镇">
							<div class="large">
								<c:choose>
									<c:when test="${list.viewphoto==null || list.viewphoto =='' }">
										<img width="380" height="270"  src="${path}/images/icon/view.jpg">
									</c:when>
									<c:otherwise>
										<img width="320" height="170"  src="${path}${list.viewphoto }" />
									</c:otherwise>
								</c:choose>
							</div>
							<div>
								<c:choose>
									<c:when test="${list.viewphoto==null || list.viewphoto =='' }">
										<img width="185" height="130" src="${path}/images/icon/view.jpg">
									</c:when>
									<c:otherwise>
										<img width="185" height="130"  src="${path}${list.viewphoto }" />
									</c:otherwise>
								</c:choose>
							</div>
							<div>
								<c:choose>
									<c:when test="${list.viewphoto==null || list.viewphoto =='' }">
										<img width="185" height="130"  src="${path}/images/icon/view.jpg">
									</c:when>
									<c:otherwise>
										<img width="185" height="130"  src="${path}${list.viewphoto }" />
									</c:otherwise>
								</c:choose>
							</div>
						</a>
					</div>
				</div>
				</c:forEach>
			</div>
		</div>
		<div class="row row-hotScenic row-bg" data-cs-p="热门景点">
			<div class="wrapper">
				<h2 class="title">热门景点</h2>
				<div class="bd">
				<c:forEach items="${viewrementop }" var="list">
					<div class="grid">
						<div class="figure">
							<a href="${path }/web/view_detail?vid=${list.id}" target="_blank" title="">
								<c:choose>
									<c:when test="${list.viewphoto==null || list.viewphoto =='' }">
										<img width="242" height="155"  src="${path}/images/icon/view.jpg">
									</c:when>
									<c:otherwise>
										<img width="242" height="155"  src="${path}${list.viewphoto }" />
									</c:otherwise>
								</c:choose>
								<h3 class="title">${list.vname }</h3>
								<div class="mask-container">
									<div class="mask">
										<div class="middle">
											<h3>${list.vname }</h3>
											<div style="overflow: hidden;text-overflow: ellipsis;display: -webkit-box;
   										 	-webkit-line-clamp: 2;-webkit-box-orient: vertical;">${list.intro }</div>
										</div>
									</div>
								</div>
							 </a>
						</div>
					 </div>
					</c:forEach>
				</div>
			</div>
		</div>
		<div class="row row-allScenic" id="addview">
			<div class="wrapper">
				<h2 class="title">
                	贺州全部景点               
            	</h2>
				<ul class="nav clearfix">
					<li class="on">
						<a title="全部景点">全部景点</a>
					</li>
				</ul>
				<div class="bd">
					<ul class="scenic-list clearfix">
						<c:forEach items="${viewList }" var="list">
						<li>
							<a href="${path }/web/view_detail?vid=${list.id}" target="_blank" title="">
								<div class="img">
									<c:choose>
										<c:when test="${list.viewphoto==null || list.viewphoto =='' }">
											<img width="192" height="130"  src="${path}/images/icon/view.jpg">
										</c:when>
										<c:otherwise>
											<img width="192" height="130"  src="${path}${list.viewphoto }" />
										</c:otherwise>
									</c:choose>
								</div>
								<h3>${list.vname }</h3>
							</a>
						</li>
						</c:forEach>
					</ul>
				</div>
				<div class="_j_tn_pagination">
					<div align="right" class="m-pagination">
						<span class="count">共<span>${page.pages }</span>页 / <span>${page.total }</span>条</span>
						<a class="pi pg-next" <c:if test="${page.pageNum != page.firstPage}"> href=${paht}/web/view?currentPage=${page.pageNum - 1 }&&#addview"</c:if> <c:if test="${page.pageNum == page.firstPage}"> href="javascript:void(0)" class="disabled"</c:if>  title="前一页">前一页</a>
						 <c:forEach begin="1" end="${page.pages }" varStatus="status">
							<a class="pi _j_pageitem" href="${path}/web/view?currentPage=${status.count }&&#addview" <c:if test="${status.count == page.pageNum}">class="select"</c:if>>${status.count }</a>
						</c:forEach>
						<a class="pi pg-next" <c:if test="${page.pageNum == page.lastPage}">class="disabled" href="javascript:void(0)"</c:if> <c:if test="${page.pageNum != page.lastPage}">href="${path}/web/view?currentPage=${page.pageNum + 1 }&&#addview"</c:if>   title="后一页">后一页</a>
					</div>
				</div>
			</div>
		</div>
		<%@include file="../common/footer.jsp"%>
	</body>

</html>