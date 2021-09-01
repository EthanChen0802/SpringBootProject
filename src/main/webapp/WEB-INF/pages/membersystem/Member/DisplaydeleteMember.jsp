<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="java.util.*"%>
<%@ taglib prefix='c' uri='http://java.sun.com/jsp/jstl/core'%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<title>健康優生網</title>
<link
	href="https://cdn.jsdelivr.net/npm/simple-datatables@latest/dist/style.css"
	rel="stylesheet" />
<link href="${pageContext.request.contextPath}/css/styles.css"
	rel="stylesheet" />
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/js/all.min.js"
	crossorigin="anonymous"></script>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css"
	integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l"
	crossorigin="anonymous">
</head>
<body class="sb-nav-fixed">

	
		<div id="layoutSidenav_content">
			<main>
				<div class="card mb-4">
					<div class="card-header">
						<i class="fas fa-table me-1"></i> 會員系統
						</div>
						<div class="row">
							
							<div class="col-md-6">
								<h2 style="margin: 8px 150px">刪除會員資料如下請確認</h2>
								<div class="card-body">
										<table class="table  table-hover">
										<tr>
											<td>被看護人姓名:</td>
											<td>${member.membername}</td>
										</tr>
										<tr>
											<td>性別:</td>
											<td>${member.membergender}</td>
										</tr>
										<tr>
											<td>出生日期:</td>
											<td>民國 ${member.memberyear} 年 ${member.membermonth} 月 ${member.memberday} 日</td>
										</tr>
										<tr>
											<td>E-mail:</td>
											<td>${member.memberemail}</td>
										</tr>
										<tr>
											<td>手機:</td>
											<td>${member.memberphone}</td>
										</tr>
										<tr>
											<td>被看護人居住地址:</td>
											<td>${member.membercity}${member.membertown}${member.memberaddress}</td>
										</tr>
										<tr>
											<td>身心障礙手冊/證明:</td>
											<td>${member.handbook}</td>
										</tr>
										<tr>
											<td>失智症確診:</td>
											<td>${member.dementia}</td>
										</tr>
										<tr>
											<td>大頭照:</td>
											<td><img src="${pageContext.request.contextPath}/MemberPhoto/${member.memberphoto}"
														onerror="this.style.display='none'" width="200px" height="200px" ></td>
										</tr>
										<tr>
											<td>
												<form:form method="POST" action="/Member/updateMemberAction.controller" modelAttribute="member" enctype="multipart/form-data">
													<form:hidden path="memberid" value="${member.memberid}" />
													<form:hidden path="verificationCode" value="${member.verificationCode}" />
													<form:hidden path="role" value="${member.role}" />
													<form:hidden path="disabled" value="${member.disabled}" />
													<form:hidden path="accountExpired" value="${member.accountExpired}" />
													<form:hidden path="accountLocked" value="${member.accountLocked}" />
													<form:hidden path="credentialsExpired" value="${member.credentialsExpired}" />
													<form:hidden path="membername" value="${member.membername}" />
													<form:hidden path="membergender" value="${member.membergender}" />
													<form:hidden path="memberyear" value="${member.memberyear}" />
													<form:hidden path="membermonth" value="${member.membermonth}" />
													<form:hidden path="memberday" value="${member.memberday}" />
													<form:hidden path="memberaccount" value="${member.memberaccount}" />
													<form:hidden path="memberpwd" value="${member.memberpwd}" />
													<form:hidden path="memberemail" value="${member.memberemail}" />
													<form:hidden path="memberphone" value="${member.memberphone}" />
													<form:hidden path="membercity" value="${member.membercity}" />
													<form:hidden path="membertown" value="${member.membertown}" />
													<form:hidden path="memberaddress" value="${member.memberaddress}" />
													<form:hidden path="handbook" value="${member.handbook}" />
													<form:hidden path="dementia" value="${member.dementia}" />
													<form:hidden path="memberphoto" value="${member.memberphoto}" />
													 <input type="submit" class="btn" name="updateToSQL" value="確認">
												</form:form>
											</td>
											<td>
												<form:form method="POST" action="/Member/reUpdateMember" modelAttribute="member" enctype="multipart/form-data">
													<form:hidden path="memberid" value="${member.memberid}" />
													<form:hidden path="verificationCode" value="${member.verificationCode}" />
													<form:hidden path="role" value="${member.role}" />
													<form:hidden path="disabled" value="${member.disabled}" />
													<form:hidden path="accountExpired" value="${member.accountExpired}" />
													<form:hidden path="accountLocked" value="${member.accountLocked}" />
													<form:hidden path="credentialsExpired" value="${member.credentialsExpired}" />
													<form:hidden path="membername" value="${member.membername}" />
													<form:hidden path="membergender" value="${member.membergender}" />
													<form:hidden path="memberyear" value="${member.memberyear}" />
													<form:hidden path="membermonth" value="${member.membermonth}" />
													<form:hidden path="memberday" value="${member.memberday}" />
													<form:hidden path="memberaccount" value="${member.memberaccount}" />
													<form:hidden path="memberpwd" value="${member.memberpwd}" />
													<form:hidden path="memberemail" value="${member.memberemail}" />
													<form:hidden path="memberphone" value="${member.memberphone}" />
													<form:hidden path="membercity" value="${member.membercity}" />
													<form:hidden path="membertown" value="${member.membertown}" />
													<form:hidden path="memberaddress" value="${member.memberaddress}" />
													<form:hidden path="handbook" value="${member.handbook}" />
													<form:hidden path="dementia" value="${member.dementia}" />
													<form:hidden path="memberphoto" value="${member.memberphoto}" />
													<input type="submit" class="btn" name="updateToSQL" value="返回上一頁">
												</form:form>
											</td>
										</tr>
									</table>
								</div>
								<div class="col-md-6"></div>
							</div>
						</div>
					</div>
			</main>
		</div>

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
		crossorigin="anonymous"></script>
	<script src="${pageContext.request.contextPath}/js/scripts.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js"
		crossorigin="anonymous"></script>
	<script
		src="${pageContext.request.contextPath}/assets/demo/chart-area-demo.js"></script>
	<script
		src="${pageContext.request.contextPath}/assets/demo/chart-bar-demo.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/simple-datatables@latest"
		crossorigin="anonymous"></script>
	<script
		src="${pageContext.request.contextPath}/js/datatables-simple-demo.js"></script>
</body>
</html>