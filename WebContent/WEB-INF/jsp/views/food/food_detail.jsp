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
		<title>美食详情</title>
		<link href="${path}/style/cate_detail/cate_detail1.css" rel="stylesheet" />
		<link href="${path}/style/cate_detail/cate_detail2.css" rel="stylesheet" />
		<link href="${path}/style/cate_detail/cate_detail3.css" rel="stylesheet" />
		<link href="${path}/style/cate_detail/mfw-reviews.css" rel="stylesheet" />
		<link href="${path}/style/cate_detail/poi-nav.css" rel="stylesheet" />
		<link href="${path}/style/cate_detail/style1536672475627.css" rel="stylesheet" />
		<script src="${path}/style/js/jquery/2.0.0/jquery.min.js" type="text/javascript"></script>
		<script src="${path}/style/common/js/BrowserState.js" type="text/javascript"></script>
		<script src="${path}/style/cate_detail/cate_detail1.js" type="text/javascript"></script>
		<script src="${path}/style/cate_detail/cate_detail2.js" type="text/javascript"></script>
		<script src="${path}/style/cate_detail/jquery.upnum.js" type="text/javascript"></script>
	</head>

	<body style="position: relative;">
	
		<%@include file="../common/head.jsp"%>
		
		<div class="wrapper">
			<div class="top-info clearfix">
				<div class="crumb ">
					<div class="item">
						<a href="${path}/web/food" target="_blank">美食</a><em>&gt;</em>
					</div>
					<div class="item">
						<div class="drop">
							<span class="hd">详情</span>
						</div>
					</div>
				</div>
			</div>
			
			<div class="col-main" data-cs-t="美食详情页">
			<c:forEach items="${foodList }" var="list">
				<div class="m-box m-details clearfix">
					<div class="title clearfix">
						<div class="t">
							<h1>${list.fname }</h1>
						</div>
					</div>
					<div class="txt-l">
						<div class="score">
							<span class="score-info">有<em>${list.freadnum }</em>人浏览了</span>
							<p class="ranking">共有<em>${total }</em>条用户点评</p>
						</div>
						<dl class="i-comm">
							<dt>
            					<span>
			              			<a rel="nofollow" href="" target="_blank">
			              				<c:choose>
											<c:when test="${list.photo==null || list.photo =='' }">
												<img alt="${list.username }" width="32" height="32"
													src="${path}/images/icon/1.jpeg">
											</c:when>
											<c:otherwise>
												<img alt="${list.username }" width="32" height="32"
													src="${path}${list.photo }" />
											</c:otherwise>
										</c:choose>
			              			</a>
			            		</span>
			            		<div>
               						来自 <a rel="nofollow" href="" target="_blank">${list.username }</a>
               					</div>
                			</dt>
							<dd class="quote">
								<div style="overflow: hidden; text-overflow: ellipsis; display: -webkit-box; -webkit-line-clamp: 3; -webkit-box-orient: vertical;"> 
									${list.fcomment }
								</div>
							</dd>
							<c:if test="${dbuser!=null }">
								<dd class="action">
									<a class="btn-orange" href="#anchor_comment">我要点评</a>
								</dd>
							</c:if>
							<c:if test="${dbuser==null }">
								<dd class="action">
									<a class="btn-orange" href="${path }/web/login">点评请登录</a>
								</dd>
							</c:if>
						</dl>
					</div>
					<div class="pic-r">
						<a href="" target="_blank">
							<c:choose>
								<c:when test="${list.fphoto==null || list.fphoto =='' }">
									<img alt="${list.fname }" width="480" height="320"
										src="${path}/images/icon/food.jpg">
								</c:when>
								<c:otherwise>
									<img alt="${list.fname }" width="480" height="320"
										src="${path}${list.fphoto }" />
								</c:otherwise>
							</c:choose>
						</a>
					</div>
				</div>

				<div class="m-box m-content" id="comment_header">
					<div class="tab">
						<span>
							<a href="javascript:void(0);" data-tab="base">餐厅简介</a>
						</span>
					</div>

					<div class="poi-info poi-base tab-div">
						<div class="bd">
							<h3>简介</h3>
							<p>${list.fcontent }</p>
							<h3>地址</h3>
							<p>${list.address }</p>
							<h3>人均消费</h3>
							<p>${list.expense }</p>
						</div>
					</div>
				</div>
			</c:forEach>
			
				
				<div class="m-box m-content" id="comment_header">
					<div class="tab">
						<span>
							<a class="on" href="javascript:void(0);" data-tab="comment"><h2>点评</h2></a>
            				（${total }条）
						</span>
						<c:if test="${total==0 }">
							<p style="color: orange;text-align: center;">暂无点评，快来
								<a>占沙发</a>........</p>
						</c:if>
					</div>
					<div class="poi-comment tab-div">
						<div class="_j_commentlist">
						<c:forEach items="${foodComments }" var="list">
							<div class="comment-item" id="comment_no_159069152">
								<div class="user-bar">
									<span class="user-avatar">
										<a href="" >
											<c:choose>
												<c:when test="${list.photo==null || list.photo =='' }">
													<img alt="${list.username }" width="48" height="48"
														src="${path}/images/icon/1.jpeg">
												</c:when>
												<c:otherwise>
													<img alt="${list.username }" width="48" height="48"
														src="${path}${list.photo }" />
												</c:otherwise>
											</c:choose>
										</a>
									</span>
								</div>
								<div class="comment-info">				
									<div class="info">
										<a class="user-name" href="" target="_blank">${list.username }</a>
										<div class="c-content">
											<p class="rev-txt">${list.fcomment }</p>
										</div>
										<div class="content" style="margin-left: 80px;">
											<img alt="" src="${path }${list.fcphoto}" width="120px;" height="90px">
										</div>
										<div class="add-reply">
											<c:if test="${dbuser.username eq list.username }">
												<a class="_j_editcomment" href="#anchor_comment" style="margin-right: 15px;" title="编辑点评">编辑</a>
											</c:if>
											<div class="ar-hd clearfix">
												<span class="time">${list.fcommenttime }</span>&nbsp;&nbsp;
											</div>
										</div>
									</div>
								</div>
							</div>
							</c:forEach>
						</div>
						<div class="turn_page">
							<div align="right" class="paginator" id="comment_pagebar">
								<span class="count">共<span>${page.pages }</span>页 / <span>${page.total }</span>条</span>
								<a class="pg-next _j_pageitem" <c:if test="${page.pageNum != page.firstPage}"> href=${paht}/web/food_detail?currentPage=${page.pageNum - 1 }&&fid=${fid }&&#comment_header"</c:if> <c:if test="${page.pageNum == page.firstPage}"> href="javascript:void(0)" class="disabled"</c:if>  title="前一页">前一页</a>
								 <c:forEach begin="1" end="${page.pages }" varStatus="status">
									<a class="pi _j_pageitem" href="${path}/web/food_detail?currentPage=${status.count }&&fid=${fid }&&#comment_header" <c:if test="${status.count == page.pageNum}">class="select"</c:if>>${status.count }</a>
								</c:forEach>
								<a class="pg-next _j_pageitem" <c:if test="${page.pageNum == page.lastPage}">class="disabled" href="javascript:void(0)"</c:if> <c:if test="${page.pageNum != page.lastPage}">href="${path}/web/food_detail?currentPage=${page.pageNum + 1 }&&fid=${fid }&&#comment_header"</c:if>   title="后一页">后一页</a>
							</div>
						</div>
					</div>
				</div>
				<c:if test="${dbuser==null }">
					<div class="m-box m-addComm" id="anchor_comment">
						<div>
							<div class="mfw-reviews">
								<div id="_j_commentform_cnt">
									<p style="text-align: center;font-size: 16px;color: orange;">亲爱的游客，您还没有登录，点评需要登录哦，您可以选择一下按钮操作。</p>
									<div align="center" style="padding-top: 10px;">
										<a style="font-size: 16px;color: orange;" href="${path}/web/login">登录</a>&nbsp;&nbsp;/&nbsp;&nbsp;
										<a style="font-size: 16px;color: orange;" href="${path}/web/register">注册</a>
									</div>
								</div>
							</div>
						</div>
					</div>
				</c:if>
				<c:if test="${dbuser!=null }">
				<div class="m-box m-addComm" id="anchor_comment">
					<div>
					<c:if test="${empty foodComments }">
						<div class="mfw-reviews">
							<div id="_j_commentform_cnt">
								<h2>
								    <strong>${fname }</strong>
								    <em>*</em>为必填选项
								</h2>
								<form action="${path }/saveFComment" method="post" class="_j_commentdialogform" enctype="multipart/form-data">
									<input type="text" name="uid" id="uid" value="${dbuser.id }" style="display: none;">
									<input type="text" name="fid" id="fid" value="${fid }" style="display: none;">
									<div class="review-item item-comment">
										<div class="label"><em>*</em>评价</div>
										<div class="content">
											<textarea class="_j_commentarea" name="fcomment" id="fcomment" data-inputname="点评内容" placeholder="详细、客观、真实，130字以上为佳！上传图片会加分哦！" data-minlen="15" data-maxlen="1000"></textarea>
											<p class="_j_commentcounttip">15-1000个字</p>
										</div>
									</div>
									<div class="review-item item-comment" >
										<div class="label">上传图片</div>
										<div class="content">
											<input name="fphotopic" id="fphotopic" type="file"/>
										</div>
									</div>
									<div class="review-item item-action">
										<button style="margin: 0;padding: 0;border: 1px solid transparent;outline: none;  " class="btn-large _j_submit"  type="submit" >
											提交点评
										</button>
									</div>
								</form>
							</div>
						</div>
					</c:if>

					<c:forEach items="${foodComments }" var="list">
						<c:if test="${dbuser.username eq list.username }">
							<div class="mfw-reviews have-reviews">
								<h2>
	                    			<strong>${fname }</strong>
	                			</h2>
								<div class="review-item item-star">
									<div class="label">你已评价为</div>
									<form action="${path }/updateFComment" method="post" class="_j_commentdialogform" enctype="multipart/form-data">
										<input type="text" name="id" id="id" value="${list.id }" style="display: none;">
										<input type="text" name="uid" id="uid" value="${dbuser.id }" style="display: none;">
										<input type="text" name="fid" id="fid" value="${fid }" style="display: none;">
										<div class="review-item item-comment">
											<div class="content">
												<textarea class="_j_commentarea" name="fcomment" id="fcomment" data-inputname="点评内容" placeholder="详细、客观、真实，130字以上为佳！上传图片会加分哦！" data-minlen="15" data-maxlen="1000">${list.fcomment }</textarea>
												<p class="_j_commentcounttip">15-1000个字</p>
											</div>
										</div>
										<div class="review-item item-action">
											<button style="margin: 0;padding: 0;border: 1px solid transparent;outline: none;  " class="btn-large _j_submit"  type="submit" >
												我要修改
											</button>
										</div>
									</form>
									<c:if test="${!empty list.fcphoto }">
									<form action="${path }/updateFCommentPhoto" method="post" class="_j_commentdialogform" enctype="multipart/form-data">
										<input type="text" name="id" id="id" value="${list.id }" style="display: none;">
										<input type="text" name="uid" id="uid" value="${dbuser.id }" style="display: none;">
										<input type="text" name="fid" id="fid" value="${fid }" style="display: none;">
										<div class="review-item item-comment" >
											<div class="content" style="margin-left: 80px;">
												<img alt="" src="${path }${list.fcphoto}" width="120px;" height="90px">
											</div>
										</div>
										<div class="review-item item-comment" >
											<div class="label">修改图片</div>
											<div class="content">
												<input name="fphotopic" id="fphotopic" type="file"/>
											</div>
										</div>
										<div class="review-item item-action">
											<button style="margin: 0;padding: 0;border: 1px solid transparent;outline: none;  " class="btn-large _j_submit"  type="submit" >
												我要修改
											</button>
										</div>
									</form>
									</c:if>
									<c:if test="${empty list.fcphoto }">
									<form action="${path }/updateFCommentPhoto" method="post" class="_j_commentdialogform" enctype="multipart/form-data">
										<input type="text" name="id" id="id" value="${list.id }" style="display: none;">
										<input type="text" name="uid" id="uid" value="${dbuser.id }" style="display: none;">
										<input type="text" name="fid" id="fid" value="${fid }" style="display: none;">
										<div class="review-item item-comment" >
											<div class="content" style="margin-left: 80px;">
												<img alt="" src="${path }${list.fcphoto}" width="120px;" height="90px">
											</div>
										</div>
										<div class="review-item item-comment" >
											<div class="label">上传图片</div>
											<div class="content">
												<input name="fphotopic" id="fphotopic" type="file"/>
											</div>
										</div>
										<div class="review-item item-action">
											<button style="margin: 0;padding: 0;border: 1px solid transparent;outline: none;  " class="btn-large _j_submit"  type="submit" >
												上传修改
											</button>
										</div>
									</form>
									</c:if>
								</div>
							</div>
						</c:if>
					</c:forEach>
					</div>
				</div>
			</c:if>
			</div>

			<div class="col-side _j_rside" >	
				<div class="m-box m-nearby">
					<div class="hd">热门美食</div>
					<ul>
					<c:forEach items="${hotList }" var="list">
						<li class="clearfix">
							<a class="cover" href="${path }/web/food_detail?fid=${list.id}">
								<c:choose>
									<c:when test="${list.fphoto==null || list.fphoto =='' }">
										<img alt="${list.fname }" width="120" height="80"
											src="${path}/images/icon/food.jpg">
									</c:when>
									<c:otherwise>
										<img alt="${list.fname }" width="120" height="80"
											src="${path}${list.fphoto }" />
									</c:otherwise>
								</c:choose>
							</a>
							<h3><a href="${path }/web/food_detail?fid=${list.id}"  title="${list.fname }">${list.fname }</a></h3>
							<div class="score">
								<span>有${list.freadnum }人浏览</span>
							</div>
							<div class="">
								<p>地址：${list.address }</p>
							</div>
						</li>
					</c:forEach>
					</ul>
				</div>
				<div class=" m-box m-nearby">
					<div class="hd">热门景点</div>
					<ul>
					<c:forEach items="${viewList }" var="list">
						<li class="clearfix">
							<a class="cover" href="${path }/web/view_detail?vid=${list.id}">
								<c:choose>
									<c:when test="${list.viewphoto==null || list.viewphoto =='' }">
										<img width="120" height="80" src="${path}/images/icon/view.jpg">
									</c:when>
									<c:otherwise>
										<img width="120" height="80" src="${path}${list.viewphoto }" />
									</c:otherwise>
								</c:choose>
							</a>
							<h3><a href="${path }/web/view_detail?vid=${list.id}"  title="${list.vname }">${list.vname }</a></h3>
							<div class="score">
								<span>有${list.vreadnum }人浏览</span>
							</div>
							<div class="">
								<p>地址：${list.location }</p>
							</div>
						</li>
					</c:forEach>
					</ul>
				</div>
				<div class="m-box m-nearby">
					<div class="hd">
						<a href="${path }/web/hotel" target="_blank" style="color:#3f200f;">热门酒店</a>
					</div>
					<ul>
					<c:forEach items="${hotelList }" var="list">
						<li class="clearfix">
							<a class="cover" href="${path }/web/hotel_detail?hid=${list.id}">
								<c:choose>
									<c:when test="${list.hphoto==null || list.hphoto =='' }">
										<img alt="${list.hname }" width="120" height="80"
											src="${path}/images/icon/hotel.jpg">
									</c:when>
									<c:otherwise>
										<img alt="${list.hname }" width="120" height="80"
											src="${path}${list.hphoto }" />
									</c:otherwise>
								</c:choose>
							</a>
							<h3>
								<a href="${path }/web/hotel_detail?hid=${list.id}" target="_blank" title="${list.hname }">${list.hname }</a>
							</h3>
							<div class="score">
								<span>有${list.hreadnum }人浏览</span>
							</div>
							<div class="">
								<p>地址：${list.address }</p>
							</div>
						</li>
					</c:forEach>
					</ul>
				</div>
			</div>
		</div>

		<script type="text/javascript">
			//下面js有用 勿删
			var env = window.Env,
				_poi_id = env.poiid,
				_poi_name = env.poiname,
				_mdd_name = env.mddname,
				_comment_order = 1,
				_comment_type = 0,
				_comment_page_reset = 0,
				_comment_page = 1,
				_zoom = env.zoom,
				_uid = env.UID,
				_username = env.uname,
				_user_logo = env.ulogo;
		</script>

		<%@include file="../common/footer.jsp"%>
		
	</body>

</html>