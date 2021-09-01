<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"
	import="java.util.*"%>
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
							<i class="fas fa-table me-1"></i> 刪除員工資料如下請確認
						</div>
						<div class="card-body">

							<div class="row">
								<div class="col-md-3"></div>
								<div class="col-md-6">
									<table class="table  table-hover">
										<tr>
											<td>管理者編號:</td>
											<td>${manager.managerid}</td>
										</tr>
										<tr>
											<td>管理者姓名:</td>
											<td>${manager.managername}</td>
										</tr>
										<tr>
											<td>性別:</td>
											<td>${manager.managergender}</td>
										</tr>
										<tr>
											<td>帳號:</td>
											<td>${manager.manageraccount}</td>
										</tr>
										<tr>
											<td>權限:</td>
											<td>${manager.role}</td>
										</tr>
										<tr>
											<td>出生日期:</td>
											<td>民國 ${manager.manageryear} 年 ${manager.managermonth} 月 ${manager.managerday} 日</td>
										</tr>
										<tr>
											<td>E-mail:</td>
											<td>${manager.manageremail}</td>
										</tr>
										<tr>
											<td>
												<form action="/Manager/deleteManagerAction.controller" method="post">
													<input type="hidden" name="managerid" value="${manager.managerid}">
													<input type="submit" class="btn" name="insertToSQL" value="確認">
												</form>
											</td>
											<td>
												<form action="/Manager/searchAllManagerAction.controller" method="post">
													<input type="submit" class="btn" value="取消">
												</form>
											</td>
										</tr>
									</table>
								</div>
								<div class="col-md-3"></div>
							</div>

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
	</div>

	
</body>
</html>