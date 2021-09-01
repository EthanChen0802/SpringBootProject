<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>

<html>
<head>
<meta charset="utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<title>健康優生網</title>

<script src="../js/jquery-3.6.0.js"></script>

<%@ include file="/WEB-INF/pages/user-css-js.jsp"%>
</head>

<body data-spy="scroll" data-target=".site-navbar-target"
	data-offset="300">

	<%@ include file="/WEB-INF/pages/user-header.jsp"%>



	<!-- 老人圖 -->

	<div class="slide-item overlay"
		style="background-image: url('${pageContext.request.contextPath}/images/slider-1.jpg')">
		<div class="container">
			<div class="row">
				<div class="col-lg-6 align-self-center">
					<h1 class="heading mb-3">健康悠生伴你一生</h1>
					<p class="lead text-white mb-5">健康一生 悠活一生</p>
					<p>
						<a href="about.html" class="btn btn-primary">關於我們</a>
					</p>
				</div>
			</div>
		</div>
	</div>



	<!-- 表單 -->

	<div id="layoutSidenav_content">
		<main>
			<div class="card mb-4">
				<div class="card-header">
					<i class="fas fa-table me-1"></i> 會員系統
				</div>
				<div class="row">

					<div class="col-md-6">
						<h2 style="margin: 8px 150px">會員註冊</h2>
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
									<td>民國 ${member.memberyear} 年 ${member.membermonth} 月
										${member.memberday} 日</td>
								</tr>
								<tr>
									<td>帳號:</td>
									<td>${member.memberaccount}</td>
								</tr>
								<tr>
									<td>使用者權限:</td>
									<td>${member.role}</td>
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
									<td><img
										src="${pageContext.request.contextPath}/MemberPhoto/${member.memberphoto}"
										onerror="this.style.display='none'" width="200px"
										height="200px"></td>
								</tr>
								<tr>
									<td><a href="/Member/updateMember">修改個人資料</a></td>
									<td><a href="/Member/updateMemberAP">修改密碼</a></td>
								</tr>
							</table>
						</div>
						<div class="col-md-6"></div>
					</div>
				</div>
			</div>
		</main>
	</div>


	<%@ include file="/WEB-INF/pages/user-site-footer.jsp"%>
	<%@ include file="/WEB-INF/pages/user-js.jsp"%>
</body>
</html>