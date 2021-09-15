<%@ page language="java" contentType="text/html; charset=UTF-8" 
         pageEncoding="UTF-8" import="java.util.*,tw.iiihealth.membersystem.manager.model.*"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
	<nav class="sb-topnav navbar navbar-expand navbar-dark bg-dark">
	<!-- Navbar Brand--> <a class="navbar-brand ps-3 disabled" href="#">健康優生網</a>
	<!-- Sidebar Toggle-->
	<button class="btn btn-link btn-sm order-1 order-lg-0 me-4 me-lg-0"
		id="sidebarToggle" href="#!">
		<i class="fas fa-bars"></i>
	</button>
	<!-- Navbar Search-->
		<form
			class="d-none d-md-inline-block form-inline ms-auto me-0 me-md-3 my-2 my-md-0">

				<a class="navbar-brand ps-3" href="#">歡迎您，${user.managername}</a>
		</form>
		<!-- Navbar-->
		<ul class="navbar-nav ms-auto ms-md-0 me-3 me-lg-4">
			<li class="nav-item dropdown"><a
				class="nav-link dropdown-toggle" id="navbarDropdown" href="#"
				role="button" data-bs-toggle="dropdown" aria-expanded="false"><i
					class="fas fa-user fa-fw"></i></a>
				<ul class="dropdown-menu dropdown-menu-end"
					aria-labelledby="navbarDropdown">
<!-- 					<li><a class="dropdown-item" href="/Manager/searchAllManagerAction">管理員資料表</a></li> -->
<!-- 					<li><a class="dropdown-item" href="/Manager/searchAllMtoM">會員資料表</a></li> -->
<!-- 					<li><hr class="dropdown-divider" /></li> -->
					<li><a class="dropdown-item" id="gotoInsert" style="font-size:20px" href="/Manager/insertManager">註冊</a></li>
					<li><a class="dropdown-item" style="font-size:20px" href="/iiiHealth/logout">登出</a></li>
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
						<a class="nav-link collapsed" href="#" data-bs-toggle="collapse"
							data-bs-target="#collapseLayouts0" aria-expanded="false"
							aria-controls="collapseLayouts0">
							<div class="sb-nav-link-icon">
								<i class="fas fa-chart-area"></i>
							</div> 會員系統
							<div class="sb-sidenav-collapse-arrow">
								<i class="fas fa-angle-down"></i>
							</div>
						</a>
						<div class="collapse" id="collapseLayouts0"
							aria-labelledby="headingOne" data-bs-parent="#sidenavAccordion">
							<nav class="sb-sidenav-menu-nested nav">
								<a class="nav-link" href="/Manager/searchAllManagerAction">管理員資料表</a>
								<a class="nav-link" href="/Manager/searchAllMtoM">會員資料表</a>
							</nav>
						</div>
						
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
						<nav class="sb-sidenav-menu-nested nav"> <a class="nav-link"
							href="${pageContext.request.contextPath}/meals/mealView.controller">營養餐管理</a> <a class="nav-link"
							href="${pageContext.request.contextPath}/diet/dietView.controller">食品資料管理</a> </nav>
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
						<nav class="sb-sidenav-menu-nested nav"> <a class="nav-link"
							href="${pageContext.request.contextPath}/Drug/findalldrug">藥品辨識系統</a> <a class="nav-link" href="${pageContext.request.contextPath}/DrugProduct/findalldrugproduct">藥品包裝變更</a>

						</nav>
					</div>
 <div class="sb-sidenav-menu-heading">線上客服</div>
                         
                            <a class="nav-link" href="${pageContext.request.contextPath}/chat">
                                <div class="sb-nav-link-icon"><i class="fas fa-table"></i></div>
                                聊天室
                            </a>
                        </div>
			</div>
			
			</nav>
		</div>

