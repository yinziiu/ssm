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
		<title>我的主页</title>
		<link href="${path}/style/personal1/personal1_1.css" rel="stylesheet" />
		<link href="${path}/style/personal1/personal1_2.css" rel="stylesheet" />
		<script src="${path}/style/js/jquery/2.0.0/jquery.min.js" type="text/javascript"></script>
		<script src="${path}/style/common/js/BrowserState.js" type="text/javascript"></script>
		<script src="${path}/style/personal1/personal1_1.js" type="text/javascript"></script>
		<script src="${path}/style/personal1/personal1_2.js" type="text/javascript"></script>
		<style type="text/css">
		
			body{
				background: url("${path}/images/icon/ban.jpg");
				margin: 0 auto;
				background-size: 100% 100%;
			}
			.main{
				margin-top: -48px;
			}
		</style>
	</head>

	<body style="position: relative;">
		<%@include file="../common/head1.jsp"%>
		<div class="main">
			<div class="banner">
				<div class="banner_img banner_note" id="_j_banner">
					<img alt="banner" src="${path}/images/icon/ban3.jpg" width="100%" height="260px">
				</div>
				<div class="tags_bar">
					<div class="center clearfix">
						<ul class="flt2">
							<li class="on">
								<a class="tags_link" href="${path }/web/personal?id=${user.id}" title="我的窝">我的窝</a>
							</li>
							<li >
								<a class="tags_link" href="${path }/web/mynotes?id=${user.id}" title="我的游记">我的游记</a>
							</li>
							<li>
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
			<div class="center clearfix">
				<div class="side_bar flt1">
					<div class="MAvatar">
						<div class="MAvaImg hasAva">
							<c:choose>
								<c:when test="${user.photo==null || user.photo =='' }">
									<img src="${path}/images/icon/1.jpeg" height="120" width="120" alt="${user.username }">
								</c:when>
								<c:otherwise>
									<img src="${path}${user.photo }" height="120" width="120" alt="${user.username }" />
								</c:otherwise>
							</c:choose>
							<a href="${path }/web/useravatar" class="MAvaUp"></a>
						</div>
						<div class="MAvaName">
							${user.username }
						</div>
						<div id="_j_profilearea" class="MAvaProfile">
							<div class="MProfile _j_showintrobox" data-intro="${user.resume }">
								<pre>个性签名：${user.resume }</pre>
							</div>
						</div>
					</div>
				</div>
				<div class="content flt2">
					<div class="common_block main_links">
						<ul class="clearfix">
							<li>
								<a href="${path }/web/writenotes" target="_blank"><span>写游记</span></a>
							</li>
							<li>
								<a href="${path }/web/strategy" target="_blank"><span>看攻略</span></a>
							</li>
							<li>
								<a href="${path}/web/notes" target="_blank"><span>看游记</span></a>
							</li>
							<li class="last">
								<a href="${path}/web/shop" target="_blank"><span>逛商城</span></a>
							</li>
						</ul>
					</div>

					<div class="common_block my_notes">
						<div class="notes_list">
							<ul>
							<c:forEach items="${notes }" var="list">
								<li>
									<dl>
										<dd>
											<div class="note_title clearfix">
												<div class="note_info">
													<h3>
                                                      <a href="${path }/web/mynotes?id=${user.id}"  title="${list.notesname }">${list.notesname }</a>
                                                    </h3>
													<div class="note_more">
														<span class="MInfoNum">浏览：<em>${list.nreadnum }</em></span>
														<span class="time">${list.notestime }</span>
													</div>
												</div>
											</div>
										</dd>
									</dl>
								</li>
								</c:forEach>
							</ul>
						</div>
						<div class="more_notes">
							<a href="${path }/web/mynotes?id=${user.id}">共<strong>${notestotal }</strong>篇游记 </a>
						</div>
					</div>
					
					<div class="common_block my_ask my_dp" id="_j_commentwrap">
						<div class="dp_list">
							<ul>
							<c:forEach items="${viewComments }" var="list">
								<li class="">
									<dl>
										<dt>
                        					<div class="dp_title">
                        						<a href="${path }/web/myvcomment?id=${user.id}" ><span>${list.vname }</span></a>
                        					</div>
                   						 </dt>
										<dd>
											<div class="dp_detail">
												<div class="dp_word">${list.vcomment }</div>
												<div class="dp_pics">
													<ul class="clearfix">
														<li>
															<a href="${path }/web/myvcomment?id=${user.id}">
																<c:choose>
																	<c:when test="${list.viewphoto==null || list.viewphoto =='' }">
																		<img src="${path}/images/icon/view.jpg" alt="${list.vname }">
																	</c:when>
																	<c:otherwise>
																		<img src="${path}${list.viewphoto }"  alt="${list.vname }" />
																	</c:otherwise>
																</c:choose>
															</a>
														</li>
													</ul>
												</div>
											</div>
										</dd>
									</dl>
								</li>
							</c:forEach>
							</ul>
						</div>
						<div class="more_notes">
							<a href="${path }/web/myvcomment?id=${user.id}">共<strong>${vcommenttotal }</strong>景点点评</a>
						</div>
					</div>
					<div class="common_block my_ask my_dp" id="_j_commentwrap">
						<div class="dp_list">
							<ul>
							<c:forEach items="${hotelComments }" var="list">
								<li class="">
									<dl>
										<dt>
                        					<div class="dp_title">
                        						<a href="${path }/web/myhcomment?id=${user.id}" ><span>${list.hname }</span></a>
                        					</div>
                   						 </dt>
										<dd>
											<div class="dp_detail">
												<div class="dp_word">${list.hcomment }</div>
												<div class="dp_pics">
													<ul class="clearfix">
														<li>
															<a href="${path }/web/myhcomment?id=${user.id}">
																<c:choose>
																	<c:when test="${list.hphoto==null || list.hphoto =='' }">
																		<img src="${path}/images/icon/hotel.jpg" alt="${list.hname }">
																	</c:when>
																	<c:otherwise>
																		<img src="${path}${list.hphoto }"  alt="${list.hname }" />
																	</c:otherwise>
																</c:choose>
															</a>
														</li>
													</ul>
												</div>
											</div>
										</dd>
									</dl>
								</li>
							</c:forEach>
							</ul>
						</div>
						<div class="more_notes">
							<a href="${path }/web/myhcomment?id=${user.id}">共<strong>${hcommenttotal }</strong>酒店点评</a>
						</div>
					</div>
					<div class="common_block my_ask my_dp">
						<div class="dp_list">
							<ul>
							<c:forEach items="${foodComments }" var="list">
								<li class="">
									<dl>
										<dt>
                        					<div class="dp_title">
                        						<a href="${path }/web/myfcomment?id=${user.id}" ><span>${list.fname }</span></a>
                        					</div>
                   						 </dt>
										<dd>
											<div class="dp_detail">
												<div class="dp_word">${list.fcomment }</div>
												<div class="dp_pics">
													<ul class="clearfix">
														<li>
															<a href="${path }/web/myfcomment?id=${user.id}">
																<c:choose>
																	<c:when test="${list.fphoto==null || list.fphoto =='' }">
																		<img src="${path}/images/icon/food.jpg" alt="${list.fname }">
																	</c:when>
																	<c:otherwise>
																		<img src="${path}${list.hphoto }"  alt="${list.fname }" />
																	</c:otherwise>
																</c:choose>
															</a>
														</li>
													</ul>
												</div>
											</div>
										</dd>
									</dl>
								</li>
							</c:forEach>
							</ul>
						</div>
						<div class="more_notes">
							<a href="${path }/web/myfcomment?id=${user.id}">共<strong>${fcommenttotal }</strong>美食点评</a>
						</div>
					</div>
				</div>
			</div>
		</div>

		<%@include file="../common/footer.jsp"%>

	</body>
</html>