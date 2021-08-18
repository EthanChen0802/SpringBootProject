<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
<link href="https://cdn.jsdelivr.net/npm/simple-datatables@latest/dist/style.css" rel="stylesheet" />
<link href="/css/styles.css" rel="stylesheet" />

<script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/js/all.min.js" crossorigin="anonymous"></script>
</head>

<body class="sb-nav-fixed">
	<nav class="sb-topnav navbar navbar-expand navbar-dark bg-dark">
		<!-- Navbar Brand-->
		<a class="navbar-brand ps-3" href="index.html">控制中心</a>
		<!-- Sidebar Toggle-->
		<button class="btn btn-link btn-sm order-1 order-lg-0 me-4 me-lg-0"
			id="sidebarToggle" href="#!">
			<i class="fas fa-bars"></i>
		</button>
		<!-- Navbar Search-->
		<form
			class="d-none d-md-inline-block form-inline ms-auto me-0 me-md-3 my-2 my-md-0">
			<div class="input-group">
				<input class="form-control" type="text" placeholder="Search for..."
					aria-label="Search for..." aria-describedby="btnNavbarSearch" />
				<button class="btn btn-primary" id="btnNavbarSearch" type="button">
					<i class="fas fa-search"></i>
				</button>
			</div>
		</form>
		<!-- Navbar-->
		<ul class="navbar-nav ms-auto ms-md-0 me-3 me-lg-4">
			<li class="nav-item dropdown"><a
				class="nav-link dropdown-toggle" id="navbarDropdown" href="#"
				role="button" data-bs-toggle="dropdown" aria-expanded="false"><i
					class="fas fa-user fa-fw"></i></a>
				<ul class="dropdown-menu dropdown-menu-end"
					aria-labelledby="navbarDropdown">
					<li><a class="dropdown-item" href="#!">Settings</a></li>
					<li><a class="dropdown-item" href="#!">Activity Log</a></li>
					<li><hr class="dropdown-divider" /></li>
					<li><a class="dropdown-item" href="/logout">登出</a></li>
				</ul></li>
		</ul>
	</nav>
	<div id="layoutSidenav">
		<div id="layoutSidenav_nav">
			<nav class="sb-sidenav accordion sb-sidenav-dark"
				id="sidenavAccordion">
				<div class="sb-sidenav-menu">
					<div class="nav">
						<div class="sb-sidenav-menu-heading">會員中心</div>
						<a class="nav-link" href="/HealthProject/ManagerHealth/searchAllManagerAction.controller">
							<div class="sb-nav-link-icon">
								<i class="fas fa-table"></i>
							</div> 會員系統
						</a>
						<div class="sb-sidenav-menu-heading">長照服務</div>
						<a class="nav-link collapsed" href="#" data-bs-toggle="collapse"
							data-bs-target="#collapseLayouts1" aria-expanded="false"
							aria-controls="collapseLayouts1">
							<div class="sb-nav-link-icon">
								<i class="fas fa-chart-area"></i>
							</div> 叫車系統
							<div class="sb-sidenav-collapse-arrow">
								<i class="fas fa-angle-down"></i>
							</div>
						</a>
						<div class="collapse" id="collapseLayouts1"
							aria-labelledby="headingOne" data-bs-parent="#sidenavAccordion">
							<nav class="sb-sidenav-menu-nested nav">
								<a class="nav-link" href="${pageContext.request.contextPath}/taxi/taximainpage.controller">計程車資訊</a> 
								<a class="nav-link" href="${pageContext.request.contextPath}/taxi/locmainpage.controller">店家資訊</a>
							</nav>
						</div>
						<a class="nav-link collapsed" href="#" data-bs-toggle="collapse"
							data-bs-target="#collapseLayouts" aria-expanded="false"
							aria-controls="collapseLayouts">
							<div class="sb-nav-link-icon">
								<i class="fas fa-columns"></i>
							</div> 長照系統
							<div class="sb-sidenav-collapse-arrow">
								<i class="fas fa-angle-down"></i>
							</div>
						</a>
						<div class="collapse" id="collapseLayouts"
							aria-labelledby="headingOne" data-bs-parent="#sidenavAccordion">
							<nav class="sb-sidenav-menu-nested nav">
								<a class="nav-link" href="${pageContext.request.contextPath}/equip/findall">輔具系統</a>
								<a class="nav-link" href="${pageContext.request.contextPath}/order/findall">輔具訂單系統</a>
							</nav>
						</div>



						<div class="sb-sidenav-menu-heading">營養與藥品管理</div>
						<a class="nav-link collapsed" href="#" data-bs-toggle="collapse"
							data-bs-target="#collapseLayouts3" aria-expanded="false"
							aria-controls="collapseLayouts3">
							<div class="sb-nav-link-icon">
								<i class="fas fa-tachometer-alt"></i>
							</div> 營養管理系統
							<div class="sb-sidenav-collapse-arrow">
								<i class="fas fa-angle-down"></i>
							</div>
						</a>
						<div class="collapse" id="collapseLayouts3"
							aria-labelledby="headingOne" data-bs-parent="#sidenavAccordion">
							<nav class="sb-sidenav-menu-nested nav">
								<a class="nav-link" href="${pageContext.request.contextPath}/meals/mealView.controller">營養餐管理</a> <a
									class="nav-link" href="${pageContext.request.contextPath}/diet/dietView.controller">食品資料管理</a>

							</nav>
						</div>
						<a class="nav-link collapsed" href="#" data-bs-toggle="collapse"
							data-bs-target="#collapseLayouts4" aria-expanded="false"
							aria-controls="collapseLayouts4">
							<div class="sb-nav-link-icon">
								<i class="fas fa-book-open"></i>
							</div> 用藥查詢系統
							<div class="sb-sidenav-collapse-arrow">
								<i class="fas fa-angle-down"></i>
							</div>
						</a>
						<div class="collapse" id="collapseLayouts4"
							aria-labelledby="headingOne" data-bs-parent="#sidenavAccordion">
							<nav class="sb-sidenav-menu-nested nav">
								<a class="nav-link" href="${pageContext.request.contextPath}/Drug/findalldrug">藥品辨識系統</a> 
								<a class="nav-link" href="${pageContext.request.contextPath}/DrugProduct/findalldrugproduct">藥品包裝變更</a>
							</nav>
						</div>

					</div>
				</div>
				<div class="sb-sidenav-footer">
					<div class="small">Logged in as:</div>
					Start Bootstrap
				</div>
			</nav>
		</div>
		<div id="layoutSidenav_content">
			<main>
				<div class="container-fluid px-4">
					<h1 class="mt-4">輔具管理系統</h1>


					<div class="card mb-4">
						<div class="card-header">
							<i class="fas fa-table me-1"></i> 輔具資料
						</div>
						<div class="card-body">
							
							<div>
								<input type="button" value="新增一筆資料" onclick="window.location.href='showFormForAdd'" />
							</div>
							<br/>


							<table id="datatablesSimple">
								<thead>
									<tr>
										<th>輔具照片</th>
										<th>輔具名稱</th>
										<th>輔具類型</th>
										<th>販賣商</th>
										<th>價格</th>
										<th>衛生署字號</th>
										<th>更新</th>
										<th>刪除</th>
									</tr>
								</thead>


								<tbody>
									<c:forEach var="equip" items="${list}">

							
										<tr>
											<td><img src="${pageContext.request.contextPath}/EquipImg/${equip.photo}"
												onerror="this.style.display='none'" width="120px"
												height="120px" /></td>
											<td>${equip.name}</td>
											<td>${equip.type}</td>
											<td>${equip.vendor}</td>
											<td>${equip.price}</td>
											<td>${equip.document}</td>
											<td>
												<form action="showUpdate" method="post">
													<input type="hidden" name="eId" value="${equip.id}" /> 
													<input type="image" src="/images/update.png" />
												</form>
											</td>
											<td>
											<!-- 
												<form action="#" method="post">
													<input type="hidden" name="eId" value="${equip.id}"/> 
													<input type="image" src="/images/delete.png" id="${equip.id}" class="delete" />
												</form> -->
													<input type="image" src="/images/delete.png" id="${equip.id}" class="delete">
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
	</div>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
	<script src="/js/scripts.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js" crossorigin="anonymous"></script>
	<script src="assets/demo/chart-area-demo.js"></script>
	<script src="assets/demo/chart-bar-demo.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/simple-datatables@latest" crossorigin="anonymous"></script>
	<script src="/js/datatables-simple-demo.js"></script>
	<script src="/js/jquery-3.6.0.js"></script>
	
	<!--  sweet alert -->
	<script src="/js/sweetalert2.all.min.js"></script>
	
	<script>

		$(".delete").each(function(){
			
			/*
				console.log(this);
				console.log($(this).attr("id"));
			*/		
			
			var id = $(this).attr("id")
			/* console.log(id);*/
				
			$(document).on('click', "#"+ id, function() { 


				Swal.fire({
					  title: '確定刪除?',
					  text: "資料無法復原!",
					  icon: 'warning',
					  showCancelButton: true,
					  confirmButtonColor: '#3085d6',
					  cancelButtonColor: '#d33',
					  confirmButtonText: '刪除!',
					  cancelButtonText: '取消'
					}).then((result) => {
					  if (result.isConfirmed) {
						  
						$.ajax({
							  url: "/equip/delete",
							  type: "post",
							  data:  {
								  "eId" : id
							  },
						  	  success: function(data){
						  		 
						  		console.log(data);  
						  		 
						  		/*
						  		$("#"+ id).closest("tr").remove();
						  		
						  		
						  		$("#datatablesSimple").DataTable().ajax.reload();
						  		
						  		*/

						  		Swal.fire({
						  		  position: 'top',
						  		  icon: 'success',
						  		  title: '資料已刪除',
						  		  showConfirmButton: false,
						  		  timer: 1500
						  		})
								    
								setTimeout(function (){
									window.location.href ="/equip/findall"
								}, 1400);
						  		
						  	
							 }

						  })       
						   
					  }
				 })

			})
	
		})	
	</script>
</body>
</html>
