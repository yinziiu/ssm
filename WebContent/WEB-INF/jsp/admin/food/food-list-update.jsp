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
		<title>添加美食</title>
		<link rel="stylesheet" type="text/css" href="${path}/admin/static/h-ui/css/H-ui.min.css" />
		<link rel="stylesheet" type="text/css" href="${path}/admin/static/h-ui.admin/css/H-ui.admin.css" />
		<link rel="stylesheet" type="text/css" href="${path}/admin/lib/Hui-iconfont/1.0.8/iconfont.css" />
		<link rel="stylesheet" type="text/css" href="${path}/admin/static/h-ui.admin/skin/default/skin.css" id="skin" />
		<link rel="stylesheet" type="text/css" href="${path}/admin/static/h-ui.admin/css/style.css" />
		<link rel="stylesheet" type="text/css" href="${path}/admin/lib/webuploader/0.1.5/webuploader.css"  />
	
		<style type="text/css">
			 #foodphoto{
	           	position: absolute;
	            left: 0;
	            top: 0;
	            opacity: 0;
        	}
        	
			#btn{
				height:30px;
	            padding: 5px 10px;
	            background: #0090E6;
	            color: #FFF;
	            border: none;
	            border-radius: 5px;
            } 
            #text{
            	color: red;
            	font-size: 12px;
            	padding-left: 3px;
            }
		
		</style>
	</head>

	<body>
		<div class="page-container">
			<c:if test="${!empty food.fphoto }">
				<form class="form form-horizontal" method="post" id="update-fphoto" enctype="multipart/form-data">
					<div class="row cl" style="display: none">
						<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>id：</label>
						<div class="formControls col-xs-4 col-sm-5">
							<input type="text" class="input-text" value="${food.id }"  id="id" name="id">
						</div>
					</div>
					<div class="row cl">
						<label class="form-label col-xs-4 col-sm-3">美食图片：</label>
						<div class="formControls col-xs-4 col-sm-5">
	            			<img id="fphoto" src="${path }${food.fphoto }" onchange="previewFile()" width="90" height="90" >
						</div>
					</div>
					<div class="row cl">
						<label class="form-label col-xs-4 col-sm-3"></label>
						<div class="formControls col-xs-4 col-sm-5">
	            			<input type="button" id="btn" value="修改图片" /><span id="text" >请上传图片格式</span>
							<input type="file" name="foodphoto" id="foodphoto" />
						</div>
					</div>
					<div class="row cl">
						<div class="col-xs-4 col-sm-5 col-xs-offset-4 col-sm-offset-3">
							<button onclick="photo()" class="btn btn-default radius" type="submit">
								<i class="Hui-iconfont">&#xe632;</i> 修改
							</button>
						</div>
					</div>
				</form>
			</c:if>
			<c:if test="${empty food.fphoto }">
				<form class="form form-horizontal" method="post" id="update-fphoto" enctype="multipart/form-data">
					<div class="row cl" style="display: none">
						<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>id：</label>
						<div class="formControls col-xs-4 col-sm-5">
							<input type="text" class="input-text" value="${food.id }"  id="id" name="id">
						</div>
					</div>
					<div class="row cl">
						<label class="form-label col-xs-4 col-sm-3">美食图片：</label>
						<div class="formControls col-xs-4 col-sm-5">
	            			<img id="fphoto" src="${path }${food.fphoto }"  onchange="previewFile()" width="90" height="90" >
						</div>
					</div>
					<div class="row cl">
						<label class="form-label col-xs-4 col-sm-3"></label>
						<div class="formControls col-xs-4 col-sm-5">
	            			<input type="button" id="btn" value="选择图片" /><span id="text" >请上传图片格式</span>
							<input type="file" name="foodphoto" id="foodphoto" />
						</div>
					</div>
					<div class="row cl">
						<div class="col-xs-4 col-sm-5 col-xs-offset-4 col-sm-offset-3">
							<button onclick="photo()" class="btn btn-default radius" type="submit">
								<i class="Hui-iconfont">&#xe632;</i> 提交
							</button>
						</div>
					</div>
				</form>
			</c:if>
			<form  method="post" class="form form-horizontal" id="food-update" enctype="multipart/form-data">
				<div class="row cl" style="display: none">
					<label class="form-label col-xs-4 col-sm-2"><span
					class="c-red">*</span>id：</label>
					<div class="formControls col-xs-8 col-sm-9">
						<input type="text" class="input-text" value="${food.id }" placeholder="请输入美食名称" id="id" name="id">
					</div>
				</div>
				<div class="row cl">
					<label class="form-label col-xs-4 col-sm-2"><span
					class="c-red">*</span>美食名称：</label>
					<div class="formControls col-xs-8 col-sm-9">
						<input type="text" class="input-text" value="${food.fname }" placeholder="请输入美食名称" id="fname" name="fname">
					</div>
				</div>
				<div class="row cl">
					<label class="form-label col-xs-4 col-sm-2">美食地址：</label>
					<div class="formControls col-xs-8 col-sm-9">
						<input type="text" class="input-text" value="${food.address }" placeholder="请输入地址" id="address" name="address">
					</div>
				</div>
				<div class="row cl">
					<label class="form-label col-xs-4 col-sm-2">简介：</label>
					<div class="formControls col-xs-8 col-sm-9">
						<textarea style="height: 200px" name="fcontent" id="fcontent" cols="" rows="" class="textarea"  placeholder="请输入美食简介" >${food.fcontent }</textarea>
					</div>
				</div>
				<div class="row cl">
					<label class="form-label col-xs-4 col-sm-2">人均消费：</label>
					<div class="formControls col-xs-8 col-sm-9">
						<input type="text" class="input-text" value="${food.expense }" placeholder="请输入人均消费" id="expense" name="expense">
					</div>
				</div>
				<div class="row cl">
					<div class="col-xs-8 col-sm-9 col-xs-offset-4 col-sm-offset-2">
						<button onClick="save();" class="btn btn-primary radius" type="submit">
							<i class="Hui-iconfont">&#xe632;</i> 修改
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
		
			$("#foodphoto").change(function () {
		        $("#text").html($("#foodphoto").val());
			});
			
			function previewFile() {
				var preview = document.querySelector('img');
			  	var file  = document.querySelector('input[type=file]').files[0];
			  	var reader  = new FileReader();

				  reader.onloadend = function () {
				    preview.src = reader.result;
				  }

				  if (file) {
				    reader.readAsDataURL(file);
				  } else {
				    preview.src = "";
				  }
			}
		
			function save(){
	       		var formData = new FormData($("#food-update")[0]);//此处id为form表单的id
	       		$.ajax({  
		            url: "${path}/updateFood" ,  
		            type: 'POST',  
		            data: formData,  
		            async: false,  
		            cache: false,  
		            contentType: false,  
		            processData: false,  
		            success: function (result) {
	                	var result = eval('('+result+')');
	                    if (result.success) {
	                    	 layer.msg('修改成功!',{icon:1,time:1000});
	                    	 window.parent.location.reload();//刷新父页面
	         	             var index=parent.layer.getFrameIndex(window.name);//获取当前弹出层的层级
	         		         parent.layer.close(index);//关闭弹出层
	                    }else {
	                    	layer.msg('修改失败!',{icon:1,time:1000});
	                    	mesTitle = '修改失败';
						}
	                    $.messager.show({ 
	                    	title: mesTitle,
							 msg: result.msg
						});
	                },
	  			 });
	        }
			
			function photo(){
	       		var formData = new FormData($("#update-fphoto")[0]);//此处id为form表单的id
	       		$.ajax({  
		            url: "${path}/updateFPhoto" ,  
		            type: 'POST',  
		            data: formData,  
		            async: false,  
		            cache: false,  
		            contentType: false,  
		            processData: false,  
		            success: function (result) {
	                	var result = eval('('+result+')');
	                    if (result.success) {
	                    	 layer.msg('修改成功!',{icon:1,time:1000});
	                    	 window.parent.location.reload();//刷新父页面
	         	             var index=parent.layer.getFrameIndex(window.name);//获取当前弹出层的层级
	         		         parent.layer.close(index);//关闭弹出层
	                    }else {
	                    	layer.msg('修改失败!',{icon:1,time:1000});
	                    	mesTitle = '修改失败';
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