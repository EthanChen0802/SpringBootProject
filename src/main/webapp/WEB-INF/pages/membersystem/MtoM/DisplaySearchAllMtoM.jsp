<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
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
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css"
	integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l"
	crossorigin="anonymous">

<!-- js for datatables-->
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<!-- js for modal-->
<script src="https://code.jquery.com/jquery-1.12.3.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
<script
	src="https://www.ksia.or.kr/plugin/DataTables-1.10.15/media/js/jquery.dataTables.js"></script>
<script
	src="https://www.ksia.or.kr/plugin/DataTables-1.10.15/media/js/dataTables.bootstrap4.js"></script>
<script
	src="https://www.ksia.or.kr/plugin/DataTables-1.10.15/extensions/Responsive/js/dataTables.responsive.js"></script>

<script
	src="https://www.ksia.or.kr/plugin/DataTables-1.10.15/extensions/Responsive/js/dataTables.responsive.js"></script>
<script
	src="https://www.ksia.or.kr/plugin/DataTables-1.10.15/extensions/Responsive/js/responsive.bootstrap4.js"></script>

<script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>

<!-- css for modal-->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://www.ksia.or.kr/plugin/DataTables-1.10.15/media/css/dataTables.bootstrap4.css">
<link rel="stylesheet"
	href="https://www.ksia.or.kr/plugin/DataTables-1.10.15/extensions/Responsive/css/responsive.bootstrap4.css">

</head>





