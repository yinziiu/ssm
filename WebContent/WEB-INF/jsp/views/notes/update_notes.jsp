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
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>添加文字 - 写游记</title>
		<link href="${path}/style/write_notes/write_notes.css" rel="stylesheet" />
		<link href="${path}/style/write_notes/write_notes2.css" rel="stylesheet" />
		<script src="${path}/style/js/jquery/2.0.0/jquery.min.js" type="text/javascript"></script>
		<script src="${path}/style/common/js/BrowserState.js" type="text/javascript"></script>
		<script src="${path}/style/write_notes/hls.min.js" type="text/javascript"></script>
		<script src="${path}/style/write_notes/write_notes1.js" type="text/javascript"></script>
		<script src="${path}/style/write_notes/write_notes2.js" type="text/javascript"></script>
		<script src="${path}/style/write_notes/write_notes3.js" type="text/javascript"></script>
	
		<style type="text/css">
			body{
				background: url("${path}/images/icon/ban.jpg");
				margin: 0 auto;
				background-size: 100% 100%;
			}
			#topic{
				background: url("${path }/images/icon/timg.png") no-repeat;
				background-size: 100% 300px;
			}
		</style>
	</head>
	
	<body>
		
		<%@include file="../common/head.jsp"%>
		<style type="text/css">
			 #nphoto{
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
		<form action="${path }/web/update_notes" method="post" enctype="multipart/form-data">
			<input type="text" id="uid" name="uid" value="${dbuser.id }" style="display: none;" >
			<input type="text" id="id" name="id" value="${notes.id }" style="display: none;" >
			<div id="topic"  class="pagelet-block" >
				<div class="set_index" id="_j_cover_box" style="height: 300px;">
					<div class="set_title ">
						<input type="text" id="notesname" name="notesname" value="${notes.notesname }" placeholder="填写游记名称" maxlength="48">
					</div>
				</div>
			</div>
			<div class="container clearfix" >
				<div class="content pagelet-block" style="background-color: " >
					<div class="block-loading loading_backward"></div>
					<div class="_j_content_box">
						<div class="textarea_placeholder _j_plc_item _j_inited with_placeholder_word">
							<textarea id="notescomment" name="notescomment" cols="30" rows="15" class="textarea _j_textarea _j_textareaplc" data-exclude_class="_j_textarea _j_textareaplc" placeholder="从这里开始游记正文...">${notes.notescomment }</textarea>
						</div>
					</div>
				</div>
				<div id="sidebar" class="sidebar pagelet-block" >
					<div class="_j_sidebar_sticky_cnt">
						<div class="sidebar-item _j_sidebar_item">
							<img width="120px;" height="120px" alt="" src="${path }${notes.notesphoto}">
						</div>			
					</div>
				</div>
				<div id="sidebar" class="sidebar pagelet-block" >
					<div class="_j_sidebar_sticky_cnt">
						<div class="sidebar-item _j_sidebar_item">
							<input type="button" id="btn" value="修改图片" /><span id="text">请上传图片格式</span>
							<input type="file" name="nphoto" id="nphoto" />
						</div>			
					</div>
				</div>
				<div class="action-ft">
					<div class="action-wrap">
						<div class="item-btn _js_actionBtn">
							<input class="btn-publish _j_btn_publish" style=" margin: 0;padding: 0;border: 1px solid transparent;outline: none;width: 150px;height: 60px" type="submit" value="发表游记"/>
						</div>
					</div>
				</div>		
			</div>
		</form>
		
		<%@include file="../common/footer.jsp"%>
	</body>
</html>