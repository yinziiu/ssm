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
		<meta charset="utf-8">
		<meta name="renderer" content="webkit|ie-comp|ie-stand">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no" />
		<meta http-equiv="Cache-Control" content="no-siteapp" />
		<link type="text/css" rel="stylesheet" href="${path }/admin/static/h-ui/css/H-ui.css" />
		<link type="text/css" rel="stylesheet" href="${path }/admin/static/h-ui.admin/css/H-ui.admin.css" />
		<link type="text/css" rel="stylesheet" href="${path }/admin/lib/font-awesome-4.7.0/css/font-awesome.min.css" />
		<link rel="stylesheet" type="text/css" href="${path }/admin/lib/Hui-iconfont/1.0.8/iconfont.css" />
		<link rel="stylesheet" type="text/css" href="${path }/admin/static/h-ui.admin/skin/default/skin.css" id="skin" />
		<link rel="stylesheet" type="text/css" href="${path }/admin/static/h-ui.admin/css/style.css" />
		<title>添加管理员</title>
		<style type="text/css">
			 #viphoto{
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
		<div class="Huiform">
			<form class="form form-horizontal" id="view-images-add" method="post" enctype="multipart/form-data">
				<div class="row cl"> 
					<label class="form-label col-xs-4 col-sm-3">景点id：</label>
					<div class="formControls col-xs-4 col-sm-5">
						<input type="text" name="vid" id="vid" value="${vid }" />
					</div>
				</div>
				<div class="row cl">
					<label class="form-label col-xs-4 col-sm-3">景点图片：</label>
					<div class="formControls col-xs-4 col-sm-5">
						<input type="button" id="btn" value="选择图片" /><span id="text">请上传图片格式</span>
						<input type="file" name="viphoto" id="viphoto" />
					</div>
				</div>
				<div class="row cl">
					<div class="col-xs-4 col-sm-5 col-xs-offset-4 col-sm-offset-3">
						<button lay-filter="Add" onClick="save();" class="btn btn-primary radius" type="submit" >
							<i class="Hui-iconfont">&#xe632;</i> 保存
						</button>
						<button onClick="layer_close();" class="btn btn-default radius" type="button">&nbsp;&nbsp;取消&nbsp;&nbsp;</button>
					</div>
				</div>
			</form>
		</div>
		<!--_footer 作为公共模版分离出去-->
		<script type="text/javascript" src="${path }/admin/lib/jquery/1.9.1/jquery.min.js"></script> 
		<script type="text/javascript" src="${path }/admin/lib/layer/2.4/layer.js"></script>
		<script type="text/javascript" src="${path }/admin/static/h-ui/js/H-ui.min.js"></script> 
		<script type="text/javascript" src="${path }/admin/static/h-ui.admin/js/H-ui.admin.js"></script> <!--/_footer /作为公共模版分离出去-->
		
		<!--请在下方写此页面业务相关的脚本-->
		<script type="text/javascript" src="${path }/admin/lib/My97DatePicker/4.8/WdatePicker.js"></script>
		<script type="text/javascript" src="${path }/admin/lib/jquery.validation/1.14.0/jquery.validate.js"></script> 
		<script type="text/javascript" src="${path }/admin/lib/jquery.validation/1.14.0/validate-methods.js"></script> 
		<script type="text/javascript" src="${path }/admin/lib/jquery.validation/1.14.0/messages_zh.js"></script>
		<script type="text/javascript" src="${path }/admin/lib/webuploader/0.1.5/webuploader.min.js"></script> 
		<script type="text/javascript" src="${path }/admin/lib/ueditor/1.4.3/ueditor.config.js"></script> 
		<script type="text/javascript" src="${path }/admin/lib/ueditor/1.4.3/ueditor.all.min.js"> </script> 
		<script type="text/javascript" src="${path }/admin/lib/ueditor/1.4.3/lang/zh-cn/zh-cn.js"></script>
		<script type="text/javascript">
			
			$("#viphoto").change(function () {
		        $("#text").html($("#viphoto").val());
			});	
		
			$(".Huiform").Validform();
			
			function save(){
	       		var formData = new FormData($("#view-images-add")[0]);//此处id为form表单的id
		        $.ajax({  
		            url: "${path}/AddViewPhoto" ,  
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