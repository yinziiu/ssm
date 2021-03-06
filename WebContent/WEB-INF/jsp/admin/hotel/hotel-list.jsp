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
<!--[if lt IE 9]>
<script type="text/javascript" src="lib/html5shiv.js"></script>
<script type="text/javascript" src="lib/respond.min.js"></script>
<![endif]-->
<link rel="stylesheet" type="text/css" href="${path }/admin/static/h-ui/css/H-ui.min.css" />
<link rel="stylesheet" type="text/css" href="${path }/admin/static/h-ui.admin/css/H-ui.admin.css" />
<link rel="stylesheet" type="text/css" href="${path }/admin/lib/Hui-iconfont/1.0.8/iconfont.css" />
<link rel="stylesheet" type="text/css" href="${path }/admin/static/h-ui.admin/skin/default/skin.css" id="skin" />
<link rel="stylesheet" type="text/css" href="${path }/admin/static/h-ui.admin/css/style.css" />
<!--[if IE 6]>
<script type="text/javascript" src="lib/DD_belatedPNG_0.0.8a-min.js" ></script>
<script>DD_belatedPNG.fix('*');</script>
<![endif]-->
<title>酒店列表</title>
<link rel="stylesheet" href="${path }/admin/lib/zTree/v3/css/zTreeStyle/zTreeStyle.css" type="text/css">
</head>
<body>
<nav class="breadcrumb"><i class="Hui-iconfont">&#xe67f;</i> 首页 <span class="c-gray en">&gt;</span>酒店管理 <span class="c-gray en">&gt;</span> 酒店列表
 <a class="btn btn-success radius r" style="line-height:1.6em;margin-top:3px" href="javascript:location.replace(location.href);" title="刷新" ><i class="Hui-iconfont">&#xe68f;</i></a></nav>
<div class="page-container">
	<div class="text-c"> 日期范围：
		<input type="text" onfocus="WdatePicker({ maxDate:'#F{$dp.$D(\'logmax\')||\'%y-%M-%d\'}' })" id="logmin" class="input-text Wdate" style="width:120px;">
		-
		<input type="text" onfocus="WdatePicker({ minDate:'#F{$dp.$D(\'logmin\')}',maxDate:'%y-%M-%d' })" id="logmax" class="input-text Wdate" style="width:120px;">
		<input type="text" name="" id="" placeholder=" 酒店名称" style="width:250px" class="input-text">
		<button name="" id="" class="btn btn-success" type="submit"><i class="Hui-iconfont">&#xe665;</i>搜酒店</button>
	</div>
	<div class="cl pd-5 bg-1 bk-gray mt-20"> 
		<span class="l">
			<a class="btn btn-primary radius" onclick="hotel_add('添加酒店','${path}/addHotel')" href="javascript:;">
			<i class="Hui-iconfont">&#xe600;</i> 添加酒店</a>
		</span>
		<span class="r">共有数据：<strong>${totalList }</strong> 条</span> 
	</div>
	<div class="mt-20">
		<table class="table table-border table-bordered table-bg table-hover table-sort">
			<thead>
				<tr class="text-c">
					<th><input name="" type="checkbox" value=""></th>
					<th width="40">ID</th>
					<th width="100">名称</th>
					<th width="100">酒店类型</th>
					<th width="100">地址</th>
					<th width="100">电话</th>
					<th width="80">图片</th>
					<th>简介</th>
					<th width="40">浏览数</th>
					<th width="40">最低价格</th>
					<th width="80">酒店相关信息</th>
					<th width="40">操作</th>
				</tr>
			</thead>
			<tbody>
			<c:forEach items="${hotelList }" var="list">
				<tr class="text-c va-m">
					<td><input name="" type="checkbox" value=""></td>
					<td class="text-l">${list.id }</td>
					<td class="text-l">${list.hname }</td>
					<td class="text-l">${list.hoteltype }</td>
					<td class="text-l">${list.address }</td>
					<td class="text-l">${list.phone }</td>
					<td class="text-l">
						<c:choose>
							<c:when test="${list.hphoto || list.hphoto =='' }">					
								<img width="80px" height="80px" src="${path }/images/icon/view.jpg">
							</c:when>
							<c:otherwise>
								<img width="80px" height="80px" src="${list.hphoto }" />
							</c:otherwise>
						</c:choose>
					</td>
					<td class="text-l">${list.hotelintro }</td>
					<td class="text-l">${list.hreadnum }</td>
					<td class="text-l">${list.lowprice }</td>
					<td class="f-14 user-manage">
						<a style="color: orange;" title="酒店房型" onclick="roomtype_show('${path}/getHotelRoomType2?id=${list.id }')"  class="ml-5">酒店房型</a> 
						<a style="color: orange;" title="基本信息" onclick="hotelinfo_show('${path}/getHotelInfo2?id=${list.id }')"  class="ml-5">基本信息</a> 
						<a style="color: orange;" title="酒店服务" onclick="hotelservice_show('${path}/getHotelServiceByHid?hid=${list.id }')"  class="ml-5">酒店服务</a> 
						<a style="color: orange;" title="酒店设备" onclick="hotelfac_show('${path}/getHotelFac2?hid=${list.id }')"  class="ml-5">酒店设备</a> 
						<a style="color: orange;" title="房间设备" onclick="roomfac_show('${path}/getHotelRoomInfo2?hid=${list.id }')"  class="ml-5">房间设备</a> 
						<a style="color: orange;" title="酒店攻略" onclick="hotelstory_show('${path}/getHotelStory2?id=${list.id }')"  class="ml-5">酒店攻略</a> 
       				</td>
					<td class="f-14 user-manage">
       					<a style="color: orange;" title="编辑" onclick="edit('编辑景点','${path}/updateHotel?id=${list.id }')"  class="ml-5">编辑</a> 
	    				<a style="color: orange;" title="删除" onclick="view_del(this,'${path}/deleteHotel?id=${list.id  }')"  class="ml-5">删除</a>
       				</td>
       			</tr>
			</c:forEach>
			</tbody>
		</table>
	</div>