<body class="sb-nav-fixed">

	<nav class="sb-topnav navbar navbar-expand navbar-dark bg-dark">
		<!-- Navbar Brand-->
		<a class="navbar-brand ps-3" href="/Manager/searchAllManagerAction.controller">健康優生網</a>
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
					<li><a class="dropdown-item" href="/Manager/searchAllManagerAction.controller">管理員資料表</a></li>
					<li><a class="dropdown-item" href="#!">會員資料表</a></li>
					<li><a class="dropdown-item" href="#!">廠商資料表</a></li>
					<li><hr class="dropdown-divider" /></li>
					<li><a class="dropdown-item" href="/Manager/insertManager">註冊</a></li>
					<li><a class="dropdown-item" href="/Manager/logout">登出</a></li>
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
								<a class="nav-link" href="/Manager/searchAllManagerAction.controller">管理員資料表</a>
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
								<a class="nav-link"
									href="${pageContext.request.contextPath}/equip/findall">輔具系統</a> <a
									class="nav-link"
									href="${pageContext.request.contextPath}/order/findall">輔具訂單系統</a>
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
								<a class="nav-link"  href="${pageContext.request.contextPath}/meals/mealView.controller">營養餐管理</a> 
								<a class="nav-link"  href="${pageContext.request.contextPath}/diet/dietView.controller">食品資料管理</a>									

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
								<a class="nav-link" href="${pageContext.request.contextPath}/Drug/findalldrug">藥品辨識系統</a> <a
									class="nav-link" href="${pageContext.request.contextPath}/DrugProduct/findalldrugproduct">藥品包裝變更</a>

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



				<!-- 表單總覽 -->
					<div class="card mb-4">
						<div class="card-header">
							<i class="fas fa-table me-1"></i> 管理者表單總覽
							
						</div>
						<div class="card-body">
							<table id="MtoMTable" class="table table-striped table-bordered nowrap" style="width:100%">
								<thead>
									<tr>
										<th>管理者編號</th>
										<th>管理者姓名</th>
										<th>性別</th>
										<th>民國年</th>
										<th>月</th>
										<th>日</th>
										<th>帳號</th>
										<th>E-mail</th>
										<th>手機</th>
										<th>居住縣市</th>
										<th>鄉鎮市區</th>
										<th>居住地址</th>
										<th>身心障礙手冊/證明</th>
										<th>失智症確診</th>
										<th>大頭照</th>
										<th>功能</th>
									</tr>
								</thead>
								<tbody>
									
								</tbody>
							</table>
						</div>
					</div>
					
					
					
			<!-- "修改表單"的互動視窗 Modal -->
					<div class="modal fade" tabindex="-1" role="dialog"
						id="updateMtoMShow">
						<div class="modal-dialog" role="document">
							<div class="modal-content">
								<div class="modal-header">
									<button type="button" class="close" data-dismiss="modal"
										aria-label="Close">
										<span aria-hidden="true">&times;</span>
									</button>
									<h4 class="modal-title"></h4>
								</div>
							<div class="modal-body">
								<form:form id="updateForm" modelAttribute="member" enctype="multipart/form-data">
									<table class="table  table-hover">
										<tr>
											<td><form:label path="membername">被看護人姓名:</form:label></td>
											<td>
												<form:hidden path="memberid" value="${member.memberid}" /> 
												<form:hidden path="role" value="${member.role}" /> 
												<form:hidden path="disabled" value="${member.disabled}" /> 
												<form:hidden path="accountExpired" value="${member.accountExpired}" />
												<form:hidden path="accountLocked" value="${member.accountLocked}" /> 
												<form:hidden path="credentialsExpired" value="${member.credentialsExpired}" /> 
												<form:input path="membername" size="10" placeholder="例如:王衍申" autofocus="autofocus" /> 
												<span id="nameCheck"></span>
											</td>
										</tr>
										<tr>
											<td><form:label path="membergender">性別:</form:label></td>
											<td><form:radiobutton path="membergender" value="男"
													label="男" /> <form:radiobutton path="membergender"
													value="女" label="女" /> <form:radiobutton
													path="membergender" value="其他" label="其他" /> <span
												id="genderCheck"></span></td>
										</tr>
										<tr>
											<td><form:label path="memberyear">生日日期:</form:label></td>
											<td>民國 <form:input path="memberyear" maxlength="3"
													size="3" placeholder="70" /> 年 <form:input
													path="membermonth" maxlength="2" size="2" placeholder="7" />
												月 <form:input path="memberday" maxlength="2" size="2"
													placeholder="7" /> 日 <span id="birthCheck"></span>
											</td>
										</tr>
										<tr>
											<td><form:label path="memberaccount">帳號:</form:label></td>
											<td>
												<form:input path="memberaccount" maxlength="15" size="15" />
												<span id="accountCheck"></span>
											</td>
										</tr>
										<tr>
											<td><form:label path="memberpwd">密碼:</form:label></td>
											<td>
												<form:password path="memberpwd" maxlength="15" size="15" />
												<span id="pwd1Check"></span><br>
												<input type="checkbox" id="showPwd" />顯示密碼
											</td>
										</tr>
										<tr>
											<td><form:label path="memberemail">E-mail:</form:label></td>
											<td><form:input path="memberemail" size="15"
													placeholder="aaa@gmail.com" /> <span id="emailCheck"></span>
											</td>
										</tr>
										<tr>
											<td><form:label path="memberphone">手機:</form:label></td>
											<td><form:input path="memberphone" maxlength="8"
													size="10" /> <span id="phoneCheck"></span></td>
										</tr>
										<tr>
											<td><form:label path="membercity">居住縣市:</form:label></td>
											<td><form:select path="membercity"></form:select> 
											<span id="idsp4"></span></td>
										</tr>
										<tr>
											<td><form:label path="membertown">鄉鎮市區:</form:label></td>
											<td><form:select path="membertown">
													<option value=0>請選擇</option>
												</form:select> <span id="idsp5"></span></td>
										</tr>
										<tr>
											<td><form:label path="memberaddress">居住地址:</form:label></td>
											<td><form:input path="memberaddress" /> 
											<span id="idsp6"></span></td>
										</tr>
										<tr>
											<td><form:label path="handbook">身心障礙手冊/證明:</form:label></td>
											<td><form:select path="handbook">
													<form:option value="-1" label="--請選擇--" />
													<form:options items="${handbookOption}" />
												</form:select> <span id="idsp2"></span></td>
										</tr>
										<tr>
											<td><form:label path="dementia">失智症確診:</form:label></td>
											<td>
												<form:radiobutton path="dementia" value="有" label="有" /> 
												<form:radiobutton path="dementia" value="無" label="無" />
											</td>
										</tr>
										<tr>
											<td>大頭照預覽:</td>
											<td><img id="sourceImage" width="200px" height="200px">
											</td>
										</tr>
										
										<tr>
											<td>新增大頭照</td>
											<td><input type="file" name="memberphoto" accept="image/*" id="inputImageFile" /> 
												<form:hidden path="memberphoto" /></td> 
										</tr>
									</table>
								</form:form>
								</div>
								<div class="modal-footer">
								<button type="button" class="btn btn-default" data-dismiss="modal">關閉</button>
								<button id="updateSubmit" type="button" data-dismiss="modal" class="btn btn-primary">確認修改</button>
								</div>
							</div>
						<!-- /.modal-content -->
						</div>
					<!-- /.modal-dialog -->
					</div>
				<!-- /.modal -->




					</div></main>
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
	
	
	
