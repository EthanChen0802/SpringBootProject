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
										<th>訂單編號</th>
										<th>訂購人姓名</th>
										<th>訂購人電話</th>
										<th>訂購人信箱</th>
										<th>訂購人地址</th>
										<th>出貨狀態</th>
										<th>訂購品項</th>
									</tr>
								</thead>
								<tbody>

									<c:forEach var="order" items="${list}">

										<tr>
											<td>${order.id}</td>
											<td>${order.name}</td>
											<td>${order.number}</td>
											<td>${order.email}</td>
											<td>${order.address}</td>
											
										
											<td> 
											<c:choose>
												<c:when test="${order.status =='尚未出貨'}">
													<select name="status" id="${order.id}" class="switch">
														<option value="尚未出貨" selected>尚未出貨</option >
														<option value="已經出貨">已經出貨</option>
													</select>
												</c:when>
											
												<c:when test="${order.status =='已經出貨'}">
													<select disabled>
														<option >尚未出貨</option>
														<option selected>已經出貨</option>
													</select>
												</c:when>
											</c:choose>
											
											
											
											</td>
											<td>
												<form action="orderdetail" method="post">
													<input type="hidden" name="oId" value="${order.id}"/> 
													<input type="image" src="/images/detail.png" />
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
	
<script src="/js/jquery-3.6.0.js"></script>
	
<script>
	$(".switch").each(function(){
		
		/*
			console.log(this);
			console.log($(this).attr("id"));
		*/		
		
		var id = $(this).attr("id")
		/* console.log(id); */
		
		$(document).on('change', "#"+ id, function() { 
				
			Swal.fire({
				  position: 'top',
				  icon: 'success',
				  title: '出貨狀態已更新',
				  showConfirmButton: false,
				  timer: 1500
				})
			
			$("#"+ id).attr("disabled", true);
			
			

			$.ajax({
				  url: "/order/changestatus",
				  type: "post",
				  data:  { "oId" : id },
			  	  success: function(data){
			  		console.log(data);  	
			  	  }
			})
		
	})	
				
})
</script>
	
</body>
</html>
