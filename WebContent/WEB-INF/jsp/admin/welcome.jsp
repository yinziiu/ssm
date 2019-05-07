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
<meta charset="utf-8">
<meta name="renderer" content="webkit|ie-comp|ie-stand">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no" />
<meta http-equiv="Cache-Control" content="no-siteapp" />
<link rel="stylesheet" type="text/css" href="${path }/admin/static/h-ui/css/H-ui.min.css" />
<link rel="stylesheet" type="text/css" href="${path }/admin/static/h-ui.admin/css/H-ui.admin.css" />
<link rel="stylesheet" type="text/css" href="${path }/admin/lib/Hui-iconfont/1.0.8/iconfont.css" />
<link rel="stylesheet" type="text/css" href="${path }/admin/static/h-ui.admin/skin/default/skin.css" id="skin" />
<link rel="stylesheet" type="text/css" href="${path }/admin/static/h-ui.admin/css/style.css" />
<title>我的桌面</title>
<style type="text/css">
	/* body{
		background: url("${path}/images/icon/bann.jpg");
		background-size: 100% 100%;
		font-family: 'Roboto', sans-serif;
	} */

</style>
</head>
<body>
<div class="page-container">
	<p class="f-20 text-success" style="color: orange;font-size: 30px;text-align: center;">欢迎使用贺州名胜景点推荐系统后台管理！</p>
	<br>
	<table class="table table-border table-bordered table-bg">
		<thead>
			<tr>
				<th colspan="13" scope="col" style="color: orange;font-size: 16px;text-align: center;">信息统计</th>
			</tr>
			<tr class="text-c">
				<th>统计</th>
				<th>景点</th>
				<th>酒店</th>
				<th>美食</th>
				<th>攻略</th>
				<th>游记</th>
				<th>景点订单</th>
				<th>酒店订单</th>
				<th>景点点评</th>
				<th>酒店点评</th>
				<th>美食点评</th>
				<th>用户</th>
				<th>管理员</th>
			</tr>
		</thead>
		<tbody>
			<tr class="text-c">
				<td>总数</td>
				<td>${viewTotal }</td>
				<td>${hotelTotal }</td>
				<td>${foodTotal }</td>
				<td>${strategyTotal }</td>
				<td>${notesTotal }</td>
				<td>${vieworderTotal }</td>
				<td>${hotelorderTotal }</td>
				<td>${viewcommentTotal }</td>
				<td>${hotelcommentTotal }</td>
				<td>${foodcommentTotal }</td>
				<td>${userTotal }</td>
				<td>${adminTotal }</td>
			</tr>
		</tbody>
	</table>
	<table class="table table-border table-bordered table-bg mt-50">
		<thead>
			<tr>
				<th colspan="4" scope="col" style="color: orange;font-size: 16px;text-align: center;">景点管理</th>
			</tr>
			<tr class="text-c">
				<th>统计</th>
				<th>景点</th>
				<th>景点类型</th>
				<th>景点门票</th>
			</tr>
		</thead>
		<tbody>
			<tr class="text-c">
				<td>总数</td>
				<td>${viewTotal }</td>
				<td>${viewType }</td>
				<td>${viewticket }</td>
			</tr>
		</tbody>
	</table>
	<table class="table table-border table-bordered table-bg mt-50" >
		<thead>
			<tr>
				<th colspan="13" scope="col" style="color: orange;font-size: 16px;text-align: center;">酒店管理</th>
			</tr>
			<tr class="text-c">
				<th>统计</th>
				<th>酒店</th>
				<th>酒店类型</th>
				<th>房型管理</th>
				<th>酒店基本信息</th>
				<th>酒店服务</th>
				<th>酒店设备</th>
				<th>房间设备</th>
				<th>酒店攻略</th>
			</tr>
		</thead>
		<tbody>
			<tr class="text-c">
				<td>总数</td>
				<td>${hotelTotal }</td>
				<td>${hotelTotal1 }</td>
				<td>${hotelTotal2 }</td>
				<td>${hotelTotal3 }</td>
				<td>${hotelTotal4 }</td>
				<td>${hotelTotal5 }</td>
				<td>${hotelTotal6 }</td>
				<td>${hotelTotal7 }</td>
			</tr>
		</tbody>
	</table>
	<table class="table table-border table-bordered table-bg mt-50">
		<thead>
			<tr>
				<th colspan="2" scope="col">服务器信息</th>
			</tr>
		</thead>
		<tbody>
			<tr>
				<th width="30%">服务器名称</th>
				<td><span id="lbServerName">${s1 }</span></td>
			</tr>
			<tr>
				<td>Servlet路径</td>
				<td>${s2 }</td>
			</tr>
			<tr>
				<td>服务器端口号 </td>
				<td>${s3 }</td>
			</tr>
			<tr>
				<td>使用协议 </td>
				<td>${s4 }</td>
			</tr>
			<tr>
				<td>用户请求的URL</td>
				<td>${s5 }</td>
			</tr>
		</tbody>
	</table>
	
</div>
<footer class="footer mt-20">
	<div class="container">
		<p>Copyright &copy;20199 冯秀茵 All Rights Reserved.<br>
			本系统后台管理由<a href="http://www.h-ui.net/" target="_blank" title="H-ui前端框架">H-ui前端框架</a>完成
		</p>
	</div>
</footer>
<script type="text/javascript" src="${path }/admin/lib/jquery/1.9.1/jquery.min.js"></script> 
<script type="text/javascript" src="${path }/admin/static/h-ui/js/H-ui.min.js"></script> 
<script type="text/javascript" src="${path }/admin/lib/datatables/1.10.0/jquery.dataTables.min.js"></script> 

</body>
</html>