<script type="text/javascript">
//一鍵輸入
$('#onekey').on('click', function(){
	$('#membername').val('張美麗');
	$('#female').prop('checked',true)
	$('#memberyear').val('63');
	$('#membermonth').val('3');
	$('#memberday').val('10');
	$('#memberaccount').val('qwer1234');
	$('#memberpwd').val('asdf1234');
	$('#pwd2').val('asdf1234');
	$('#memberemail').val('iiieeit12907@gmail.com');
	$('#memberphone').val('0987651822');
	$('#memberaddress').val('大安路一段17號');
	$('#yesD').prop('checked',true)
})


    //顯示密碼
    document.getElementById("showPwd").onclick=showPwd;
        function showPwd(){
            let pwdType=document.getElementById("memberpwd").type;
            //pwdType現在是密碼的話，就轉成文字顯示
            if(pwdType === "password"){
                document.getElementById("memberpwd").type="text";
                document.getElementById("pwd2").type="text";
                //pwdType現在是文字的話，就轉回密碼來不顯示
            }else{
                document.getElementById("memberpwd").type="password";
                document.getElementById("pwd2").type="password";
            }
        }
</script>
	
	
<script type="text/javascript">
	$(document).ready(function(){
		$.getJSON('/json/taiwan_districts.json',function(data){
			var resultText='';
			resultText="<option value=0>請選擇</option>";
			for(var i=0; i<data.length; i++){
				resultText+="<option value='"+data[i].name+"'>"+data[i].name+"</option>"
			}
			
			$("#membercity").html(resultText);
		});

	$("select[name='membercity']").on('change',function(){
		$.getJSON('/json/taiwan_districts.json',function(data){	
			let CN=$("select[name='membercity']").val();		
			for(n=0; n<data.length; n++ ){
    			if(CN == data[n].name){
    				var resultText2='';
    				for(var j=0; j<data[n].districts.length; j++){
    					resultText2+="<option value='"+data[n].districts[j].name+"'>"+data[n].districts[j].name+"</option>"
    				}
    							    				
    			}
    		}	
			$("#membertown").html(resultText2);
		});		
	});
	
	});
	
	
	/* 更新圖片 or 上傳圖片 */
    $("#inputImageFile").change(function(e){
    	processImageFile(e.target.files[0]);
	});
    
    
    function processImageFile(imageObject) {
        //顯示分析的圖片
        var sourceImageUrl = URL.createObjectURL(imageObject);
        //document.querySelector("#sourceImage").src = sourceImageUrl;
        $("#sourceImage").attr('src', sourceImageUrl);
    }
	
