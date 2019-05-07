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
		<title>添加酒店</title>
		<link rel="stylesheet" type="text/css" href="${path}/admin/static/h-ui/css/H-ui.min.css" />
		<link rel="stylesheet" type="text/css" href="${path}/admin/static/h-ui.admin/css/H-ui.admin.css" />
		<link rel="stylesheet" type="text/css" href="${path}/admin/lib/Hui-iconfont/1.0.8/iconfont.css" />
		<link rel="stylesheet" type="text/css" href="${path}/admin/static/h-ui.admin/skin/default/skin.css" id="skin" />
		<link rel="stylesheet" type="text/css" href="${path}/admin/static/h-ui.admin/css/style.css" />
		<link rel="stylesheet" type="text/css" href="${path}/admin/lib/webuploader/0.1.5/webuploader.css"  />
	</head>

	<body>
		<div class="page-container">
			<form action="" method="post" class="form form-horizontal" id="vieworder-update">
				<div class="row cl" style="display: none">
					<label class="form-label col-xs-4 col-sm-2">订单id：</label>
					<div class="formControls col-xs-8 col-sm-9">
						<input type="text" class="input-text" value="${viewOrders.id }"  id="id" name="id"  readonly="readonly">
					</div>
				</div>
				<div class="row cl">
					<label class="form-label col-xs-4 col-sm-2">预订用户：</label>
					<div class="formControls col-xs-8 col-sm-9">
						<input type="text" class="input-text" value="${viewOrders.username }"  id="username" name="username" readonly="readonly">
					</div>
				</div>
				<div class="row cl" style="display: none">
					<label class="form-label col-xs-4 col-sm-2">用户id：</label>
					<div class="formControls col-xs-8 col-sm-9">
						<input type="text" class="input-text" value="${viewOrders.uid }"  id="uid" name="uid"  readonly="readonly">
					</div>
				</div>
				<div class="row cl">
					<label class="form-label col-xs-4 col-sm-2">景点名称：</label>
					<div class="formControls col-xs-8 col-sm-9">
						<input type="text" class="input-text" value="${viewOrders.vname }"  id="vname" name="vname" readonly="readonly">
					</div>
				</div>
				<div class="row cl" style="display: none">
					<label class="form-label col-xs-4 col-sm-2">景点id：</label>
					<div class="formControls col-xs-8 col-sm-9">
						<input type="text" class="input-text" value="${viewOrders.vid }"  id="vid" name="vid"  readonly="readonly">
					</div>
				</div>
				<div class="row cl">
					<label class="form-label col-xs-4 col-sm-2">门票名称：</label>
					<div class="formControls col-xs-8 col-sm-9">
						<input type="text" class="input-text" value="${viewOrders.tname }"  id="tname" name="tname" readonly="readonly">
					</div>
				</div>
				<div class="row cl" style="display: none">
					<label class="form-label col-xs-4 col-sm-2">门票id：</label>
					<div class="formControls col-xs-8 col-sm-9">
						<input type="text" class="input-text" value="${viewOrders.vtid }"  id="vtid" name="vtid"  readonly="readonly">
					</div>
				</div>
				<div class="row cl">
					<label class="form-label col-xs-4 col-sm-2">门票类型：</label>
					<div class="formControls col-xs-8 col-sm-9">
						<input type="text" class="input-text" value="${viewOrders.ttype }"  id="ttype" name="ttype"  readonly="readonly">
					</div>
				</div>
				<div class="row cl">
					<label class="form-label col-xs-4 col-sm-2">出生日期：</label>
					<div class="formControls col-xs-8 col-sm-9">
						<input value="${viewOrders.tratime }" type="text" onfocus="WdatePicker({ dateFmt:'yyyy-MM-dd',minDate:'#F{$dp.$D(\'tratime\')||\'%y-%M-%d\'}' })" id="tratime" name="tratime" class="input-text Wdate">
					</div>
				</div>
				<div class="row cl">
					<label class="form-label col-xs-4 col-sm-2">预订时间：</label>
					<div class="formControls col-xs-8 col-sm-9">
						<input value="${viewOrders.booktime }" type="text" class="input-text"  readonly="readonly">
					</div>
				</div>
				<div class="row cl">
					<label class="form-label col-xs-4 col-sm-2">门票数量：</label>
					<div class="formControls col-xs-8 col-sm-9">
						<input type="text" class="input-text" value="${viewOrders.ordertotal }"  id="ordertotal" name="ordertotal" >
					</div>
				</div>
				<div class="row cl">
					<label class="form-label col-xs-4 col-sm-2">价格：</label>
					<div class="formControls col-xs-8 col-sm-9">
						<input type="text" class="input-text" value="${price}" style="width: 90%" readonly="readonly">元
					</div>
				</div>
				<div class="row cl">
					<label class="form-label col-xs-4 col-sm-2">总价格：</label>
					<div class="formControls col-xs-8 col-sm-9">
						<input type="text" name="tprice" id="tprice" value="${viewOrders.tprice }" class="input-text" style="width: 90%" readonly="readonly"> 元
					</div>
				</div>
				<div class="row cl">
					<label class="form-label col-xs-4 col-sm-2">订单号：</label>
					<div class="formControls col-xs-8 col-sm-9">
						<input type="text" name="ordernumber" id="ordernumber"  value="${viewOrders.ordernumber }" class="input-text" readonly="readonly"> 
					</div>
				</div>
				<div class="row cl">
					<label class="form-label col-xs-4 col-sm-2">联系人：</label>
					<div class="formControls col-xs-8 col-sm-9">
						<input type="text" name="bookname" id="bookname" placeholder="请输入联系人" value="${viewOrders.bookname }" class="input-text" > 
					</div>
				</div>
				<div class="row cl">
					<label class="form-label col-xs- col-sm-2">联系电话：</label>
					<div class="formControls col-xs-4 col-sm-5">
						<input type="text" name="bookphone" id="bookphone" placeholder="请输入联系电话" value="${viewOrders.bookphone }" class="input-text" > 
					</div>
				</div>
				<div class="row cl">
					<label class="form-label col-xs-4 col-sm-2">备注：</label>
					<div class="formControls col-xs-8 col-sm-9">
						<input type="text" name="remark" id="remark" value="${viewOrders.remark }" class="input-text" readonly="readonly"> 
					</div>
				</div>
				<div class="row cl">
					<label class="form-label col-xs-4 col-sm-2">状态：</label>
					<div class="formControls col-xs-8 col-sm-9">
						<input type="text" name="status" id="status" value="${viewOrders.status }" class="input-text" readonly="readonly"> 
					</div>
				</div>
				<div class="row cl">
					<div class="col-xs-8 col-sm-9 col-xs-offset-4 col-sm-offset-2">
						<button onClick="save();" class="btn btn-primary radius" type="submit">
							<i class="Hui-iconfont">&#xe632;</i> 保存
						</button>
						<button onClick="layer_close();" class="btn btn-default radius" type="button">&nbsp;&nbsp;取消&nbsp;&nbsp;</button>
					</div>
				</div>
			</form>
		</div>

		<!--_footer 作为公共模版分离出去-->
		<script type="text/javascript" src="${path}/admin/lib/jquery/1.9.1/jquery.min.js"></script>
		<script type="text/javascript" src="${path}/admin/lib/layer/2.4/layer.js"></script>
		<script type="text/javascript" src="${path}/admin/static/h-ui/js/H-ui.min.js"></script>
		<script type="text/javascript" src="${path}/admin/static/h-ui.admin/js/H-ui.admin.js"></script>
		<!--/_footer 作为公共模版分离出去-->

		<!--请在下方写此页面业务相关的脚本-->
		<script type="text/javascript" src="${path}/admin/lib/My97DatePicker/4.8/WdatePicker.js"></script>
		<script type="text/javascript" src="${path}/admin/lib/jquery.validation/1.14.0/jquery.validate.js"></script>
		<script type="text/javascript" src="${path}/admin/lib/jquery.validation/1.14.0/validate-methods.js"></script>
		<script type="text/javascript" src="${path}/admin/lib/jquery.validation/1.14.0/messages_zh.js"></script>
		<script type="text/javascript" src="${path}/admin/lib/webuploader/0.1.5/webuploader.min.js"></script>
		<script type="text/javascript" src="${path}/admin/lib/ueditor/1.4.3/ueditor.config.js"></script>
		<script type="text/javascript" src="${path}/admin/lib/ueditor/1.4.3/ueditor.all.min.js"></script>
		<script type="text/javascript" src="${path}/admin/lib/ueditor/1.4.3/lang/zh-cn/zh-cn.js"></script>
		<script type="text/javascript">
			function save(){
	       		var formData = new FormData($("#update_ViewOrder")[0]);//此处id为form表单的id
		        $.ajax({  
		            url: "${path}/update_ViewOrder" ,  
		            type: 'POST',  
		            data: formData,  
		            async: false,  
		            cache: false,  
		            contentType: false,  
		            processData: false,  
		            success: function (result) {
	                	var result = eval('('+result+')');
	                    if (result.success) {
	                    	 layer.msg('添加成功!',{icon:1,time:1000});
	                    	 window.parent.location.reload();//刷新父页面
	         	             var index=parent.layer.getFrameIndex(window.name);//获取当前弹出层的层级
	         		         parent.layer.close(index);//关闭弹出层
	                    }else {
	                    	layer.msg('添加失败!',{icon:1,time:1000});
	                    	mesTitle = '添加失败';
						}
	                    $.messager.show({ 
	                    	title: mesTitle,
							 msg: result.msg
						});
	                },
	  			 });
	        }
		</script>
	</body>
</html>