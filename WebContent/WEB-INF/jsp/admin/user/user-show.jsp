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
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no" />
<meta http-equiv="Cache-Control" content="no-siteapp" />
<!--[if lt IE 9]>
<script type="text/javascript" src="http://libs.useso.com/js/html5shiv/3.7/html5shiv.min.js"></script>
<script type="text/javascript" src="http://libs.useso.com/js/respond.js/1.4.2/respond.min.js"></script>
<script type="text/javascript" src="http://cdn.bootcss.com/css3pie/2.0beta1/PIE_IE678.js"></script>
<![endif]-->
<link type="text/css" rel="stylesheet" href="${path }/admin/static/h-ui/css/H-ui.css"/>
<link type="text/css" rel="stylesheet" href="${path }/admin/static/h-ui.admin/css/H-ui.admin.css"/>
<link type="text/css" rel="stylesheet" href="${path }/admin/lib/font-awesome-4.7.0/css/font-awesome.min.css"/>
<!--[if IE 7]>
<link href="http://www.bootcss.com/p/font-awesome/assets/css/font-awesome-ie7.min.css" rel="stylesheet" type="text/css" />
<![endif]-->
<title>用户查看</title>
</head>
<body>
<div class="cl pd-20" style=" background-color:#5bacb6">
	<c:choose>
		<c:when test="${userList.photo==null || userList.photo =='' }">					
			<img class="avatar avatar-XL l" src="images/user.png">
		</c:when>
		<c:otherwise>
			<img class="avatar avatar-XL l" src="${userList.photo }" />
		</c:otherwise>
	</c:choose>
  <dl style="margin-left:80px; color:#fff">
    <dt><span class="f-18">${userList.username }</span></dt>
    <dd class="pt-10 f-12" style="margin-left:0">
    <c:choose>
		<c:when test="${userList.resume==null || userList.resume =='' }">					
			 这家伙很懒，什么也没有留下
		</c:when>
		<c:otherwise>
			${userList.resume }
		</c:otherwise>
	</c:choose>
   </dd>
  </dl>
</div>
<div class="pd-20">
  <table class="table">
    <tbody>
      <tr>
        <th class="text-r" width="80">性别：</th>
        <td>${user.sex }</td>
      </tr>
       <tr>
        <th class="text-r">出生日期：</th>
        <td>${user.birthday }</td>
      </tr>
      <tr>
        <th class="text-r">城市：</th>
        <td>${user.city }</td>
      </tr>
      <tr>
        <th class="text-r">手机：</th>
        <td>${user.phone }</td>
      </tr>
      <tr>
        <th class="text-r">邮箱：</th>
        <td>${user.email }</td>
      </tr>
    </tbody>
  </table>
</div>
<script type="text/javascript" src="http://cdn.bootcss.com/jquery/2.1.3/jquery.min.js"></script>
<script type="text/javascript" src="${path }/admin/lib/Validform_v5.3.2/Validform_v5.3.2_min.js"></script> 
<script type="text/javascript" src="${path }/admin/static/h-ui/js/H-ui.min.js"></script> 
<script type="text/javascript" src="${path }/admin/static/h-ui.admin/js/H-ui.admin.js"></script> <!--/_footer 作为公共模版分离出去-->
<script>

</script>
</body>
</html>