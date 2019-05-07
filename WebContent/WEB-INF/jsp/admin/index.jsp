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
		<meta name="renderer" content="webkit|ie-comp|ie-stand">
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
		<meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no" />
		<meta http-equiv="Cache-Control" content="no-siteapp" />
		<link rel="Bookmark" href="/favicon.ico">
		<link rel="Shortcut Icon" href="/favicon.ico" />
		<!--[if lt IE 9]>
<script type="text/javascript" src="lib/html5shiv.js"></script>
<script type="text/javascript" src="lib/respond.min.js"></script>
<![endif]-->
		<link rel="stylesheet" type="text/css" href="${path }/admin/static/h-ui/css/H-ui.min.css" />
		<link rel="stylesheet" type="text/css" href="${path }/admin/static/h-ui.admin/css/H-ui.admin.css" />
		<link rel="stylesheet" type="text/css" href="${path }/admin/lib/Hui-iconfont/1.0.8/iconfont.css" />
		<link rel="stylesheet" type="text/css" href="${path }/admin/static/h-ui.admin/skin/default/skin.css" id="skin" />
		<link rel="stylesheet" type="text/css" href="${path }/admin/static/h-ui.admin/css/style.css" />
		<link type="text/css" rel="stylesheet" href="${path }/admin/lib/font-awesome-4.7.0/css/font-awesome.min.css" />
		<!--[if IE 6]>
