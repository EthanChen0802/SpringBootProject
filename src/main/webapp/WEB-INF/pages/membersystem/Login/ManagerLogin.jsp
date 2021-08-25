<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"
	import="java.util.*"%>
<%@ taglib prefix='c' uri='http://java.sun.com/jsp/jstl/core'%>
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
</head>
<body class="sb-nav-fixed">

	<nav class="sb-topnav navbar navbar-expand navbar-dark bg-dark">
		<!-- Navbar Brand-->
		<a class="navbar-brand ps-3" href="#">控制中心</a>
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
					<li><a class="dropdown-item" href="#">管理員資料表</a></li>
					<li><a class="dropdown-item" href="#!">會員資料表</a></li>
					<li><a class="dropdown-item" href="#!">廠商資料表</a></li>
					<li><hr class="dropdown-divider" /></li>
					<li><a class="dropdown-item" href="/Manager/login">登入</a></li>
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
								<a class="nav-link" href="#">管理員資料表</a>
								<a class="nav-link" href="#">會員資料表</a>
								<a class="nav-link" href="#">廠商資料表</a>
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
								<a class="nav-link" href="#">計程車資訊</a>
								<a class="nav-link" href="#">店家資訊</a>
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
								<a class="nav-link"
									href="#">輔具系統</a> <a
									class="nav-link"
									href="#">輔具訂單系統</a>
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
								<a class="nav-link" href="#">營養餐管理</a> <a
									class="nav-link" href="#">食品資料管理</a>

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
								<a class="nav-link" href="#">藥品辨識系統</a> <a
									class="nav-link" href="#">藥品包裝變更</a>

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
					<h1 class="mt-4">會員系統</h1>
					<ol class="breadcrumb mb-4">
						<li class="breadcrumb-item active">管理者介面</li>
					</ol>

					<div class="card mb-4">
						<div class="card-header">
							<i class="fas fa-table me-1"></i> 管理者登入
						</div>
						<div class="card-body">

							<div class="row">
								<div class="col-md-6">
									<form action="/Manager/login" method="post" id="form1" onsubmit="return checkSubBtn();">
										<table class="table  table-hover">
											<tr>
												<td>帳號:</td>
												<td><input type="text" id="account1" name="username"
													size="15" autocomplete="off"><span id="acntCheck"></span></td>
											</tr>
											<tr>
												<td>密碼:</td>
												<td><input type="password" id="pwd1" name="password" maxlength="15" size="15"> 
												<span id="pwd1Check"></span><br>
												<input type="checkbox" id="showPwd">顯示密碼     
<!-- 												<input type="checkbox" name="remember-me">記住我</td> -->
											</tr>
											<tr>
												<td><span style="color: red;" id="subBtnCheck"></span></td>
											</tr>
											<tr>
												<td>
													<input type="submit" class="btn" id="subBtn" value="登陸">
												</td>
											</tr>	
										</table>
									</form>
								</div>
								<div class="col-md-6"></div>
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


	<script>
    let acntCheck = document.getElementById("acntCheck");
    let pwd1Check = document.getElementById("pwd1Check");
    document.getElementById("subBtn").onclick = checkSubBtn;

    let flagSubmit1 = true;
    let flagSubmit2 = true;
    //account1
    function checkAccount() {
        flagSubmit1 = true;
        let acntObj = document.getElementById("account1");
        let acntValue = acntObj.value;
        let acntLen = acntValue.length;
        let flag1 = false, flag2 = false;

        if (acntLen == "") {
            acntCheck.innerHTML = "<img src ='${pageContext.request.contextPath}/images/incorrect.jpg'>帳號不能為空";
            flagSubmit1 = false;
        } else if (acntLen >= 6) {
            for (let i = 0; i <= acntLen; i++) {
                let ch = acntValue.charAt(i).toUpperCase();
                if (ch >= "A" && ch <= "Z") {
                    flag1 = true;
                } else if (ch >= "0" && ch <= "9") {
                    flag2 = true;
                }
                if (flag1 && flag2) {
                    break;
                }
            } if (flag1 && flag2) {
                acntCheck.innerHTML = "<img src ='${pageContext.request.contextPath}/images/correct.jpg'>";
            } else {
                acntCheck.innerHTML = "<img src ='${pageContext.request.contextPath}/images/incorrect.jpg'>帳號必須包含英文與數字";
                flagSubmit1 = false;
            }
        } else if (acntLen < 6 && acntLen > 0) {
            acntCheck.innerHTML = "<img src ='${pageContext.request.contextPath}/images/incorrect.jpg'>帳號字數過少";
            flagSubmit1 = false;
        }
    }

    //pwd1
    function checkPwd1() {
        flagSubmit2 = true
        let pwd1Obj = document.getElementById("pwd1");
        let pwd1Value = pwd1Obj.value;
        let pwd1Len = pwd1Value.length;
        let flag1 = false, flag2 = false;

        if (pwd1Len == "") {
            pwd1Check.innerHTML = "<img src ='${pageContext.request.contextPath}/images/incorrect.jpg'>密碼不能為空";
            flagSubmit2 = false;
        } else if (pwd1Len >= 6) {
            for (let i = 0; i <= pwd1Len; i++) {
                let ch = pwd1Value.charAt(i).toUpperCase();
                if (ch >= "A" && ch <= "Z") {
                    flag1 = true;
                } else if (ch >= "0" && ch <= "9") {
                    flag2 = true;
                }
                if (flag1 && flag2) {
                    break;
                }
            } if (flag1 && flag2) {
                pwd1Check.innerHTML = "<img src ='${pageContext.request.contextPath}/images/correct.jpg'>";
            } else {
                pwd1Check.innerHTML = "<img src ='${pageContext.request.contextPath}/images/incorrect.jpg'>密碼必須包含英文與數字";
                flagSubmit2 = false;
            }
        } else if (pwd1Len < 6 && pwd1Len > 0) {
            pwd1Check.innerHTML = "<img src ='${pageContext.request.contextPath}/images/incorrect.jpg'>密碼字數過少";
            flagSubmit2 = false;
        }
    }

    //顯示密碼
    document.getElementById("showPwd").onclick = showPwd;
    function showPwd() {
        let pwdType = document.getElementById("pwd1").type;
        //pwdType現在是密碼的話，就轉成文字顯示
        if (pwdType === "password") {
            document.getElementById("pwd1").type = "text";
            //pwdType現在是文字的話，就轉回密碼來不顯示
        } else {
            document.getElementById("pwd1").type = "password";
        }
    }

    //checkSubBtn
    function checkSubBtn() {
        checkAccount();
        checkPwd1();

        if (flagSubmit1 == false || flagSubmit2 == false) {
            subBtnCheck.innerHTML = "**資料不完整，請重新檢查**";
            return false;
        } else {
            return true;
        }

    }
    </script>


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