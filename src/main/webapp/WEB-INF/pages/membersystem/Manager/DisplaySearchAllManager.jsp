<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix='c' uri='http://java.sun.com/jsp/jstl/core'%>
<%@ include file="/WEB-INF/pages/css.jsp"%>
<%@ include file="/WEB-INF/pages/left-top-bar.jsp"%>
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

	
</head>
<body class="sb-nav-fixed">
	
		<div id="layoutSidenav_content">
			<main>
				<div class="container-fluid px-4">
					<h1 class="mt-4">會員系統</h1>
					<ol class="breadcrumb mb-4">
						<li class="breadcrumb-item active">管理者介面</li>
					</ol>

					<div class="card mb-4">
						<div class="card-header">
							<i class="fas fa-table me-1"></i> 管理員資料表
						</div>
						<div class="card-body">
							<table id="datatablesSimple">
								<thead>
									<tr>
										<th>管理者編號</th>
										<th>管理者姓名</th>
										<th>性別</th>
										<th>帳號</th>
										<th>權限</th>
										<th>出生日期</th>
										<th>E-mail</th>
										<th colspan="2"></th>
									</tr>
								</thead>
								<tfoot>
									<tr>
										<th>管理者編號</th>
										<th>管理者姓名</th>
										<th>性別</th>
										<th>帳號</th>
										<th>權限</th>
										<th>出生日期</th>
										<th>E-mail</th>
										<th colspan="2"></th>
									</tr>
								</tfoot>
								<tbody>
									<c:forEach var="manager" varStatus="status" items="${allManager}">
										<tr>
											<td>${manager.managerid}</td>
											<td>${manager.managername}</td>
											<td>${manager.managergender}</td>
											<td>${manager.manageraccount}</td>
											<td>${manager.role}</td>
											<td>民國 ${manager.manageryear} 年 ${manager.managermonth} 月 ${manager.managerday} 日</td>
											<td>${manager.manageremail}</td>
											<td>
												<form method="POST" action="/Manager/updateManager">
													<input type="hidden" name="managerid" value="${manager.managerid}" />
													<input type="image" src="${pageContext.request.contextPath}/images/update.jpg">
												</form>
											</td>
											<td>
												<form method="POST" action="/Manager/displayDeleteManager">
													<input type="hidden" name="managerid" value="${manager.managerid}" />
													<input type="image" src="${pageContext.request.contextPath}/images/delete.png">
												</form>
											</td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
						</div>
					</div>
				</div>
			</main>
			<footer class="py-4 bg-light mt-auto">
				<div class="container-fluid px-4">
					<div
						class="d-flex align-items-center justify-content-between small">
						<div class="text-muted">Copyright &copy; Your Website 2021</div>
						<div>
							<a href="#">Privacy Policy</a> &middot; <a href="#">Terms
								&amp; Conditions</a>
						</div>
					</div>
				</div>
			</footer>
		</div>

</body>
</html>