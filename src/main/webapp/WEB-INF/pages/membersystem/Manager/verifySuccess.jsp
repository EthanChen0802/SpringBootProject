<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix='c' uri='http://java.sun.com/jsp/jstl/core'%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
	response.setContentType("text/html;charset=UTF-8");
response.setHeader("Cache-Control", "no-cache"); // HTTP 1.1
response.setHeader("Pragma", "no-cache"); // HTTP 1.0
response.setDateHeader("Expires", -1); // Prevents caching at the proxy server
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>register</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/MemberStyle.css">
<style>
fieldset {
	margin: 20px auto;
}

a {
	margin-left: 10px;
	margin-right: 10px;
}
</style>
</head>

<body>
	<fieldset>
		<legend>管理者註冊</legend>
		<div class="divItem">
			<h3>恭喜您，您的帳戶驗證成功!!</h3>
			<h4>
				<a href="/Manager/login">請點此登入</a>
			</h4>
		</div>
	</fieldset>
</body>

</html>