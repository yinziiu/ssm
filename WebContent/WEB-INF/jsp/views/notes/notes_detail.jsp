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

		<title>游记详情</title>
		<link href="${path}/style/notes_detail/notes_detail1.css" rel="stylesheet" />
		<link href="${path}/style/notes_detail/notes_detail2.css" rel="stylesheet" />
		<link href="${path}/style/notes_detail/smart_guide_u120.css" rel="stylesheet" />
		<script src="${path}/style/js/jquery/2.0.0/jquery.min.js" type="text/javascript"></script>
		<script src="${path}/style/notes_detail/hls.min.js" type="text/javascript"></script>
		<script src="${path}/style/notes_detail/notes_detail1.js" type="text/javascript"></script>
		<script src="${path}/style/notes_detail/notes_detail2.js" type="text/javascript"></script>
		<script src="${path}/style/notes_detail/notes_detail3.js" type="text/javascript"></script>
		<script src="${path}/style/notes_detail/notes_detail4.js" type="text/javascript"></script>
		<script src="${path}/style/notes_detail/notes_detail5.js" type="text/javascript"></script>
	</head>
	
	<body style="position: relative;">
		
		<%@include file="../common/head.jsp"%>
		<div class="main">
			<div style="width: 100%;height:120px;">
				<img src="${path }/images/icon/timg.png"" width="100%" height="120px">
			</div>
			<c:forEach items="${notes }" var="list">
			<div class="view_title clearfix">
				<div class="pagelet-block">
					<div class="vt_center">							
						<div class="person" >
							<a href="" target="_blank" class="per_pic">
								<c:choose>
									<c:when test="${list.photo==null || list.photo =='' }">
										<img src="${path}/images/icon/1.jpeg" width="120" height="120">
									</c:when>
									<c:otherwise>
										<img src="${path}${list.photo }"  width="120" height="120"/>
									</c:otherwise>
								</c:choose>
							</a>
							<strong>
								<a href="" class="per_name" title="${list.username }">${list.username }</a>
							</strong>
							<div class="vc_time">
								<span class="time"><em>${list.notestime }</em></span>
								<span>有${list.nreadnum }人浏览</span>
							</div>
							<c:if test="${list.username eq dbuser.username }">
								<div class="person-edit">
									<a href="${path }/web/updatenotes?id=${list.id}" title="编辑">编辑</a>|
									<a href="${path }/web/deletenotes?id=${list.id}"  title="删除">删除</a>
								</div>
							</c:if>
						</div>			
						<div class="_j_music_father">
						</div>
					</div>
				</div>
			</div>
			<div class="view clearfix" style="position:relative;">
				<div class="view_con">
					<div class="vc_article">
						<div class="va_con _j_master_content" >
							<div class="block-loading loading_backward"></div>
							<div class="_j_content_box">
								<h1 class="_j_note_content _j_seqitem" style="color: orange;">
									${list.notesname }
								</h1>
								<div id="_j_photo_431763311" >
									<c:choose>
										<c:when test="${list.notesphoto==null || list.notesphoto =='' }">
											<img style="display: inline;" src="${path}/images/icon/view.jpg" width="700px;" height="400px">
										</c:when>
										<c:otherwise>
											<img style="display: inline;" src="${path}${list.notesphoto }" width="700px;" height="400px"/>
										</c:otherwise>
									</c:choose>
								</div>
								
								<p class="_j_note_content _j_seqitem" >
									${list.notescomment }
								</p>
							</div>
							<div class="block-loading loading_forward"></div>
						</div>
					</div>
				</div>
				
				<div class="view_side">
					<div class="side_sticky _j_sticky_block">
					
						<div  class="pagelet-block" >
							<div class="">
								<div class="side_title">其他游记</div>
								<div  class="pagelet-block" >
									<div height: 36px;">
										<div>
											<ul class="catalog_content">
											<c:forEach items="${notes2 }" var="list">
												<li class="catalog_city">
													<dl>
														<dt class="">
			                                                <a href="${path }/web/notes_detail?id=${list.id}&&uid=${user.id}"  title="${list.notesname }">
			                                                	<h3 style="color: orange;">${list.notesname }</h3>
			                                                </a>
			                                            	<div style="font-size:12px;color:#999;overflow: hidden;text-overflow: ellipsis;display: -webkit-box;
			   												 -webkit-line-clamp: 2;-webkit-box-orient: vertical;text-indent:2em;">
																${list.notescomment }
															</div>
															<p class="catalog_line _j_cataloglink" style="text-align: right;color:#999;">${list.notestime }</p>
			                                            </dt>
													</dl>
												</li>
											</c:forEach>
											</ul>
										</div>
									</div>
								</div>
							</div>
						</div>
						<br>
						<div  class="pagelet-block" >
							<div class="notes_catalog">
								<div class="side_title" id="_j_catalogtitle">游记目录</div>
								<div id="pagelet-block-8814b3352501ea009f15d31ae25fbd1f" class="pagelet-block" >
									<div style="position: relative; height: 36px;">
										<div id="_j_catalogList" style="position: relative; overflow-y: hidden; max-height: 36px;">
											<ul class="catalog_content">
												<li class="catalog_city" id="_j_paragraph_nav_0">
													<span class="catalog_num">01/</span>
													<a role="button" tabindex="0" data-index="0" data-seq="" title="默认段落(0)" class="catalog_line _j_cataloglink">默认段落</a>
												</li>
											</ul>
										</div>
										<div class="scrollbar" style="height: auto; opacity: 0; display: none;"></div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</c:forEach>
		</div>
		<%@include file="../common/footer.jsp"%>
	</body>
</html>