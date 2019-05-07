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
		<title>我的头像</title>
		<link href="${path}/style/avatar/avatar.css" rel="stylesheet" />
		<link href="${path}/style/avatar/isettings.css" rel="stylesheet" />
		<link href="${path}/style/avatar/jquery.Jcrop.css" rel="stylesheet" />
		<script src="${path}/style/js/jquery/2.0.0/jquery.min.js" type="text/javascript"></script>
		<script src="${path}/style/avatar/avatar1.js" type="text/javascript"></script>
		<script src="${path}/style/avatar/avatar2.js" type="text/javascript"></script>
		<script src="${path}/style/avatar/avatar3.js" type="text/javascript"></script>
		<style type="text/css">
			 #myphoto{
	           	position: absolute;
	            left: 0;
	            top: 0;
	            opacity: 0;
        	}
        	
			#btn{
				height:40px;
				width:120px;
	            padding: 5px 10px;
	            background: orange;
	            color: #FFF;
	            border: none;
	            border-radius: 5px;
            } 
            #text{
            	margin-left: 10px;
            }
		</style>
	</head>

	<body>
		
		<%@include file="../common/head.jsp"%>
		
		<div class="wrapper clearfix">
			<div class="aside">
				<a href="${path }/web/userinfo" ><i class="i1"></i>我的信息</a>
				<a href="${path }/web/useravatar" class="on"><i class="i2"></i>我的头像</a>
				<a href="${path }/web/updatepwd"><i class="i3"></i>修改密码</a>
			</div>

			<div class="content">
				<div class="hd">
					<strong>我的头像</strong>
				</div>
				<div class="userlogo">
					<form action="${path }/web/updateuseravatar" method="post" enctype="multipart/form-data">
						<div class="avatar" id="_j_avatar_box">
							<c:choose>
								<c:when test="${dbuser.photo==null || dbuser.photo =='' }">
									<img src="${path}/images/icon/1.jpeg" height="120" width="120" border="0">
								</c:when>
								<c:otherwise>
									<img src="${path}${dbuser.photo }" height="120" width="120" border="0" />
								</c:otherwise>
							</c:choose>
						</div>
						<dl class="clearfix" style="display: none">
							<dt>id：</dt>
							<dd><input type="text" name="id" value="${dbuser.id }" ></dd>
						</dl>
						<dl class="btn-sub"><dd>
							<input type="button" id="btn" style="font-size: 16px;" value="选择图片" /><span id="text">图片格式</span>
							<input type="file" name="myphoto" id="myphoto" /></dd>
						</dl>
						<br><br>
						<div class="btn-sub">
							<input type="submit" class="btn" id="_j_upload" style="position: relative; z-index: 1;">
						</div>
					</form>
				</div>
			</div>
		</div>
		
		<script type="text/javascript">
			$("#myphoto").change(function () {
		        $("#text").html($("#myphoto").val());
			});	
		</script>
		
		<%@include file="../common/footer.jsp"%>
		
	</body>
</html>