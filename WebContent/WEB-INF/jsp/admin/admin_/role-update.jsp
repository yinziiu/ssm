<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set value="${pageContext.request.contextPath}" var="path" scope="page"/>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<!--_meta 作为公共模版分离出去-->
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
<link rel="Bookmark" href="/favicon.ico" >
<link rel="Shortcut Icon" href="/favicon.ico" />
<link rel="stylesheet" type="text/css" href="${path }/admin/static/h-ui/css/H-ui.min.css" />
<link rel="stylesheet" type="text/css" href="${path }/admin/static/h-ui.admin/css/H-ui.admin.css" />
<link rel="stylesheet" type="text/css" href="${path }/admin/lib/Hui-iconfont/1.0.8/iconfont.css" />
<link rel="stylesheet" type="text/css" href="${path }/admin/static/h-ui.admin/skin/default/skin.css" id="skin" />
<link rel="stylesheet" type="text/css" href="${path }/admin/static/h-ui.admin/css/style.css" />
<title>添加角色</title>
</head>
<body>
<article class="page-container">
	<form action="" method="post" class="form form-horizontal" id="role-update">
		<div class="row cl" style="display: none">
			<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>id：</label>
			<div class="formControls col-xs-4 col-sm-5">
				<input type="text" class="input-text" value="${role.id }" placeholder="请输入角色名称" id="id" name="id">
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>角色名称：</label>
			<div class="formControls col-xs-4 col-sm-5">
				<input type="text" class="input-text" value="${role.name }" placeholder="请输入角色名称" id="name" name="name">
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
</article>

<!--_footer 作为公共模版分离出去-->
<script type="text/javascript" src="${path }/admin/lib/jquery/1.9.1/jquery.min.js"></script> 
<script type="text/javascript" src="${path }/admin/lib/layer/2.4/layer.js"></script>
<script type="text/javascript" src="${path }/admin/static/h-ui/js/H-ui.min.js"></script> 
<script type="text/javascript" src="${path }/admin/static/h-ui.admin/js/H-ui.admin.js"></script> <!--/_footer 作为公共模版分离出去-->

<!--请在下方写此页面业务相关的脚本-->
<script type="text/javascript" src="${path }/admin/lib/jquery.validation/1.14.0/jquery.validate.js"></script>
<script type="text/javascript" src="${path }/admin/lib/jquery.validation/1.14.0/validate-methods.js"></script>
<script type="text/javascript" src="${path }/admin/lib/jquery.validation/1.14.0/messages_zh.js"></script>
<script type="text/javascript">

function save(){
	var formData = new FormData($("#role-update")[0]);//此处id为form表单的id
    $.ajax({  
        url: "${path}/update_role" ,  
        type: 'POST',  
        data: formData,  
        async: false,  
        cache: false,  
        contentType: false,  
        processData: false,  
        success: function (result) {
        	var result = eval('('+result+')');
            if (result.success) {
            	 layer.msg('编辑成功!',{icon:1,time:2000});
            	 window.parent.location.reload();//刷新父页面
 	             var index=parent.layer.getFrameIndex(window.name);//获取当前弹出层的层级
 		         parent.layer.close(index);//关闭弹出层
            }else {
            	layer.msg('编辑失败!',{icon:1,time:1000});
            	mesTitle = '编辑失败';
			}
            $.messager.show({ 
            	title: mesTitle,
				 msg: result.msg
			});
        },
	});
} 
</script>
<!--/请在上方写此页面业务相关的脚本-->
</body>
</html>