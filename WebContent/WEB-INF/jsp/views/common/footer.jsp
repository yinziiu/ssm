<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set value="${pageContext.request.contextPath}" var="path"
	scope="page" />
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<script type="text/javascript">
    var path = "${path}";
</script>
<html>

	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<link href="${path}/style/common/css/mfw-footer.css" rel="stylesheet" />
	</head>
	
	<body>
		<div id="footer">
			<div class="ft-content">
				<div class="ft-copyright" style="text-align: center;">
					<p>Copyright@2019 ITCAST. All Rights Reserved</p>
					<p>冯秀茵 版权所有</p>
				</div>
			</div>
		</div>
	</body>
</html>