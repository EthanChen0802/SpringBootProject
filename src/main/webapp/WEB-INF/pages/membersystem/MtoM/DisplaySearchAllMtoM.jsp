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


<style>
a.disabled {
 	pointer-events: none;
 	cursor: default;
 } 
</style>

<link href="/css/styles.css" rel="stylesheet" />
<script	src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/js/all.min.js" crossorigin="anonymous"></script>
<script src="/js/scripts.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/simple-datatables@latest" crossorigin="anonymous"></script>
<script src="/js/datatables-simple-demo.js"></script>


<!-- js for datatables -->
<script src="https://code.jquery.com/jquery-3.5.1.js"></script>
<script
	src="https://cdn.datatables.net/1.11.0/js/jquery.dataTables.min.js"></script>
<script
	src="https://cdn.datatables.net/1.11.0/js/dataTables.bootstrap5.min.js"></script>
	
<!-- js for modal -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/5.0.1/js/bootstrap.bundle.min.js"></script> 
<script
	src="https://cdn.datatables.net/responsive/2.2.9/js/dataTables.responsive.min.js"></script>
<script
	src="https://cdn.datatables.net/responsive/2.2.9/js/responsive.bootstrap5.min.js"></script>


<!-- css for sweet alert2  -->
<script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>




<!-- css for datatables  -->
		<link rel="stylesheet"
			href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/5.0.1/css/bootstrap.min.css">
		<link rel="stylesheet"
			href="https://cdn.datatables.net/1.11.0/css/dataTables.bootstrap5.min.css">
			
			
<!-- css for modal -->			
		<link rel="stylesheet"
			href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/5.0.1/css/bootstrap.min.css">
		<link rel="stylesheet"
			href="https://cdn.datatables.net/1.11.0/css/dataTables.bootstrap5.min.css">
		<link rel="stylesheet"
			href="https://cdn.datatables.net/responsive/2.2.9/css/responsive.bootstrap5.min.css">

</head>





<body class="sb-nav-fixed">



<%@ include file="/WEB-INF/pages/left-top-bar.jsp"%>
		
		
		
		
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
							<i class="fas fa-table me-1"></i> 會員資料表
							
						</div>
						<div class="card-body">
							<table id="MtoMTable" class="table table-striped table-bordered nowrap" style="width:100%">
								<thead>
									<tr>
										<th>會員編號</th>
										<th>會員姓名</th>
										<th>權限</th>
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
									<h4 class="modal-title">修改會員資料</h4>
									<button type="button" class="btn-close" data-bs-dismiss="modal"
										aria-label="Close">
									</button>
								</div>
							<div class="modal-body">
								<form:form id="updateForm" modelAttribute="member" enctype="multipart/form-data">
									<table class="table  table-hover">
										<tr>
											<td><form:label path="membername">被看護人姓名:</form:label></td>
											<td>
												<form:hidden path="memberid" value="${member.memberid}" /> 
												<form:hidden path="memberaccount" value="${member.memberaccount}" />
												<form:hidden path="memberemail" value="${member.memberemail}" />
												<form:hidden path="role" value="${member.role}" /> 
												<form:hidden path="disabled" value="${member.disabled}" /> 
												<form:hidden path="verificationCode" value="${member.verificationCode}" />
												<form:hidden path="accountExpired" value="${member.accountExpired}" />
												<form:hidden path="accountLocked" value="${member.accountLocked}" /> 
												<form:hidden path="credentialsExpired" value="${member.credentialsExpired}" /> 
												<form:input path="membername" size="10" placeholder="例如:王衍申" autofocus="autofocus" /> 
												<span id="nameCheck"></span>
											</td>
										</tr>
										<tr>
											<td><form:label path="membergender">性別:</form:label></td>
											<td><form:radiobutton path="membergender" value="男" label="男" /> 
											<form:radiobutton path="membergender" value="女" label="女" /> 
											<form:radiobutton id="other" path="membergender" value="其他" label="其他" /> 
											<span id="genderCheck"></span></td>
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
											<td>帳號:</td>
											<td id="accountdisplay"></td>
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
											<td>E-mail:</td>
											<td id="emaildisplay"></td>
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
								<button type="button" class="btn btn-default" data-bs-dismiss="modal">關閉</button>
								<button id="updateSubmit" type="button" data-bs-dismiss="modal" class="btn btn-primary">確認修改</button>
								<button id="onekey" type="button" class="btn btn-primary">一鍵輸入</button>
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
	$('#other').prop('checked',true)
	$('#memberyear').val('48');
	$('#membermonth').val('11');
	$('#memberday').val('12');
	$('#memberpwd').val('asdf1234');
	$('#pwd2').val('asdf1234');
	$('#memberphone').val('0987651822');
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
					{data: "role"},
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
					targets : 15,
					orderable: false, // 禁用排序
					defaultContent: "",
					render : function (data) {
					return "<img width='200px' height='200px' src = ../MemberPhoto/"+data+" >";
					}
				},
					
					{
					targets: 16,
					orderable: false, // 禁用排序
					defaultContent: "",
					render: function (data) {
// 						return '<button id="' + data + '" onclick="editModal(this.id)"  data-bs-dismiss="modal" class="btn btn-info btn-sm"><i class="fa fa-pencil"></i>修改</button>' 
// 						+ '<button id="' + data + '" onclick="deleteModal(this.id)"  data-bs-dismiss="modal" class="btn btn-danger btn-sm"><i class="fa fa-trash-o"></i>刪除</button>';

						return '<input type="image" id="' + data + '" onclick="editModal(this.id)"  data-bs-dismiss="modal" src="${pageContext.request.contextPath}/images/update.jpg">' 
						+ '<input type="image" id="' + data + '" onclick="deleteModal(this.id)"  data-bs-dismiss="modal" src="${pageContext.request.contextPath}/images/delete.png">';
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
				$("#accountdisplay").html(res.memberaccount);
				$("#memberemail").val(res.memberemail);
				$("#emaildisplay").val(res.memberemail);
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
	

</body>
</html>