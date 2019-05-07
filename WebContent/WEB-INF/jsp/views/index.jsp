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
		<title>首页</title>
		<link href="${path }/style/index/index1.css" rel="stylesheet" />
		<link href="${path }/style/index/index2.css" rel="stylesheet" />
		<link href="${path }/style/index/index3.css" rel="stylesheet" />
		<link href="${path}/style/index/index4.css" rel="stylesheet" />
		<link href="${path }/style/index/place-crumb.css" rel="stylesheet" />
		<script src="${path}/style/js/jquery/2.0.0/jquery.min.js" type="text/javascript"></script>
		<script src="${path}/style/common/js/BrowserState.js" type="text/javascript"></script>
		<script src="${path}/style/index/index.js" type="text/javascript"></script>
		<script src="${path}/style/index/index1.js" type="text/javascript"></script>
		<script src="${path}/style/index/index2.js" type="text/javascript"></script>
		<script src="${path}/style/index/index3.js" type="text/javascript"></script>
		<script src="${path}/style/index/jquery.indexSlidePattern.js" type="text/javascript"></script>
	
		<style type="text/css">
			*{padding:0;margin:0;list-style-type:none;}
			a,img{border:0;}
			body{font:12px/180% Arial, Helvetica, sans-serif, "新宋体";}
			/* demo */
			/*五张图片在缩略图时所显示的位置调整*/
			#demo li:nth-of-type(1) img{ transform: translate(-210px);}
			#demo li:nth-of-type(2) img{ transform: translate(-180px);}
			#demo li:nth-of-type(3) img{ transform: translate(-380px);}
			#demo li:nth-of-type(4) img{ transform: translate(-450px);}
			#demo li:nth-of-type(5) img{ transform: translate(-320px);}
			#demo{width:1160px;height:512px;margin:60px auto 0 auto;}
			#demo img{width: 820px; height: 512px; max-width: 820px;}
			#demo li{float:left;position:relative;width:82px;height:100%;overflow:hidden;cursor:pointer; transition:0.5s; transform-origin:bottom;filter:alpha(opacity=50);opacity:0.5;}
			#demo li img{transition:1.2s;}
			#demo li a{display:block;}
			#demo li div{position:absolute;bottom:0;left:0;width:100%;background:#000;line-height:32px;filter:alpha(opacity=70);opacity:0.7;text-indent:2em;}
			#demo li div a{color:#FFF;text-decoration:none;}
			#demo li div a:hover{color:#F00;text-decoration:none;}
			#demo li.active{cursor:pointer; transform:scale(1.02,1.08); z-index:3;width:820px;filter:alpha(opacity=100);opacity:1;}
			#demo li.active img{transform:translate(0px);}
			#demo li:nth-of-type(1){transform-origin:bottom left;}
			#demo li:nth-of-type(5){transform-origin:bottom right;}
		</style>
		<script language="javascript">
		$(document).ready(function(e){
			  var opt	=	{
				"speed"	:	"fast"		,	//变换速度,三速度可选 slow,normal,fast;
				"by"	:	"mouseover"		,	//触发事件,click或者mouseover;
				"auto"	:	true		,	//是否自动播放;
				"sec"	:	2000	 		//自动播放间隔;
			  };
		      $("#demo").IMGDEMO(opt);    
		});
		</script>
	
	</head>

	<body style="position: relative;">
		
		<%@include file="./common/head.jsp"%>

		<div class="mfw-focus" id="_j_mfw_focus">
			<div class="show-slider" id="_j_top_pic_container" style="height: 450px;">
				<ul id="demo">
					<li class="active">
						<a href=""><img src="${path}/images/icon/i3.jpeg" /></a>
						<div>
							<a href="">姑婆山日出</a>
						</div>
					</li>
					<li>
						<a href=""><img src="${path}/images/icon/i1.jpeg" /></a>
						<div>
							<a href="">黄姚龙爪榕</a>
						</div>
					</li>
					<li>
						<a href=""><img src="${path}/images/icon/i2.jpeg" /></a>
						<div>
							<a href="">黄姚龙爪榕</a>
						</div>
					</li>
					<li>
						<a href=""><img src="${path}/images/icon/i4.jpeg" /></a>
						<div>
							<a href="">紫云仙境的溶洞</a>
						</div>
					</li>
					<li>
						<a href=""><img src="${path}/images/icon/i5.jpeg" /></a>
						<div>
							<a href="">黄姚古镇店铺</a>
						</div>
					</li>
				</ul>
			</div>
				
		</div>

		<div id="container" data-cs-t="目的地详情页">
			<div class="row row-primary">
				<div class="wrapper">
					<div class="screen clearfix">
						<div class="r-main">
							<a class="photo" href="" target="_blank"> 
								<img src="${path}/images/icon/index.jpeg" width="680" height="360">
								<div class="text">
									<span>贺州景点推荐</span>
								</div>
							</a>
						</div>
						<div class="r-side">
							<div class="m-impress">
								<h3 class="hd">贺州印象</h3>
								<div class="bd clearfix">
									<ul class="tag" style="height: 140px; overflow: hidden">
										<li title="">
											<a href="" target="_blank">必游</a>
										</li>
										<li title="">
											<a href="" target="_blank">贺州菜酿</a>
										</li>
										<li title="">
											<a href="" target="_blank">姑婆山</a>
										</li>
										<li title="">
											<a href="" target="_blank">黄瑶古镇</a>
										</li>
										<li title="">
											<a href="" target="_blank">温泉</a>
										</li>
										<li title="">
											<a href="" target="_blank">豆鼓</a>
										</li>
										<li title="">
											<a href="" target="_blank">牛肠酸</a>
										</li>
										<li title="">
											<a href="" target="_blank">黄田扣肉</a>
										</li>
									</ul>
								</div>
							</div>
							<div class="m-nearby">
								<div class="maps-img">
									<img src="${path }/images/icon/map.jpeg" style="left: -227px; top: -62px;">
									<a href="" data-cs-l="贺州" class="mark small" data-act="open_tip" data-mddid="12913" style="cursor: pointer;left: 186px;top:98px;"><i class="icon-a"></i><span class="mname">贺州</span></a>
								</div>
								<div class="maps-expand hide" data-cs-p="目的地分发">
									<a href="" data-cs-l="贺州" class="mark small" style="cursor: pointer; left: 413px; top: 160px;">
										<i class="icon-a"></i>
										<span class="mname">贺州</span>
									</a>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="pagelet-block" >
				<div class="row row-feature row-bg">
					<div class="wrapper">
						<div class="col col-scenic">
							<h2 class="hd" style="position: relative;color: black;">
								热门景点
							</h2>
							<c:forEach items="${viewcommentList }" var="list">
							<dl>
								<dt>
		                            <a class="r-tit" href="${path }/web/view_detail?vid=${list.vid}" target="_blank">
		                            	<span class="No"></span>
		                            	${list.vname }
		                            </a>
		                    	</dt>
								<dd>
									<a href="${path }/web/view_detail?vid=${list.vid}" target="_blank">
										<div class="r-photo">
											<c:choose>
												<c:when test="${list.viewphoto==null || list.viewphoto =='' }">
													<img width="296" height="156" src="${path}/images/icon/view.jpg">
												</c:when>
												<c:otherwise>
													<img width="296" height="156" src="${path}${list.viewphoto }" />
												</c:otherwise>
											</c:choose>
										</div>
										<div class="r-text">
											<span class="user" title="" rel="nofollow">
		                                       <c:choose>
													<c:when test="${list.photo==null || list.photo =='' }">
														<img  src="${path}/images/icon/1.jpeg">
													</c:when>
													<c:otherwise>
														<img  src="${path}${list.photo }" />
													</c:otherwise>
												</c:choose>
												${list.username }
		                                    </span> &nbsp;
		                                    <div style="font-size:15px;color:#999;overflow: hidden;text-overflow: ellipsis;display: -webkit-box;
   												 -webkit-line-clamp: 3;-webkit-box-orient: vertical;text-indent:2em;">
   												 “${list.vcomment }”
   											 </div>
										</div>
									</a>
								</dd>
							</dl>
							</c:forEach>
							<div class="ft">
								<a class="a-link" href="${path}/web/view" target="_blank">查看全部景点</a>
							</div>
						</div>
		
						<div class="col col-hotel">
							<h2 class="hd" style="position: relative;color: black;">
		                        	畅销酒店
							</h2>
							<c:forEach items="${hotelcommentList }" var="list">
							<dl>
								<dt>		       
		                            <a class="r-tit" href="${path}/web/hotel_detail?hid=${list.hid}" target="_blank">
		                            	<span class="No"></span>${list.hname }
		                            </a>
		                		</dt>
								<dd>
									<a  href="${path}/web/hotel_detail?hid=${list.hid}" target="_blank">
										<div class="r-photo">
											 <c:choose>
												<c:when test="${list.hphoto==null || list.hphoto =='' }">
													<img width="296" height="156" src="${path}/images/icon/hotel.jpg">
												</c:when>
												<c:otherwise>
													<img width="296" height="156" src="${path}${list.hphoto }" />
												</c:otherwise>
											</c:choose>
										</div>
										<div class="r-text">
											<span class="user" title="" rel="nofollow">
												<c:choose>
													<c:when test="${list.photo==null || list.photo =='' }">
														<img  src="${path}/images/icon/1.jpeg">
													</c:when>
													<c:otherwise>
														<img  src="${path}${list.photo }" />
													</c:otherwise>
												</c:choose>
												${list.username }
		                                    </span> &nbsp;
		                                    <div style="font-size:15px;color:#999;overflow: hidden;text-overflow: ellipsis;display: -webkit-box;
   										 	-webkit-line-clamp: 3;-webkit-box-orient: vertical;text-indent:2em;">
   												 “${list.hcomment }”
   											 </div>
										</div>
									</a>
								</dd>
							</dl>
							</c:forEach>
							<div class="ft">
								<a class="a-link" href="${path}/web/hotel" target="_blank">查看全部酒店</a>
							</div>
						</div>
		
						<div class="col col-cate">
							<h2 class="hd" style="position: relative;color: black;">
		                        	必吃美食
		                    </h2>
		                    <c:forEach items="${foodcommentList }" var="list">
							<dl>
								<dt>
		                            <a class="r-tit" target="_blank" href="${path}/web/food_detail?fid=${list.fid}">
		                            	<span class="No"></span>${list.fname }
		                            </a>
		                        </dt>
								<dd>
									<a href="${path}/web/food_detail?fid=${list.fid}" target="_blank">
										<div class="r-photo">
											<c:choose>
												<c:when test="${list.fphoto==null || list.fphoto =='' }">
													<img width="296" height="156" src="${path}/images/icon/food.jpg">
												</c:when>
												<c:otherwise>
													<img width="296" height="156" src="${path}${list.fphoto }" />
												</c:otherwise>
											</c:choose>
										</div>
										<div class="r-text">
											<span class="user" title="" rel="nofollow">
		                                        <c:choose>
													<c:when test="${list.photo==null || list.photo =='' }">
														<img  src="${path}/images/icon/1.jpeg">
													</c:when>
													<c:otherwise>
														<img  src="${path}${list.photo }" />
													</c:otherwise>
												</c:choose>
												${list.username }
		                                    </span> &nbsp;
		                                    <div style="font-size:15px;color:#999;overflow: hidden;text-overflow: ellipsis;display: -webkit-box;
   										 -webkit-line-clamp: 3;-webkit-box-orient: vertical;text-indent:2em;">
   											 “${list.fcomment }”
   											 </div>
										</div>
									</a>
								</dd>
							</dl>
							</c:forEach>
							<div class="ft">
								<a  class="a-link" href="${path}/web/notes" target="_blank">查看全部餐饮</a>
							</div>
						</div>
					</div>
				</div>
			</div>

			<div  class="pagelet-block" >
				<div class="row row-local row-hotel " data-cs-p="酒店精选">
					<div class="wrapper">
						<h2 class="r-title">
							酒店精选 <span>来的游客 大多会关注：</span>
						</h2>
						<div class="local-pro">
							<ul class="clearfix">
								<c:forEach items="${hotelList }" var="list">
									<li data-id="36064">
										<a href="${path }/web/hotel_detail?hid=${list.id}" target="_blank" title="">
											<c:choose>
												<c:when test="${list.hphoto==null || list.hphoto =='' }">
													<img width="320" height="320"  src="${path}/images/icon/hotel.jpg">
												</c:when>
												<c:otherwise>
													<img width="320" height="320"  src="${path}${list.hphoto }" />
												</c:otherwise>
											</c:choose>
											<div class="img-bag">
												<h2>${list.hname }</h2>
												<p>${list.hotelintro }</p>
											</div>
										</a>
									</li>
								</c:forEach>
							</ul>
						</div>
						<div class="r-more">
							<a href="${path}/web/hotel" target="_blank">查看全部酒店</a>
						</div>
					</div>
				</div>
			</div>

			<div class="pagelet-block row-bg">
				<div class="row row-sales">
					<div class="wrapper">
						<div class="mod-hd">
							<h2>旅行商城</h2>
						</div>
						<div class="mod-hd">
							<ul class="tab hotSaleNav">
								<li>
									<a class="on" href="javascript:void(0);">景点门票</a>
								</li>
							</ul>
						</div>
						<div class="bd hotSales">
							<section class="" style="width: 100%;overflow: hidden">
								<ul class="sales-list clearfix">
									<c:forEach items="${viewsTicketList }" var="list">
										<li class="item">
											<a href="${path }/web/view_order?id=${list.id}&&vid=${list.vid }" target="_blank">
												<div class="image">
													<c:choose>
														<c:when test="${list.viewphoto==null || list.viewphoto =='' }">
															<img class="lazy" width="220" height="150" src="${path}/images/icon/view.jpg">
														</c:when>
														<c:otherwise>
															<img class="lazy" width="220" height="150" src="${path}${list.viewphoto }" />
														</c:otherwise>
													</c:choose>
													<div class="mark-tag">${list.ttype }</div>
												</div>
												<div class="caption">
													<div style="font-size:15px;color:#999;overflow: hidden;text-overflow: ellipsis;display: -webkit-box;
   												 -webkit-line-clamp: 2;-webkit-box-orient: vertical;">
														<h3>${list.tname }</h3>
													</div>
													<span class="price"><b>￥${list.tprice }</b>起</span>
													<span class="sell">已售 ${list.sales }</span>
												</div>
											</a>
										</li>
									</c:forEach>
								</ul>
								<div class="getmore">
									<a href="${path}/web/shop" target="_blank">贺州景点门票产品&gt;&gt;</a>
								</div>
							</section>
						</div>
					</div>
				</div>
			</div>

			<div  class="pagelet-block" id="youji">
				<div class="row row-travels ">
					<div class="wrapper">
						<div class="navbar clearfix">
							<ul class="tn-nav">
								<li class="active">
									<h2>贺州游记</h2>
								</li>
							</ul>
						</div>
						<div class="relcontent yj" style="display: block">
							<div class="_notelist">
								<div class="tn-list">
									<c:forEach items="${notesList }" var="list">
										<div class="tn-item clearfix">
											<div class="tn-image">
												<a href="${path }/web/notes_detail?id=${list.id}" >
													<c:choose>
														<c:when test="${list.photo==null || list.photo =='' }">
															<img class="lazy" width="220" height="150" src="${path}/images/icon/view.jpg">
														</c:when>
														<c:otherwise>
															<img class="lazy" width="220" height="150" src="${path}${list.photo }" />
														</c:otherwise>
													</c:choose>
												</a>
											</div>
											<div class="tn-wrapper" >
												<dl>
													<dt>
			                                            <a href="${path }/web/notes_detail?id=${list.id}" class="title-link" >${list.notesname }</a>
			        								</dt>
													<dd>
														<a href="${path }/web/notes_detail?id=${list.id}" >${list.notescomment } </a>
													</dd>
												</dl>
												<div class="tn-extra">
													<span class="tn-user">
														<a href="" rel="nofollow">
															<c:choose>
																<c:when test="${list.photo==null || list.photo =='' }">
																	<img src="${path}/images/icon/1.jpeg">
																</c:when>
																<c:otherwise>
																	<img src="${path}${list.photo }" />
																</c:otherwise>
															</c:choose> ${list.username }
														</a> 
													</span>
												</div>
											</div>
										</div>
									</c:forEach>
									<div class="_pagebar">
										<div align="right" class="m-pagination">
											<span class="count">共<span>${page.pages }</span>页 / <span>${page.total }</span>条</span>
											<a class="pi pg-next" <c:if test="${page.pageNum != page.firstPage}"> href=${paht}/web/index?currentPage=${page.pageNum - 1 }&&#youji"</c:if> <c:if test="${page.pageNum == page.firstPage}"> href="javascript:void(0)" class="disabled"</c:if>  title="前一页">前一页</a>
											 <c:forEach begin="1" end="${page.pages }" varStatus="status">
												<a class="pi" href="${path}/web/index?currentPage=${status.count }&&#youji" <c:if test="${status.count == page.pageNum}">class="select"</c:if>>${status.count }</a>
											</c:forEach>
											<a class="pi pg-next" <c:if test="${page.pageNum == page.lastPage}">class="disabled" href="javascript:void(0)"</c:if> <c:if test="${page.pageNum != page.lastPage}">href="${path}/web/index?currentPage=${page.pageNum + 1 }&&#youji"</c:if>   title="后一页">后一页</a>
										</div>
									</div>
								</div>
								<div class="relcontent xc" style="display: none">
									<div class="p-content"></div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		
		<%@include file="./common/footer.jsp"%>

	</body>

</html>