</div>

<!--_footer 作为公共模版分离出去-->
<script type="text/javascript" src="${path }/admin/lib/jquery/1.9.1/jquery.min.js"></script> 
<script type="text/javascript" src="${path }/admin/lib/layer/2.4/layer.js"></script>
<script type="text/javascript" src="${path }/admin/static/h-ui/js/H-ui.min.js"></script> 
<script type="text/javascript" src="${path }/admin/static/h-ui.admin/js/H-ui.admin.js"></script> <!--/_footer 作为公共模版分离出去-->

<!--请在下方写此页面业务相关的脚本-->
<script type="text/javascript" src="${path }/admin/lib/zTree/v3/js/jquery.ztree.all-3.5.min.js"></script>
<script type="text/javascript" src="${path }/admin/lib/My97DatePicker/4.8/WdatePicker.js"></script> 
<script type="text/javascript" src="${path }/admin/lib/datatables/1.10.0/jquery.dataTables.min.js"></script> 
<script type="text/javascript" src="${path }/admin/lib/laypage/1.2/laypage.js"></script>
<script type="text/javascript">

$('.table-sort').dataTable({
	"aaSorting": [[ 1, "desc" ]],//默认第几个排序
	"bStateSave": true,//状态保存
	"aoColumnDefs": [
	  {"orderable":false,"aTargets":[0,6]}// 制定列不参与排序
	]
});
/*酒店-添加*/
function hotel_add(title,url){
	var index = layer.open({
		type: 2,
		title: title,
		content: url,
		area: ['90%', '100%'],
        end: function () {  //刷新页面
            location.reload();
        }
	});
}
/*酒店房型-查看*/
function roomtype_show(url){
	var index = layer.open({
		type: 2,
		title: false,
		content: url
	});
	layer.full(index);
}
/*酒店信息-查看*/
function hotelinfo_show(url){
	var index = layer.open({
		type: 2,
		title: false,
		content: url
	});
	layer.full(index);
}
/*酒店服务-查看*/
function hotelservice_show(url){
	var index = layer.open({
		type: 2,
		title: false,
		content: url
	});
	layer.full(index);
}
/*酒店设备-查看*/
function hotelfac_show(url){
	var index = layer.open({
		type: 2,
		title: false,
		content: url
	});
	layer.full(index);
}
/*房间设备-查看*/
function roomfac_show(url){
	var index = layer.open({
		type: 2,
		title: false,
		content: url
	});
	layer.full(index);
}
/*酒店攻略-查看*/
function hotelstory_show(url){
	var index = layer.open({
		type: 2,
		title: false,
		content: url
	});
	layer.full(index);
}

/*景点-编辑*/
function edit(title,url){
	var index = layer.open({
		type: 2,
		title: title,
		content: url,
		area: ['90%', '100%'],
        end: function () {  //刷新页面
            location.reload();
        }
	});
}

/*酒店-删除*/
function view_del(obj,url){
	layer.confirm('确认要删除吗？',{icon: 3, title:'删除提示'},function(index){
		$.ajax({
			type: 'POST',
			url: url,
			dataType: 'json',
			success: function(data){
				var data = eval('('+data+')');
				if (data.success){
					$(obj).parents("tr").remove();
                    layer.msg('删除成功', {icon: 1, zIndex: 66,});
				} else {
					 layer.msg('删除失败', {icon: 1, zIndex: 66,});
				}
				$.messager.show({ 
					 msg: result.msg
				});
			},
			error:function(data) {
				console.log(data.msg);
			},
		});	
		window.location.reload();
		layer.close(index);
		window.location.reload();
	});
}
</script>
</body>
</html>