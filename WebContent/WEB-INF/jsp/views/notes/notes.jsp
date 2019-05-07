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
		
		<title>游记</title>
		<link href="${path}/style/notes/notes.css" rel="stylesheet" />
		<link href="${path}/style/notes/notes1.css" rel="stylesheet" />
		<script src="${path}/style/js/jquery/2.0.0/jquery.min.js" type="text/javascript"></script>
		<script src="${path}/style/notes/notes1.js" type="text/javascript"></script>
		<script src="${path}/style/notes/notes2.js" type="text/javascript"></script>
		<script src="${path}/style/notes/notes3.js" type="text/javascript"></script>
		
		<style type="text/css">
			.mfw-focus{
				width: 100%;
				height: 400px;
			}
		
		</style>

		<body style="position: relative;">
		
			<%@include file="../common/head.jsp"%>
			<div class="mfw-focus" id="_j_mfw_focus">
				<img alt="" src="${path }/images/icon/timg.png" width="100%" height="350px">
			</div>
			<div class="mfw-container clearfix" id="_j_mfw_container">
				<div class="mfw-wrapper">
					<div class="mfw-travelnotes" id="_j_tn">
						<div class="navbar clearfix">
							<ul class="tn-nav" id="_j_tn_nav">
								<li class="active _j_gs_tab tn-nav-hot">
									<a href="javascript:void(0);" rel="nofollow" >热门游记</a>
								</li>
							</ul>
							<c:if test="${dbuser==null }">
								<div class="tn-write">
									<a class="btn-add" href="${path }/web/login" target="_blank" rel="nofollow">写游记 / 登陆</a>
								</div>
							</c:if>
							<c:if test="${dbuser!=null }">
								<div class="tn-write">
									<a class="btn-add" href="${path }/web/writenotes" target="_blank" rel="nofollow">写游记</a>
								</div>
							</c:if>
						</div>
						
						<div id="" class="pagelet-block"  >
							<div id="_j_tn_content">
								<div class="tn-list">
								<c:forEach items="${notesList }" var="list">
									<div class="tn-item clearfix">
										<div class="tn-image">
											<a href="${path }/web/notes_detail?id=${list.id}" target="_blank">
												<c:choose>
													<c:when test="${list.notesphoto==null || list.notesphoto =='' }">
														<img style="display: inline;" src="${path}/images/icon/view.jpg">
													</c:when>
													<c:otherwise>
														<img style="display: inline;" src="${path}${list.notesphoto }" />
													</c:otherwise>
												</c:choose>
											</a>
										</div>
										<div class="tn-wrapper">
											<dl>
												<dt>      
                                                    <a href="${path }/web/notes_detail?id=${list.id}" target="_blank">${list.notesname }</a>
                            					</dt>
												<dd style="overflow: hidden;text-overflow: ellipsis;display: -webkit-box;
   										 -webkit-line-clamp: 3;-webkit-box-orient: vertical;">
													<a href="${path }/web/notes_detail?id=${list.id}" target="_blank">${list.notescomment }</a>
												</dd>
											</dl>
											<div class="tn-extra">
												<span class="tn-ding">
                        							<em id="topvote11932446">浏览:&nbsp;${list.nreadnum }</em>
                    							</span>
												<span class="tn-user">
							                        <a href="" target="_blank" rel="nofollow">
							                           <c:choose>
															<c:when test="${list.photo==null || list.photo =='' }">
																<img  src="${path}/images/icon/1.jpeg">
															</c:when>
															<c:otherwise>
																<img  src="${path}${list.photo }" />
															</c:otherwise>
														</c:choose>
							                            ${list.username }
							                        </a>
							                    </span>												
											</div>
										</div>
									</div>
									</c:forEach>
								</div>
								<div align="right" class="m-pagination" id="_j_tn_pagination" data-type="0" data-objid="0">
									<span class="count">共<span>${page.pages }</span>页 / <span>${page.total }</span>条</span>
									<a class="pg-next _j_pageitem" <c:if test="${page.pageNum != page.firstPage}"> href=${paht}/web/strategy?currentPage=${page.pageNum - 1 }"</c:if> <c:if test="${page.pageNum == page.firstPage}"> href="javascript:void(0)" class="disabled"</c:if>  title="前一页">前一页</a>
									 <c:forEach begin="1" end="${page.pages }" varStatus="status">
										<a class="pi _j_pageitem" href="${path}/web/strategy?currentPage=${status.count }" <c:if test="${status.count == page.pageNum}">class="select"</c:if>>${status.count }</a>
									</c:forEach>
									<a class="pg-next _j_pageitem" <c:if test="${page.pageNum == page.lastPage}">class="disabled" href="javascript:void(0)"</c:if> <c:if test="${page.pageNum != page.lastPage}">href="${path}/web/strategy?currentPage=${page.pageNum + 1 }"</c:if>   title="后一页">后一页</a>
								</div>
							</div>
						</div>
					</div>
				</div>
			
				<div class="mfw-aside">
					<div class="asidebox box-traveller">
						<div class="asidebox-hd">
							<h2 class="hd-title">最新游记</h2>
						</div>
						<div class="asidebox-bd" id="_j_traveller_slide">
							<ul>
							<c:forEach items="${notesList1 }" var="list">
								<li>
									<h3>
                                		<a  href="${path }/web/notes_detail?id=${list.id}" target="_blank">${list.notesname }</a>
                            		</h3>
									<div style="overflow: hidden;text-overflow: ellipsis;display: -webkit-box;
   										 -webkit-line-clamp:2;-webkit-box-orient: vertical;">
										<p >>>&nbsp;${list.notescomment }</p>
									</div>
								</li>
							</c:forEach>
							</ul>
						</div>
					</div>
				</div>
				
				<div class="mfw-aside">
					<div class="asidebox box-traveller">
						<div class="asidebox-hd">
							<h2 class="hd-title">热门攻略</h2>
							<a class="hd-right" href="${path }/web/strategy">查看全部&gt;</a>
						</div>
						<div class="asidebox-bd" id="_j_traveller_slide">
							<ul>
							<c:forEach items="${list }" var="list">
								<li>
									<h3>
                                		<a  href="${path }/web/strategy_detail?id=${list.id}" target="_blank">${list.stname }</a>
                            		</h3>
                            		<div style="overflow: hidden;text-overflow: ellipsis;display: -webkit-box;
   										 -webkit-line-clamp:2;-webkit-box-orient: vertical;">
										<p >>>&nbsp;${list.stcontent }</p>
									</div>
								</li>
							</c:forEach>
							</ul>
						</div>
					</div>
				</div>
			</div>
			
			<%@include file="../common/footer.jsp"%>

		</body>

</html>