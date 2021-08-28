<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import ="org.springframework.security.core.*,org.springframework.security.core.context.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>抱歉，您的管理者帳戶已被拒絕訪問</h1>

<h2>您的管理者帳戶憑證出現錯誤或帳戶不存在</h2>
<br><a href="/iiiHealth/login">請重新登入</a>
<br><br>
<%
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();

		if (auth != null) {
			out.println("管理者帳號 '" + auth.getName() + "' 正在訪問受保護的URL介面: ");
			out.println("<br>是否未認證 : "+auth.isAuthenticated());
			out.println("<br>權限 : "+auth.getAuthorities());
			out.println("<br>錯誤畫面 : "+request.getRequestURL());
		}
%>
</body>
</html>