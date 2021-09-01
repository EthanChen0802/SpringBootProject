<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page
	import="org.springframework.security.core.*,org.springframework.security.core.context.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>抱歉，您的帳戶已被拒絕訪問</h1>

	<h2>您的帳戶憑證出現錯誤或帳戶不存在</h2>
	<br>
	<a href="/Member/login">請重新登入</a>
	<br>
	<br>
	<%
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();

	if (auth != null) {
		out.println("User '" + auth.getName() + "' attempted to access the protected URL: ");
		out.println("<br>auth : " + auth.isAuthenticated());
		out.println("<br>Role : " + auth.getAuthorities());
		out.println("<br>Error Page : " + request.getRequestURL());
	}
	%>
</body>
</html>