<script type="text/javascript" src="lib/DD_belatedPNG_0.0.8a-min.js" ></script>
<script>DD_belatedPNG.fix('*');</script>
<![endif]-->
		<title>贺州名胜景点推荐系统</title>
	</head>

	<body>
		<header class="navbar-wrapper">
			<div class="navbar navbar-fixed-top">
				<div class="container-fluid cl">
					<a class="logo navbar-logo f-l mr-10 hidden-xs" href="/aboutHui.shtml">后台管理</a>
					<a class="logo navbar-logo-m f-l mr-10 visible-xs" href="/aboutHui.shtml"></a>
					<a aria-hidden="false" class="nav-toggle Hui-iconfont visible-xs" href="javascript:;">&#xe667;</a>
					<nav class="nav navbar-nav">
						<ul class="cl">
							<li class="dropDown dropDown_hover">
								<a href="javascript:;" class="dropDown_A"><i class="Hui-iconfont">&#xe600;</i> 新增 <i class="Hui-iconfont">&#xe6d5;</i></a>
								<ul class="dropDown-menu menu radius box-shadow">
									<li>
										<a href="javascript:;" onclick="article_add('添加资讯','article-add.html')"><i class="Hui-iconfont">&#xe613;</i> 景点</a>
									</li>
									<li>
										<a href="javascript:;" onclick="picture_add('添加资讯','picture-add.html')"><i class="Hui-iconfont">&#xe616;</i> 攻略</a>
									</li>
									<li>
										<a href="javascript:;" onclick="product_add('添加资讯','product-add.html')"><i class="Hui-iconfont">&#xe643;</i> 酒店</a>
									</li>
									<li>
										<a href="javascript:;" onclick="member_add('添加用户','member-add.html','','510')"><i class="Hui-iconfont">&#xe620;</i> 美食</a>
									</li>
								</ul>
							</li>
						</ul>
					</nav>
					<nav id="Hui-userbar" class="nav navbar-nav navbar-userbar hidden-xs">
						<ul class="cl">
							<li>${adminuser.name }</li>
							<li class="dropDown dropDown_hover">
								<a href="#" class="dropDown_A">${adminuser.username } <i class="Hui-iconfont">&#xe6d5;</i></a>
								<ul class="dropDown-menu menu radius box-shadow">
									<li>
										<a href="javascript:;" onClick="myselfinfo('${path}/admin/info')">个人信息</a>
									</li>
									<li>
										<a href="${path }/admin/logout">退出</a>
									</li>
								</ul>
							</li>
							<li id="Hui-skin" class="dropDown right dropDown_hover">
								<a href="javascript:;" class="dropDown_A" title="换肤"><i class="Hui-iconfont" style="font-size: 18px">&#xe62a;</i></a>
								<ul class="dropDown-menu menu radius box-shadow">
									<li>
										<a href="javascript:;" data-val="default" title="默认（黑色）">默认（黑色）</a>
									</li>
									<li>
										<a href="javascript:;" data-val="blue" title="蓝色">蓝色</a>
									</li>
									<li>
										<a href="javascript:;" data-val="green" title="绿色">绿色</a>
									</li>
									<li>
										<a href="javascript:;" data-val="red" title="红色">红色</a>
									</li>
									<li>
										<a href="javascript:;" data-val="yellow" title="黄色">黄色</a>
									</li>
									<li>
										<a href="javascript:;" data-val="orange" title="橙色">橙色</a>
									</li>
								</ul>
							</li>
						</ul>
					</nav>
				</div>
			</div>
		</header>
		<aside class="Hui-aside">
			<div class="menu_dropdown bk_2">
				<dl id="menu-view">
					<dt>
				<i class="Hui-iconfont">&#xe613;</i>景点管理<i
					class="Hui-iconfont menu_dropdown-arrow">&#xe6d5;</i>
					</dt>
					<dd>
						<ul>
							<li>
								<a data-href="${path }/getViewList" data-title="景点列表" href="javascript:void(0)">景点列表</a>
							</li>
							<li>
								<a data-href="${path }/vticket" data-title="门票管理" href="javascript:void(0)">门票管理</a>
							</li>
							<li>
								<a data-href="${path }/getViewTypeList" data-title="景点类型" href="javascript:void(0)">景点类型管理</a>
							</li>
						</ul>
					</dd>
				</dl>
				<dl id="menu-hotel">
					<dt>
				<i class="Hui-iconfont">&#xe643;</i>酒店管理<i
					class="Hui-iconfont menu_dropdown-arrow">&#xe6d5;</i>
					</dt>
					<dd>
						<ul>
							<li>
								<a data-href="${path }/getHotelList" data-title="酒店列表" href="javascript:void(0)">酒店列表</a>
							</li>
							<li>
								<a data-href="${path }/getHotelType" data-title="酒店类型列表" href="javascript:void(0)">酒店类型列表</a>
							</li>
							<li>
								<a data-href="${path }/getHotelRoomType" data-title="房型管理" href="javascript:void(0)">房型管理</a>
							</li>
							<li>
								<a data-href="${path }/getHotelInfo" data-title="酒店基本信息管理" href="javascript:void(0)">酒店基本信息管理</a>
							</li>
							<li>
								<a data-href="${path }/getHotelService" data-title="酒店服务管理" href="javascript:void(0)">酒店服务管理</a>
							</li>
							<li>
								<a data-href="${path }/getHotelFac" data-title="酒店设备管理" href="javascript:void(0)">酒店设备管理</a>
							</li>
							<li>
								<a data-href="${path }/getHotelRoomInfo" data-title="房间设备管理" href="javascript:void(0)">房间设备管理</a>
							</li>
							<li>
								<a data-href="${path }/getHotelStory" data-title="酒店攻略表" href="javascript:void(0)">酒店攻略表</a>
							</li>
						</ul>
					</dd>
				</dl>
				<dl id="menu-food">
					<dt>
				<i class="Hui-iconfont">&#xe620;</i>美食管理<i
					class="Hui-iconfont menu_dropdown-arrow">&#xe6d5;</i>
					</dt>
					<dd>
						<ul>
							<li>
								<a data-href="${path }/getFoodList" data-title="美食列表" href="javascript:void(0)">美食列表</a>
							</li>
						</ul>
					</dd>
				</dl>
				<dl id="menu-strategy">
					<dt>
						<i class="Hui-iconfont">&#xe616;</i>攻略管理<i
					class="Hui-iconfont menu_dropdown-arrow">&#xe6d5;</i>
					</dt>
					<dd>
						<ul>
							<li>
								<a data-href="${path }/getStrategyList" data-title="攻略管理" href="javascript:void(0)">攻略列表</a>
							</li>
						</ul>
					</dd>
				</dl>
				<dl id="menu-notes">
					<dt>
						<i class="Hui-iconfont">&#xe616;</i>游记管理<i
					class="Hui-iconfont menu_dropdown-arrow">&#xe6d5;</i>
					</dt>
					<dd>
						<ul>
							<li>
								<a data-href="${path }/getNotesList" data-title="游记管理" href="javascript:void(0)">游记列表</a>
							</li>
						</ul>
					</dd>
				</dl>
				<dl id="menu-comment">
					<dt>
				<i class="Hui-iconfont">&#xe622;</i>点评管理<i
					class="Hui-iconfont menu_dropdown-arrow">&#xe6d5;</i>
					</dt>
					<dd>
						<ul>
							<li>
								<a data-href="${path }/getViewCommentList" data-title="景点点评列表" href="javascript:;">景点点评列表</a>
							</li>
							<li>
								<a data-href="${path }/getHotelCommentList" data-title="酒店点评列表" href="javascript:;">酒店点评列表</a>
							</li>
							<li>
								<a data-href="${path }/getFoodCommentList" data-title="美食点评列表" href="javascript:;">美食点评列表</a>
							</li>
						</ul>
					</dd>
				</dl>
				<dl id="menu-orders">
					<dt>
				<i class="Hui-iconfont">&#xe622;</i>订单管理<i
					class="Hui-iconfont menu_dropdown-arrow">&#xe6d5;</i>
					</dt>
					<dd>
						<ul>
							<li>
								<a data-href="${path }/getViewOrderList" data-title="景点订单" href="javascript:;">景点订单</a>
							</li>
							<li>
								<a data-href="${path }/getHotelOrderList" data-title="酒店订单" href="javascript:;">酒店订单</a>
							</li>
						</ul>
					</dd>
				</dl>
				<dl id="menu-member">
					<dt>
				<i class="Hui-iconfont">&#xe60d;</i>用户管理<i
					class="Hui-iconfont menu_dropdown-arrow">&#xe6d5;</i>
			</dt>
					<dd>
						<ul>
							<li>
								<a data-href="${path }/getUserList" data-title="会员列表" href="javascript:;">用户列表</a>
							</li>
						</ul>
					</dd>
				</dl>
				<dl id="menu-admin">
					<dt>
				<i class="Hui-iconfont">&#xe62d;</i> 管理员管理<i
					class="Hui-iconfont menu_dropdown-arrow">&#xe6d5;</i>
			</dt>
					<dd>
						<ul>
							<li>
								<a data-href="${path }/getRoleList" data-title="角色管理" href="javascript:void(0)">角色管理</a>
							</li>
							<li>
								<a data-href="${path }/getAdminList" data-title="管理员列表" href="javascript:void(0)">管理员列表</a>
							</li>
						</ul>
					</dd>
				</dl>
			</div>
		</aside>
		<div class="dislpayArrow hidden-xs">
			<a class="pngfix" href="javascript:void(0);" onClick="displaynavbar(this)"></a>
		</div>
		<section class="Hui-article-box">
			<div id="Hui-tabNav" class="Hui-tabNav hidden-xs">
				<div class="Hui-tabNav-wp">
					<ul id="min_title_list" class="acrossTab cl">
						<li class="active"><span title="我的桌面" data-href="${path }/welcome">我的桌面</span>
							<em></em></li>
					</ul>
				</div>
				<div class="Hui-tabNav-more btn-group">
					<a id="js-tabNav-prev" class="btn radius btn-default size-S" href="javascript:;"><i class="Hui-iconfont">&#xe6d4;</i></a>
					<a id="js-tabNav-next" class="btn radius btn-default size-S" href="javascript:;"><i class="Hui-iconfont">&#xe6d7;</i></a>
				</div>
			</div>
			<div id="iframe_box" class="Hui-article">
				<div class="show_iframe">
					<div style="display: none" class="loading"></div>
					<iframe scrolling="yes" frameborder="0" src="${path }/welcome"></iframe>
				</div>
			</div>
		</section>

		<div class="contextMenu" id="Huiadminmenu">
			<ul>
				<li id="closethis">关闭当前</li>
				<li id="closeall">关闭全部</li>
			</ul>
		</div>
		<!--_footer 作为公共模版分离出去-->
		<script type="text/javascript" src="${path }/admin/lib/jquery/1.9.1/jquery.min.js"></script>
		<script type="text/javascript" src="${path }/admin/lib/layer/2.4/layer.js"></script>
		<script type="text/javascript" src="${path }/admin/static/h-ui/js/H-ui.min.js"></script>
		<script type="text/javascript" src="${path }/admin/static/h-ui.admin/js/H-ui.admin.js"></script>
		<!--/_footer 作为公共模版分离出去-->

		<!--请在下方写此页面业务相关的脚本-->
		<script type="text/javascript" src="${path }/admin/lib/jquery.contextmenu/jquery.contextmenu.r2.js"></script>
		<script type="text/javascript">
			/*个人信息*/
			function myselfinfo(url) {
				layer.open({
					type: 2,
					area: ['900px', '600px'],
					title: '查看信息',
					content: url,
					end: function () {  //刷新页面
				        location.reload();
				    }
				});
			}

			
		</script>

	</body>

</html>