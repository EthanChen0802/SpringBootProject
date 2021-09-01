<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
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
							<i class="fas fa-table me-1"></i> 新增員工資料如下請確認
						</div>
						<div class="card-body">

							<div class="row">
								<div class="col-md-3"></div>
								<div class="col-md-6">
									<table class="table  table-hover">
										<tr>
											<td>管理者姓名:</td>
											<td>${manager.managername}</td>
										</tr>
										<tr>
											<td>性別:</td>
											<td>${manager.managergender}</td>
										</tr>
										<tr>
											<td>出生日期:</td>
											<td>民國 ${manager.manageryear} 年 ${manager.managermonth} 月 ${manager.managerday} 日</td>
										</tr>
										<tr>
											<td>帳號:</td>
											<td>${manager.manageraccount}</td>
										</tr>
										<tr>
											<td>密碼:</td>
											<td>${manager.managerpwd}</td>
										</tr>
										<tr>
											<td>E-mail:</td>
											<td>${manager.manageremail}</td>
										</tr>
										<tr>
											<td>
												<form:form method="POST" action="/Manager/insertManagerAction.controller" modelAttribute="manager">
													<form:hidden path="managername" value="${manager.managername}" />
													<form:hidden path="managergender" value="${manager.managergender}" />
													<form:hidden path="manageryear" value="${manager.manageryear}" />
													<form:hidden path="managermonth" value="${manager.managermonth}" />
													<form:hidden path="managerday" value="${manager.managerday}" />
													<form:hidden path="manageraccount" value="${manager.manageraccount}" />
													<form:hidden path="managerpwd" value="${manager.managerpwd}" />
													<form:hidden path="manageremail" value="${manager.manageremail}" />
													<input type="submit" class="btn" value="確認">
												</form:form>
											</td>
											<td>
												<form:form method="POST" action="/Manager/reInsertManager" modelAttribute="manager">
													<form:hidden path="managername" value="${manager.managername}" />
													<form:hidden path="managergender" value="${manager.managergender}" />
													<form:hidden path="manageryear" value="${manager.manageryear}" />
													<form:hidden path="managermonth" value="${manager.managermonth}" />
													<form:hidden path="managerday" value="${manager.managerday}" />
													<form:hidden path="manageraccount" value="${manager.manageraccount}" />
													<form:hidden path="managerpwd" value="${manager.managerpwd}" />
													<form:hidden path="manageremail" value="${manager.manageremail}" />
													<input type="submit" class="btn" value="返回上一頁">
												</form:form>
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