<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
<%@ include file="/WEB-INF/pages/css.jsp"%>

</head>

<body class="sb-nav-fixed">

<%@ include file="/WEB-INF/pages/left-top-bar.jsp"%>

		<div id="layoutSidenav_content">
			<main>
				<div class="container-fluid px-4">
					<h1 class="mt-4">訂單管理系統</h1>


					<div class="card mb-4">
						<div class="card-header">
							<i class="fas fa-table me-1"></i> 訂單資料
						</div>
						<div class="card-body">

							<br />

							<table id="datatablesSimple">
								
								<thead>
									<tr>
										<th>訂購人姓名</th>
										<th>訂購人電話</th>
										<th>訂購人信箱</th>
										<th>訂購人地址</th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<td>${order.name}</td>
										<td>${order.number}</td>
										<td>${order.email}</td>
										<td>${order.address}</td>
									</tr>
								</tbody>
								
								<thead>
									<tr>
										<th>訂購產品</th>
										<th>訂購價格</th>
										<th>訂購數量</th>
										<th>總價小計</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach var="detail" items="${order.orderDetail}">

										<tr>
											<td>${detail.product}</td>
											<td>${detail.price}</td>
											<td>${detail.quantity}</td>
											<td class=single>${detail.total}</td>
										</tr>
									</c:forEach>
									
										<tr>
											<td></td>
											<td></td>
											<td></td>
											<td id=all></td>
										</tr>
								</tbody>
							</table>
							
							<p>
								<a href="${pageContext.request.contextPath}/order/findall">返回主頁</a>
							</p>
							
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
	
<script src="/js/jquery-3.6.0.js"></script>
	
	
<script>
	$(document).ready(function() {

		
		var result = 0;
		$(".single").each(function(){
			/* alert($(this).html()); */
			result += parseInt($(this).html())
			
		});	
			
		$("#all").text(result).attr("style", "color:red");
		
	})
	
</script>
	
</body>
</html>
