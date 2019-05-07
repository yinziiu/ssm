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
		<title>编辑用户</title>
		<style type="text/css">
			 #myphoto{
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
			<c:if test="${!empty user.photo }">
				<form class="form form-horizontal" method="post" id="update-photo" enctype="multipart/form-data">
					<div class="row cl" style="display: none">
						<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>id：</label>
						<div class="formControls col-xs-4 col-sm-5">
							<input type="text" class="input-text" value="${user.id }" placeholder="" id="id" name="id">
						</div>
					</div>
					<div class="row cl">
						<label class="form-label col-xs-4 col-sm-3">头像：</label>
						<div class="formControls col-xs-4 col-sm-5">
	            			<img src="${path }${user.photo}" width="90" height="90" >
						</div>
					</div>
					<div class="row cl">
						<label class="form-label col-xs-4 col-sm-3"></label>
						<div class="formControls col-xs-4 col-sm-5">
							<input type="button" id="btn" value="修改头像" /><span id="text">请上传图片格式</span>
							<input type="file" name="myphoto" id="myphoto" />
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
			<c:if test="${empty user.photo }">
				<form class="form form-horizontal" method="post" id="update-photo" enctype="multipart/form-data">
					<div class="row cl" style="display: none">
						<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>id：</label>
						<div class="formControls col-xs-4 col-sm-5">
							<input type="text" class="input-text" value="${user.id }" placeholder="" id="id" name="id">
						</div>
					</div>
					<div class="row cl">
						<label class="form-label col-xs-4 col-sm-3">头像：</label>
						<div class="formControls col-xs-4 col-sm-5">
	            			<img src="${path }${user.photo}" width="90" height="90" >
						</div>
					</div>
					<div class="row cl">
						<label class="form-label col-xs-4 col-sm-3"></label>
						<div class="formControls col-xs-4 col-sm-5">
							<input type="button" id="btn" value="选择头像" /><span id="text">请上传图片格式</span>
							<input type="file" name="myphoto" id="myphoto" />
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
			<form class="form form-horizontal" method="post" id="update-user" enctype="multipart/form-data">
				<div class="row cl" style="display: none">
					<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>id：</label>
					<div class="formControls col-xs-4 col-sm-5">
						<input type="text" class="input-text" value="${user.id }" placeholder="" id="id" name="id">
					</div>
				</div>
				<div class="row cl" style="display: none">
					<label class="form-label col-xs-4 col-sm-3">角色id：</label>
					<div class="formControls col-xs-4 col-sm-5">
						<input type="text" id="rid" name="rid" value="1" class="input-text" readonly="readonly">
					</div>
				</div>
				<div class="row cl">
					<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>用户名：</label>
					<div class="formControls col-xs-4 col-sm-5">
						<input type="text" class="input-text" value="${user.username }" placeholder="请输入用户名" id="username" name="username">
					</div>
				</div>
				<div class="row cl">
					<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>密码：</label>
					<div class="formControls col-xs-4 col-sm-5">
						<input type="password" class="input-text" autocomplete="off" value="${user.password }" placeholder="请输入密码" id="password" name="password">
					</div>
				</div>
				<div class="row cl">
					<label class="form-label col-xs-4 col-sm-3">性别：</label>
					<div class="formControls col-xs-4 col-sm-5 skin-minimal">
						<div class="radio-box">
							<input value="0" name="sex" type="radio" id="sex-0" <c:if test="${user.sex eq '0'}"> checked="checked"</c:if> />
							<label for="sex-0">男</label>
						</div>
						<div class="radio-box">
							<input value="1" type="radio" id="sex-1" name="sex" <c:if test="${user.sex eq '1'  }">checked="checked"</c:if> />
							<label for="sex-1">女</label>
						</div>
						<div class="radio-box">
							<input value="2" type="radio" id="sex-2" name="sex" <c:if test="${user.sex eq '2'  }">checked="checked"</c:if> />
							<label for="sex-2">保密</label>
						</div>
					</div>
				</div>
				<div class="row cl">
					<label class="form-label col-xs-4 col-sm-3">出生日期：</label>
					<div class="formControls col-xs-4 col-sm-5">
						<input type="text" onfocus="WdatePicker({ dateFmt:'yyyy-MM-dd',maxDate:'#F{$dp.$D(\'birthday\')||\'%y-%M-%d\'}' })" id="birthday" name="birthday" value="${user.birthday }" class="input-text Wdate">
					</div>
				</div>
				<div class="row cl">
					<label class="form-label col-xs-4 col-sm-3">城市：</label>
					<div class="formControls col-xs-4 col-sm-5">
						<input type="text" class="input-text" value="${user.city }" placeholder="请输入城市" id="city" name="city">
					</div>
				</div>
				<div class="row cl">
					<label class="form-label col-xs-4 col-sm-3">手机：</label>
					<div class="formControls col-xs-4 col-sm-5">
						<input type="text" class="input-text" value="${user.phone }" placeholder="请输入手机" id="phone" name="phone">
					</div>
				</div>
				<div class="row cl">
					<label class="form-label col-xs-4 col-sm-3">邮箱：</label>
					<div class="formControls col-xs-4 col-sm-5">
						<input type="text" class="input-text" value="${user.email }" placeholder="请输入邮箱@" name="email" id="email">
					</div>
				</div>
				<div class="row cl">
					<label class="form-label col-xs-4 col-sm-3">个性签名：</label>
					<div class="formControls col-xs-4 col-sm-5">
						<textarea name="resume" id="resume" cols="" rows="" class="textarea"  placeholder="说点什么...300个字符以内" dragonfly="true" onKeyUp="$.Huitextarealength(this,300)">${user.resume }</textarea>
						<p class="textarea-numberbar"><em class="textarea-length">0</em>/300</p>
					</div>
				</div>
				<div class="row cl">
					<div class="col-xs-4 col-sm-5 col-xs-offset-4 col-sm-offset-3">
						<button lay-filter="Add" onClick="save();" class="btn btn-primary radius" type="submit" >
							<i class="Hui-iconfont">&#xe632;</i> 修改
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
		
			$("#myphoto").change(function () {
		        $("#text").html($("#myphoto").val());
			});	
		
			$(".Huiform").Validform();
			
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
		
			function photo(){
	       		var formData = new FormData($("#update-photo")[0]);//此处id为form表单的id
	       		$.ajax({  
		            url: "${path}/update_photo" ,  
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
			
			function save(){
	       		var formData = new FormData($("#update-user")[0]);//此处id为form表单的id
	       		$.ajax({  
		            url: "${path}/update_User" ,  
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