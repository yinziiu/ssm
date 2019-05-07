<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set value="${pageContext.request.contextPath}" var="path" scope="page"/>
<script type="text/javascript">
    var path = "${path}";
</script>
<aside class="Hui-aside">
	<div class="menu_dropdown bk_2">
		<dl id="menu-article">
			<dt><i class="Hui-iconfont">&#xe616;</i>攻略管理<i class="Hui-iconfont menu_dropdown-arrow">&#xe6d5;</i></dt>
			<dd>
				<ul>
					<li><a data-href="${path}/article/article-list.jsp" data-title="攻略管理" href="javascript:void(0)">攻略列表</a></li>
				</ul>
			</dd>
		</dl>
		<dl id="menu-picture">
			<dt><i class="Hui-iconfont">&#xe613;</i> 图片管理<i class="Hui-iconfont menu_dropdown-arrow">&#xe6d5;</i></dt>
			<dd>
				<ul>
					<li><a data-href="${path}/picture/picture-list.jsp" data-title="图片管理" href="javascript:void(0)">图片管理</a></li>
				</ul>
			</dd>
		</dl>
		<dl id="menu-product">
			<dt><i class="Hui-iconfont">&#xe620;</i> 产品管理<i class="Hui-iconfont menu_dropdown-arrow">&#xe6d5;</i></dt>
			<dd>
				<ul>
					<li><a data-href="${path}/product/product-brand.jsp" data-title="品牌管理" href="javascript:void(0)">品牌管理</a></li>
					<li><a data-href="${path}/product/product-category.jsp" data-title="分类管理" href="javascript:void(0)">分类管理</a></li>
					<li><a data-href="${path}/product/product-list.jsp" data-title="产品管理" href="javascript:void(0)">产品管理</a></li>
				</ul>
			</dd>
		</dl>
		<dl id="menu-comments">
			<dt><i class="Hui-iconfont">&#xe622;</i> 评论管理<i class="Hui-iconfont menu_dropdown-arrow">&#xe6d5;</i></dt>
			<dd>
				<ul>
					<li><a data-href="http://h-ui.duoshuo.com/admin/" data-title="评论列表" href="javascript:;">评论列表</a></li>
					<li><a data-href="${path}/system/feedback-list.jsp" data-title="意见反馈" href="javascript:void(0)">意见反馈</a></li>
				</ul>
			</dd>
		</dl>
		<dl id="menu-member">
			<dt><i class="Hui-iconfont">&#xe60d;</i> 会员管理<i class="Hui-iconfont menu_dropdown-arrow">&#xe6d5;</i></dt>
			<dd>
				<ul>
					<li><a data-href="${path}/member/member-list.jsp" data-title="会员列表" href="javascript:;">会员列表</a></li>
					<li><a data-href="${path}/member/member-del.jsp" data-title="删除的会员" href="javascript:;">删除的会员</a></li>
					<li><a data-href="${path}/member/member-level.jsp" data-title="等级管理" href="javascript:;">等级管理</a></li>
					<li><a data-href="${path}/member/member-scoreoperation.jsp" data-title="积分管理" href="javascript:;">积分管理</a></li>
					<li><a data-href="${path}/member/member-record-browse.jsp" data-title="浏览记录" href="javascript:void(0)">浏览记录</a></li>
					<li><a data-href="${path}/member/member-record-download.jsp" data-title="下载记录" href="javascript:void(0)">下载记录</a></li>
					<li><a data-href="${path}/member/member-record-share.jsp" data-title="分享记录" href="javascript:void(0)">分享记录</a></li>
				</ul>
			</dd>
		</dl>
		<dl id="menu-admin">
			<dt><i class="Hui-iconfont">&#xe62d;</i> 管理员管理<i class="Hui-iconfont menu_dropdown-arrow">&#xe6d5;</i></dt>
			<dd>
				<ul>
					<li><a data-href="${path}/admin_/admin-role.jsp" data-title="角色管理" href="javascript:void(0)">角色管理</a></li>
					<li><a data-href="${path}/admin_/admin-permission.jsp" data-title="权限管理" href="javascript:void(0)">权限管理</a></li>
					<li><a data-href="${path}/admin_/admin-list.jsp" data-title="管理员列表" href="javascript:void(0)">管理员列表</a></li>
				</ul>
			</dd>
		</dl>
		<dl id="menu-tongji">
			<dt><i class="Hui-iconfont">&#xe61a;</i> 系统统计<i class="Hui-iconfont menu_dropdown-arrow">&#xe6d5;</i></dt>
			<dd>
				<ul>
					<li><a data-href="${path}/charts/charts-1.jsp" data-title="折线图" href="javascript:void(0)">折线图</a></li>
					<li><a data-href="${path}/charts/charts-2.jsp" data-title="时间轴折线图" href="javascript:void(0)">时间轴折线图</a></li>
					<li><a data-href="${path}/charts/charts-3.jsp" data-title="区域图" href="javascript:void(0)">区域图</a></li>
					<li><a data-href="${path}/charts/charts-4.jsp" data-title="柱状图" href="javascript:void(0)">柱状图</a></li>
					<li><a data-href="${path}/charts/charts-5.jsp" data-title="饼状图" href="javascript:void(0)">饼状图</a></li>
					<li><a data-href="${path}/charts/charts-6.jsp" data-title="3D柱状图" href="javascript:void(0)">3D柱状图</a></li>
					<li><a data-href="${path}/charts/charts-7.jsp" data-title="3D饼状图" href="javascript:void(0)">3D饼状图</a></li>
				</ul>
			</dd>
		</dl>
		<dl id="menu-system">
			<dt><i class="Hui-iconfont">&#xe62e;</i> 系统管理<i class="Hui-iconfont menu_dropdown-arrow">&#xe6d5;</i></dt>
			<dd>
				<ul>
					<li><a data-href="${path}/system/system-base.jsp" data-title="系统设置" href="javascript:void(0)">系统设置</a></li>
					<li><a data-href="${path}/system/system-category.jsp" data-title="栏目管理" href="javascript:void(0)">栏目管理</a></li>
					<li><a data-href="${path}/system/system-data.jsp" data-title="数据字典" href="javascript:void(0)">数据字典</a></li>
					<li><a data-href="${path}/system/system-shielding.jsp" data-title="屏蔽词" href="javascript:void(0)">屏蔽词</a></li>
					<li><a data-href="${path}/system/system-log.jsp" data-title="系统日志" href="javascript:void(0)">系统日志</a></li>
				</ul>
			</dd>
		</dl>
	</div>
</aside>
<div class="dislpayArrow hidden-xs"><a class="pngfix" href="javascript:void(0);" onClick="displaynavbar(this)"></a></div>