</script>
	
	
	
	
	<script>

		var table;
		$(function () {
			createdatatable();
		});
		
		//datatable 
		function createdatatable() {
			table = $("#MtoMTable").DataTable({
				responsive: true,
				
				ajax:{
					url: "/Manager/searchAllMtoMAction.controller",
					dataSrc: ""
				},

				rowId: "memberid",
				
				columns:[					
					{data: "memberid"},
					{data: "membername"},
					{data: "membergender"},
					{data: "memberyear"},
					{data: "membermonth"},
					{data: "memberday"},
					{data: "memberaccount"},
					{data: "memberemail"},
					{data: "memberphone"},
					{data: "membercity"},
					{data: "membertown"},
					{data: "memberaddress"},
					{data: "handbook"},
					{data: "dementia"},
					{data: "memberphoto"},
					{data: "memberid"},
// 					{
//                         //這裡的data變數值為sysid，相等於row.sysid
//                         data: "formId",//資料行繫結屬性
//                         orderable: false, // 禁用排序
//                         render: function (data) { 
//                            //row指的是資料列物件 data變數相等於row.sysid
//                             return "<input type='button' onclick='editModal(" + data + ")'  value='Edit' />"
//                                 + "<input type='button' onclick='deleteModal(" + data + ")'  value='Delete' />";
//                         }
// 					}
				],
				
				
				columnDefs:[{
					targets: 15,
					orderable: false, // 禁用排序
					defaultContent: "",
					width: "10%",
					render: function (data) {
// 						return '<button id="' + data + '" onclick="editModal(this.id)"  data-dismiss="modal" class="btn btn-info btn-sm"><i class="fa fa-pencil"></i>修改</button>' 
// 						+ '<button id="' + data + '" onclick="deleteModal(this.id)"  data-dismiss="modal" class="btn btn-danger btn-sm"><i class="fa fa-trash-o"></i>刪除</button>';

						return '<input type="image" id="' + data + '" onclick="editModal(this.id)"  data-dismiss="modal" src="${pageContext.request.contextPath}/images/update.jpg">' 
						+ '<input type="image" id="' + data + '" onclick="deleteModal(this.id)"  data-dismiss="modal" src="${pageContext.request.contextPath}/images/delete.png">';
					}
				}],

// 				initComplete: function () {
// 						console.log("table created");
// 						$(".btn-info").on("click", function (e) {
// 							console.log("button clicked");
// 							console.log(e.target.id);
// 							editModal(e.target.id)});						
// 						$(".btn-danger").on("click", function (e) {
// 							console.log("button clicked2");
// 							deleteModal(e.target.id)});
// 				},
				
        responsive: {
            details: {
                display: $.fn.dataTable.Responsive.display.modal( {
                    header: function ( row ) {
                        var data = row.data();
                        return '';
                    }
                } ),
                renderer: $.fn.dataTable.Responsive.renderer.tableAll( {
                    tableClass: 'table'
                } )
            }
        },
				
	})
}
		
		
// 		// "新增"按鈕叫出 Modal
// 		$('#addTestdriveButton').click(function (e) {
// 			e.preventDefault();
// 			$('#addTestdriveModal').modal('show');
// 		})		
		
		// 1送出前總檢查 2一鍵輸入  3送出  寫在 adminTestdrive.js裡
		
		
		// "修改"按鈕抓出資料，叫出 Modal
		function editModal(memberid) {
			$('#updateForm')[0].reset();
			let fillWithOrigin = function (res) {
				$("#memberid").val(res.memberid);
				$("#membername").val(res.membername);
				$("[name=membergender]").val([res.membergender]);
				$("#memberyear").val(res.memberyear);
				$("#membermonth").val(res.membermonth);
				$("#memberday").val(res.memberday);
				$("#memberaccount").val(res.memberaccount);
				$("#memberemail").val(res.memberemail);
				$("#memberphone").val(res.memberphone);
				$("#membercity").val(res.membercity).change();
				$("#membertown").val(res.membertown).change();
				$("#memberaddress").val(res.memberaddress);
				$("#handbook").val(res.handbook).change();
				$("[name=dementia]").val([res.dementia]);
				$("#memberphoto").val(res.memberphoto);
				$('#sourceImage').attr('src',"../MemberPhoto/"+res.memberphoto);
				$("#verificationCode").val(res.verificationCode);
				$("#role").val(res.role);
				$("#disabled").val(res.disabled);
				$("#accountExpired").val(res.accountExpired);
				$("#accountLocked").val(res.accountLocked);
				$("#credentialsExpired").val(res.credentialsExpired);
			}

			findById(memberid, fillWithOrigin)
			$('#updateMtoMShow').modal('show');
			$('#updateMtoMShow').css('overflow-y', 'auto');
// 			$(".btn-info").on("click", function (e) {
// 				console.log("button clicked");
// 				console.log(e.target.id);
// 				editModal(e.target.id)});						
// 			$(".btn-danger").on("click", function (e) {
// 				console.log("button clicked2");
// 				deleteModal(e.target.id)});
		}			
				
		// 啟用"修改"按鈕前置準備，尋找單筆
		function findById(memberid, fillWithOrigin) {
			$.ajax({
				url: "/Manager/searchOneMtoMAction.controller/" + memberid,
				method: "GET",
				dataType: "json",
				success: function (res) {
					fillWithOrigin(res)
				},
				error: function (err) {
					alert(err)
				}
			});
		}		
		
		// "確認修改"按鈕，儲存資料
		$("#updateSubmit").click(
			function () {
				var updateFormData = new FormData($('#updateForm')[0]);
				$.ajax({
					url: "/Manager/updateMemberAction.controller",
					method: "POST",
					data: updateFormData,
					contentType: false,
					processData: false,
					success: function (res) {
						$("#updateForm")[0].reset();   // 修改的彈出model清空
						table.ajax.reload();     // data table刷新
					},
					error: function (err) {
						alert('更新失敗' + err);
					}
				});

			})

		
		

		// "刪除"按鈕按下後執行
		function deleteModal(memberid) {
			console.log('delete id=' + memberid);
			Swal.fire({
				title: '確定要刪除?',
				text: "刪除後，資料將不再存在",
				icon: 'warning',
				showCancelButton: true,
				confirmButtonColor: '#3085d6',
				cancelButtonColor: '#d33',
				confirmButtonText: '是',
				cancelButtonText: '否'
			}).then((torf) => {
				if (torf.isConfirmed) {
					$.ajax({
						url: "/Manager/deleteMtoMAction.controller/" + memberid,
						method: "POST",
						dataType: "json",
						success: function (res) {
							console.log('恭喜您成功刪除');
							table.ajax.reload();
						},
						error: function (err) {
							alert('刪除失敗' +err)
						}
					});
					Swal.fire(
						'刪除',
						'此筆紀錄已被刪除',
						'成功'
					)
				}
			})
		}
				

				
	</script>
	
<!-- 	<script -->
<!-- 		src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" -->
<!-- 		crossorigin="anonymous"></script> -->
	
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