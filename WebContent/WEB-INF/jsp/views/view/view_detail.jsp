<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="com.hz.model.User"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set value="${pageContext.request.contextPath}" var="path" scope="page" />
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<script type="text/javascript">
	var path = "${path}";
</script>
<html>

	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>景点详情</title>
		<link href="${path}/style/view_detail/map-mark.v2.css" rel="stylesheet" />
		<link href="${path}/style/view_detail/mfw-reviews.css" rel="stylesheet" />
		<link href="${path}/style/view_detail/style1536672475627.css" rel="stylesheet" />
		<link href="${path}/style/view_detail/view_detail1.css" rel="stylesheet" />
		<link href="${path}/style/view_detail/view_detail2.css" rel="stylesheet" />
		<link href="${path}/style/view_detail/view_detail3.css" rel="stylesheet" />
		<script src="${path}/style/js/jquery/2.0.0/jquery.min.js" type="text/javascript"></script>
		<script src="${path}/style/common/js/BrowserState.js" type="text/javascript"></script>
		<script src="${path}/style/view_detail/index.js" type="text/javascript"></script>
		<script src="${path}/style/view_detail/jquery.upnum.js" type="text/javascript"></script>
		<script src="${path}/style/view_detail/view_detail1.js" type="text/javascript"></script>
		<script src="${path}/style/view_detail/view_detail2.js" type="text/javascript"></script>

		<body style="position: relative;">

			<%@include file="../common/head.jsp"%>

			<div class="container" data-cs-t="景点详情页">
				<c:forEach items="${list }" var="list">
					<div class="row row-top">
						<div class="wrapper">
							<div class="crumb" >
								<div class="item">
									<a href="${path}/web/index">首页</a><em>&gt;</em></div>
								<div class="item">
									<a href="${path}/web/view">景点</a><em>&gt;</em></div>
								<div class="item cur">${vname }</div>
							</div>
							<div class="title">
								<h1>${list.vname }</h1>
								<div class="en"></div>
							</div>
							<div class="r-nav" id="poi-navbar">
								<ul class="clearfix">
									<li class="on">
										<a title="概况">概况</a>
									</li>
									<li>
										<a title="点评" href="#commentList">点评<span>（${total }条）</span></a>
									</li>
									<c:if test="${dbuser!=null }">
										<li class="nav-right" style="margin-top: 10px;">
											<a class="btn-reviews" href="#dianping" title="我要点评">我要点评</a>
										</li>
									</c:if>
									<c:if test="${dbuser==null }">
										<li class="nav-right" style="margin-top: 10px;">
											<a class="btn-reviews" href="${path }/web/login" title="我要点评">登录可点评</a>
										</li>
									</c:if>
								</ul>
							</div>
						</div>
					</div>
					<div>
						<div class="row row-picture row-bg">
							<div class="wrapper">
								<a class="photo" href="">
									<div class="bd">
										<div class="pic-big">
											<c:choose>
												<c:when test="${list.viewphoto==null || list.viewphoto =='' }">
													<img width="690" height="370" src="${path}/images/icon/view.jpg">
												</c:when>
												<c:otherwise>
													<img width="690" height="370" src="${path}${list.viewphoto }" />
												</c:otherwise>
											</c:choose>
										</div>
										<div class="pic-small">
											<c:choose>
												<c:when test="${list.viewphoto==null || list.viewphoto =='' }">
													<img width="305" height="183" src="${path}/images/icon/view.jpg">
												</c:when>
												<c:otherwise>
													<img width="305" height="183" src="${path}${list.viewphoto }" />
												</c:otherwise>
											</c:choose>
										</div>
										<div class="pic-small">
											<c:choose>
												<c:when test="${list.viewphoto==null || list.viewphoto =='' }">
													<img width="305" height="183" src="${path}/images/icon/view.jpg">
												</c:when>
												<c:otherwise>
													<img width="305" height="183" src="${path}${list.viewphoto }" />
												</c:otherwise>
											</c:choose>
										</div>
									</div>
								</a>
							</div>
						</div>
					</div>
					<div class="mod mod-detail" data-cs-p="概况">
						<p style="font-size: 20px;color: orange;">简介:</p>
						<div class="summary" style="font-size: 15px;text-indent: 2em;padding-top: 5px;">
							${list.intro }
						</div>

						<ul class="baseinfo clearfix">
							<li class="item-time">
								<div class="label">景点位置</div>
								<div class="content">${list.location }</div>
							</li>
							<li class="item-time">
								<div class="label">用时参考</div>
								<c:if test="${not empty list.usertime }">
									<div class="content">${list.usertime }</div>
								</c:if>
								<c:if test="${empty list.usertime }">
									<div class="content">自己去体会哦！</div>
								</c:if>
							</li>
							<li class="item-time">
								<div class="label">开放时间</div>
								<div class="content">${list.opentime }</div>
							</li>
						</ul>
						<dl>
							<dt>门票</dt>
							<c:if test="${not empty list.ticket }">
								<dd>${list.ticket }</dd>
							</c:if>
						</dl>
						<dl>
							<dt>提示</dt>
							<c:if test="${not empty list.tips }">
								<dd>${list.tips }</dd>
							</c:if>
							<c:if test="${empty list.tips }">
								<dd>注意安全哦！</dd>
							</c:if>
						</dl>
						<dl>
							<dt>交通</dt>
							<c:if test="${not empty list.traffic }">
								<dd>${list.traffic }</dd>
							</c:if>
							<c:if test="${empty list.traffic }">
								<dd>详细请查看公交站牌及车站！</dd>
							</c:if>
						</dl>
					</div>
				</c:forEach>
				<c:if test="${not empty viewTickets}">
					<div class="pagelet-block">
						<div class="mod mod-promo" data-cs-p="热门优惠">
							<div class="wrapper">
								<div class="mhd">热门优惠</div>
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
										<c:forEach items="${viewTickets }" var="list">
											<tbody>
												<tr>
													<td class="type">${list.ttype }</td>
													<td class="pro">
														<a href="${path }/web/view_order?id=${list.id}&&vid=${list.vid}" target="_blank" title="${list.tname }">${list.tname }</a>
													</td>
													<td class="price">￥${list.tprice }起</td>
													<c:if test="${dbuser!=null }">
														<td class="action">
															<a class="btn" href="${path }/web/view_order?id=${list.id}&&vid=${list.vid }" target="_blank" title="预订">预订</a>
														</td>
													</c:if>
													<c:if test="${dbuser==null }">
														<td class="action">
															<a class="btn" href="${path}/web/login" target="_blank" title="登录">登录</a>
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
				</c:if>

				<!-- 内部景点 S -->
				<div>
					<div class="pagelet-block row-bg">
						<div class="mod mod-innerScenic">
							<div class="mhd">其他景点</div>
							<div class="mbd">
								<ul class="clearfix">
									<c:forEach items="${viewList }" var="list">
										<li>
											<a href="${path }/web/view_detail?vid=${list.id}" title="${list.vname }">
												<c:choose>
													<c:when test="${list.viewphoto==null || list.viewphoto =='' }">
														<img width="235" height="150"  src="${path}/images/icon/view.jpg">
													</c:when>
													<c:otherwise>
														<img width="235" height="150"  src="${path}${list.viewphoto }" />
													</c:otherwise>
												</c:choose>
												<div class="info">
													<h3>${list.vname }</h3>
													<span><em>${list.vreadnum }</em>人浏览</span>
												</div>
											</a>
										</li>
									</c:forEach>
								</ul>
							</div>
							<br>
							<div class="more more-subpoi">
								<a class="btn-subpoi" href="${path}/web/view">查看更多</a>
							</div>
						</div>
					</div>
				</div>
			</div>

			<!-- 评论列表 S -->
			<div id="commentList">
				<div class="pagelet-block">
					<div class="mod mod-reviews">
						<div class="mhd mhd-large">点评<span>（共有<em>${total }</em>条真实评价）</span></div>
						<c:if test="${total==0 }">
							<p style="color: orange;text-align: center;">暂无点评，快来
								<a>占沙发</a>........</p>
						</c:if>
						<c:if test="${total!=0 }">
							<div class="review-nav">
								<ul class="clearfix">
									<li class="on"><span class="divide"></span>
										<a href="javascript:void(0);"><span>全部</span></a>
									</li>
								</ul>
							</div>
							<div class="_j_commentlist">
								<div class="rev-list">
									<ul>
										<c:forEach items="${listVcomment }" var="list">
											<li class="rev-item comment-item clearfix">
												<div class="user">
													<a class="avatar" href="" target="_blank">
														<c:choose>
															<c:when test="${list.photo==null || list.photo =='' }">
																<img width="48" height="48" src="${path}/images/icon/1.jpeg">
															</c:when>
															<c:otherwise>
																<img width="48" height="48" src="${path}${list.photo }" />
															</c:otherwise>
														</c:choose>
													</a>
												</div>
												<a class="name" href="" target="_blank">${list.username }</a>
												<span class="s-star s-star5"></span>
												<a href="" target="_blank"><span class="icon-goldComment"></span></a>
												<p class="rev-txt">
													${list.vcomment }
												</p>

												<div class="rev-img">
													<a href="" target="_blank">
														<c:choose>
															<c:when test="${list.vphoto==null || list.vphoto =='' }">
																<img width="200" height="120" src="${path}/images/icon/view.jpg">
															</c:when>
															<c:otherwise>
																<img width="200" height="120" src="${path }${list.vphoto}" />
															</c:otherwise>
														</c:choose>
													</a>
												</div>
												
												<div class="info clearfix">
													<c:if test="${dbuser.username eq list.username }">
														<a class="_j_editcomment" href="#dianping" style="margin-right: 15px;" title="编辑点评">编辑</a>
													</c:if>
													<span class="time">${list.vcommenttime }</span>
												</div>
											</li>
										</c:forEach>
									</ul>
								</div>

								<div align="right" class="m-pagination">
									<span class="count">共<span>${page.pages }</span>页 / <span>${page.total }</span>条</span>
									<a class="pi pg-next" <c:if test="${page.pageNum != page.firstPage}"> href=${paht}/web/view_detail?currentPage=${page.pageNum - 1 }&&id=${vid }&&#commentList"</c:if> <c:if test="${page.pageNum == page.firstPage}"> href="javascript:void(0)" class="disabled"</c:if>  title="前一页">前一页</a>
									 <c:forEach begin="1" end="${page.pages }" varStatus="status">
										<a class="pi _j_pageitem" href="${path}/web/view_detail?currentPage=${status.count }&&id=${vid }&&#commentList" <c:if test="${status.count == page.pageNum}">class="select"</c:if>>${status.count }</a>
									</c:forEach>
									<a class="pi pg-next" <c:if test="${page.pageNum == page.lastPage}">class="disabled" href="javascript:void(0)"</c:if> <c:if test="${page.pageNum != page.lastPage}">href="${path}/web/view_detail?currentPage=${page.pageNum + 1 }&&id=${vid }&&#commentList"</c:if>   title="后一页">后一页</a>
								</div>
							</div>
						</c:if>
					</div>
				</div>
			</div>
			<!-- 评论列表 E -->

			<div>
				<div class="pagelet-block">
					<div class="row row-nearby row-bg">
						<div class="wrapper">
							<div class="mhd">热门美食</div>
							<div class="mbd">
								<ul class="poi-list clearfix">
									<c:forEach items="${hotList }" var="list">
										<li class="poi-card">
											<a href="${path }/web/food_detail?fid=${list.id}" target="_blank">
												<div class="img">
													<c:choose>
														<c:when test="${list.fphoto==null || list.fphoto =='' }">
															<img alt="${list.fname }" width="320" height="170" src="${path}/images/icon/food.jpg">
														</c:when>
														<c:otherwise>
															<img alt="${list.fname }" width="320" height="170" src="${path}${list.fphoto }" />
														</c:otherwise>
													</c:choose>
												</div>
												<div class="info">
													<h4 title="${list.fname }">${list.fname }</h4>
													<div class="dist">地址：${list.address }</div>
													<span class="rev-num"><b>${list.freadnum }</b>人浏览</span><br>
												</div>
											</a>
										</li>
									</c:forEach>
								</ul>
							</div>
						</div>
					</div>
				</div>
				<!-- 附近美食 E -->

				<!-- 附近酒店 S -->
				<div class="pagelet-block">
					<div class="row row-nearby">
						<div class="wrapper">
							<div class="r-title">
								<h2>热门酒店</h2>
							</div>
							<div class="mbd">
								<ul class="poi-list clearfix">
									<c:forEach items="${hotelList }" var="list">
										<li class="poi-card">
											<a href="${path }/web/hotel_detail?hid=${list.id}" target="_blank">
												<div class="img">
													<c:choose>
														<c:when test="${list.hphoto==null || list.hphoto =='' }">
															<img alt="${list.hname }" width="320" height="170" src="${path}/images/icon/hotel.jpg">
														</c:when>
														<c:otherwise>
															<img alt="${list.hname }" width="320" height="170" src="${path}${list.hphoto }" />
														</c:otherwise>
													</c:choose>
												</div>
												<div class="info">
													<h4 title="${list.hname }">${list.hname }</h4>
													<div class="dist">地址：${list.address }</div>
													<span class="rev-num"><b>${list.hreadnum }</b>人浏览</span><br>
												</div>
											</a>
										</li>
									</c:forEach>
								</ul>
							</div>
						</div>
					</div>
				</div>
			</div>

			<!-- 点评 S -->
			<c:if test="${dbuser==null }">
				<div id="dianping">
					<div class="pagelet-block">
						<div class="row row-nearby row-bg">
							<p style="text-align: center;font-size: 16px;color: orange;">亲爱的游客，您还没有登录，点评需要登录哦，您可以选择一下按钮操作。</p>
							<div align="center" style="padding-top: 10px;">
								<a style="font-size: 16px;color: orange;" href="${path}/web/login">登录</a>&nbsp;&nbsp;/&nbsp;&nbsp;
								<a style="font-size: 16px;color: orange;" href="${path}/web/register">注册</a>
							</div>
						</div>
					</div>
				</div>
			</c:if>
			<c:if test="${dbuser!=null }">
				<div id="dianping">
					<div class="row row-reviewForm row-bg">
						<div class="wrapper ">
						
							<c:if test="${empty listVcomment }">
							<div class="mfw-reviews">
								<div id="_j_commentform_cnt ">
									<h2>
								        <strong>${vname }</strong>
								        <em>*</em>为必填选项
							    	</h2>
							    
									<form action="${path}/saveVComment"  id="saveViewComent" method="post" class="_j_commentdialogform" enctype="multipart/form-data">
										<div class="review-item item-comment" style="display: none;">
											<div class="label">用户id</div>
											<div class="content">
												<input name="uid" id="uid" value="${dbuser.id }"/>
											</div>
										</div>
										<div class="review-item item-comment" style="display: none;">
											<div class="label">景点id</div>
											<div class="content">
												<input name="vid" id="vid" value="${vid }"/>
											</div>
										</div>
										<div class="review-item item-comment" >
											<div class="label"><em>*</em>评价</div>
											<div class="content">
												<textarea class="_j_commentarea" name="vcomment" id="vcomment"  data-inputname="点评内容" placeholder="详细、客观、真实，130字以上为佳！" data-minlen="15" data-maxlen="1000"></textarea>
												<p class="_j_commentcounttip">15-1000个字</p>
											</div>
										</div>
										<div class="review-item item-comment" >
											<div class="label">上传图片</div>
											<div class="content">
												<input name="vphotopic" id="vphotopic" type="file"/>
											</div>
										</div>
										<div class="review-item item-action">
											<button onclick="save();" style="margin: 0;padding: 0;border: 1px solid transparent;outline: none;  " class="btn-large _j_submit"  type="submit" >
												提交点评
											</button>
										</div>
									</form>
								</div>
							</div>
						</c:if>
						<c:forEach items="${listVcomment }" var="list">
						<c:if test="${dbuser.username eq list.username }">
							<div class="mfw-reviews have-reviews">
								<h2>
				                    <strong>${vname }</strong>
				                </h2>
								<div class="review-item item-star">
									<div class="label">你已评价为</div>
										<form action="${path }/updateVComment" method="post" class="_j_commentdialogform" enctype="multipart/form-data">
											<div class="review-item item-comment" style="display: none">
												<div class="label">id</div>
												<div class="content">
													<input name="id" id="id" value="${list.id }"/>
												</div>
											</div>
											<div class="review-item item-comment" style="display: none">
												<div class="label">用户id</div>
												<div class="content">
													<input name="uid" id="uid" value="${list.uid }"/>
												</div>
											</div>
											<div class="review-item item-comment" style="display: none">
												<div class="label">景点id</div>
												<div class="content">
													<input name="vid" id="vid" value="${vid }"/>
												</div>
											</div>
											<div class="review-item item-comment">
												<div class="content">
													<textarea class="_j_commentarea" name="vcomment" id="vcomment" essential="1" data-inputname="点评内容" placeholder="详细、客观、真实，130字以上为佳！" data-minlen="15" data-maxlen="1000">${list.vcomment }</textarea>
													<p class="_j_commentcounttip">15-1000个字</p>
												</div>
											</div>
											<div class="review-item item-action">
												<button  style="margin: 0;padding: 0;border: 1px solid transparent;outline: none;  " class="btn-large _j_submit"  type="submit" >
													修改点评
												</button>
											</div>
										</form>
										<br>
										<form action="${path }/updateVCommentPhoto" method="post" enctype="multipart/form-data">
											<c:if test="${! empty list.vphoto }">
												<div class="review-item item-comment" style="display: none">
													<div class="label">id</div>
													<div class="content">
														<input name="id" id="id" value="${list.id }"/>
													</div>
												</div>
												<div class="review-item item-comment" style="display: none">
													<div class="label">用户id</div>
													<div class="content">
														<input name="uid" id="uid" value="${list.uid }"/>
													</div>
												</div>
												<div class="review-item item-comment" style="display: none">
													<div class="label">景点id</div>
													<div class="content">
														<input name="vid" id="vid" value="${vid }"/>
													</div>
												</div>
												<div class="review-item item-comment" >
													<div class="label"></div>
													<div class="content" style="margin-left: 80px;">
														<img width="120px" height="90px" alt="点评图片" src="${path }${list.vphoto}">
													</div>
												</div>
												<div class="review-item item-comment" >
													<div class="label">上传图片</div>
													<div class="content">
														<input name="vphotopic" id="vphotopic" type="file"/>
													</div>
												</div>
												<div class="review-item item-action">
													<button onclick="save();" style="margin: 0;padding: 0;border: 1px solid transparent;outline: none;  " class="btn-large _j_submit"  type="submit" >
														修改点评图片
													</button>
												</div>
											</c:if>
											<c:if test="${ empty list.vphoto }">
												<div class="review-item item-comment" style="display: none">
													<div class="label">id</div>
													<div class="content">
														<input name="id" id="id" value="${list.id }"/>
													</div>
												</div>
												<div class="review-item item-comment" style="display: none">
													<div class="label">用户id</div>
													<div class="content">
														<input name="uid" id="uid" value="${list.uid }"/>
													</div>
												</div>
												<div class="review-item item-comment" style="display: none">
													<div class="label">景点id</div>
													<div class="content">
														<input name="vid" id="vid" value="${vid }"/>
													</div>
												</div>
												<div class="review-item item-comment" >
													<div class="label"></div>
													<div class="content" style="margin-left: 80px;">
														<img width="90px" height="90px" alt="点评图片" src="${path }${list.vphoto}">
													</div>
												</div>
												<div class="review-item item-comment" >
													<div class="label">上传图片</div>
													<div class="content">
														<input name="vphotopic" id="vphotopic" type="file"/>
													</div>
												</div>
												<div class="review-item item-action">
													<button onclick="save();" style="margin: 0;padding: 0;border: 1px solid transparent;outline: none;  " class="btn-large _j_submit"  type="submit" >
														上传点评图片
													</button>
												</div>
											</c:if>
										</form>
									</div>
								</div>
								</c:if>
							</c:forEach>
						</div>
					</div>
				</div>
			</c:if>
			<%@include file="../common/footer.jsp"%>
			
		</body>

</html>