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

<%@ include file="/WEB-INF/pages/css.jsp"%>

</head>

<body class="sb-nav-fixed">

<%@ include file="/WEB-INF/pages/left-top-bar.jsp"%>
	
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
													<input type="image" src="/images/update.jpg" />
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

	<script src="/js/jquery-3.6.0.js"></script>
	
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
