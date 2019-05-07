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
		<title>我的游记</title>
		<link href="${path}/style/personal1/personal1_1.css" rel="stylesheet" />
		<link href="${path}/style/personal1/personal1_2.css" rel="stylesheet" />
		<script src="${path}/style/js/jquery/2.0.0/jquery.min.js" type="text/javascript"></script>
		<script src="${path}/style/common/js/BrowserState.js" type="text/javascript"></script>
		<script src="${path}/style/personal1/personal1_1.js" type="text/javascript"></script>
		<script src="${path}/style/personal1/personal1_2.js" type="text/javascript"></script>
	</head>

	<body style="position: relative;">
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
							<li  class="on">
								<a class="tags_link" href="${path }/web/mynotes?id=${user.id}" title="我的游记">我的游记</a>
							</li>
							<li>
								<a class="tags_link" href="${path }/web/myvieworder?id=${user.id}" title="景点订单">门票订单</a>
							</li>
							<li >
								<a class="tags_link" href="${path }/web/myhotelorder?id=${user.id}" title="景点订单">酒店订单</a>
							</li>
							<li>
								<a class="tags_link" href="${path }/web/myvcomment?id=${user.id}" title="景点点评">景点点评</a>
							</li>
							<li >
								<a class="tags_link" href="${path }/web/myhcomment?id=${user.id}" title="酒店点评">酒店点评</a>
							</li>
							<li>
								<a class="tags_link" href="${path }/web/myfcomment?id=${user.id}" title="美食点评">美食点评</a>
							</li>
						</ul>
					</div>
				</div>
			</div>
			<div class="center clearfix">
				<div class="side_bar note_side flt1">
					<div class="MGuestbook">
						<div class="MGuestTitle">最新游记</div>
						<div class="MUsersBehavior"></div>
						<div class="MGuestList">
							<div class="MReplyAtom">
								<ul>
								<c:forEach items="${noteslist }" var="list">
									<li>
										<dl>
											<dt class="clearfix">
                                                <a href="${path }/web/mynotes_detail?id=${list.id}&&uid=${user.id }" target="_blank" class="MGuestName" title="${list.notesname }">${list.notesname }</a>
                                            	<p>${list.notestime }</p>
                                            	<div style="font-size:12px;overflow: hidden;text-overflow: ellipsis;display: -webkit-box;
   												 -webkit-line-clamp: 2;-webkit-box-orient: vertical;text-indent:2em;">
													${list.notescomment }
												</div>
                                            </dt>
										</dl>
									</li>
									</c:forEach>
								</ul>
							</div>
						</div>
					</div>
				</div>
				<div class="content  flt2">
					<div class="common_block my_notes">
						<div class="common_title clearfix">
							<div class="MAvaMore clearfix">
								<div class="MAvaNums">
									<strong>${notestotal }</strong>
									<p>游记</p>
								</div>
								<div class="MAvaNums last">
									<strong>${all }</strong>
									<p>阅读</p>
								</div>
							</div>
						</div>
						<div id="article_list">
							<div class="notes_list" style="height: auto;">
								<ul>
								<c:forEach items="${notes }" var="list">
									<li >
										<dl>
											<dd>
												<div class="note_title clearfix">
													<div class="note_info">
														<h3>
	                                                         <a href="${path }/web/mynotes_detail?id=${list.id}&&uid=${user.id }" target="_blank" title="${list.notesname }">${list.notesname}</a>
														</h3>
														<div class="note_more">
															<span class="MInfoNum">阅读：<em>${list.nreadnum }</em></span>
															<span class="time">${list.notestime }</span>
														</div>
													</div>
												</div>
												<div class="note_word" style="font-size:15px;overflow: hidden;text-overflow: ellipsis;display: -webkit-box;
   												 -webkit-line-clamp: 3;-webkit-box-orient: vertical;text-indent:2em;">
													${list.notescomment }
												</div>
											</dd>
										</dl>
									</li>
								</c:forEach>
								</ul>
							</div>
						</div>
						<div align="right" class="m-pagination _j_pager_content">
							<span class="count">共<span>${page.pages }</span>页 / <span>${page.total }</span>条</span>
							<a class="pg-next _j_pageitem" <c:if test="${page.pageNum != page.firstPage}"> href=${paht}/web/mynotes?currentPage=${page.pageNum - 1 }&&id=${uid }"</c:if> <c:if test="${page.pageNum == page.firstPage}"> href="javascript:void(0)" class="disabled"</c:if>  title="前一页">前一页</a>
							 <c:forEach begin="1" end="${page.pages }" varStatus="status">
								<a class="pi _j_pageitem" href="${path}/web/mynotes?currentPage=${status.count }&&id=${uid }" <c:if test="${status.count == page.pageNum}">class="select"</c:if>>${status.count }</a>
							</c:forEach>
							<a class="pg-next _j_pageitem" <c:if test="${page.pageNum == page.lastPage}">class="disabled" href="javascript:void(0)"</c:if> <c:if test="${page.pageNum != page.lastPage}">href="${path}/web/mynotes?currentPage=${page.pageNum + 1 }&&id=${uid }"</c:if>   title="后一页">后一页</a>
						</div>
					</div>
				</div>
			</div>
		</div>
		<%@include file="../common/footer.jsp"%>
	</body>

</html>