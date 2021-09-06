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
					
					<div class="row">
					   <div class="col-lg-6">
                             <div class="card mb-4">
                                   <div class="card-header">
                                        <i class="fas fa-chart-bar me-1"></i>
                                       	 本月輔具銷售數量
                                    </div>
                                    <div class="card-body"><canvas id="chart-area" width="100%" height="50"></canvas></div>
                              </div>
                      </div>
                      
                      <div class="col-lg-6">
                            <div class="card mb-4">
                            <div class="card-header">
                                <i class="fas fa-chart-area me-1"></i>
                                每月銷售金額
                            </div>
                            <div class="card-body"><canvas id="myAreaChart" width="100%" height="50"></canvas></div>
                        </div>
                      </div>
					</div>


					<div class="card mb-4">
						<div class="card-header">
							<i class="fas fa-table me-1"></i> 訂單資料
						</div>
						<div class="card-body">

							<br />

							<table id="datatablesSimple">
								<thead>
									<tr>
										<th>編號</th>
										<th>姓名</th>
										<th>電話</th>
										<th>信箱</th>
										<th>地址</th>
										<th>出貨狀態</th>
										<th>品項</th>
										<th>刪除</th>
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
													<select name="status" id="s${order.id}" class="switch">
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
											<td>
												<input type="image" src="/images/delete.png" id="${order.id}" class="delete">
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
		
		var id = $(this).attr("id")
		
		$(document).on('change', "#"+ id, function() { 
				
			Swal.fire({
				  position: 'top',
				  icon: 'success',
				  title: '出貨狀態已更新',
				  showConfirmButton: false,
				  timer: 1500
				})
			
			$("#"+ id).attr("disabled", true);
			
			var sid = id.substring(1,);

			$.ajax({
				  url: "/order/changestatus",
				  type: "post",
				  data:  { "oId" : sid },
			  	  success: function(data){
			  		console.log(data);  	
			  	  }
			})
		
	})	
				
})




<!-- 刪除訂單 -->
	
	$(".delete").each(function(){
		
		var id = $(this).attr("id")
			
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
						  url: "/order/delete",
						  type: "post",
						  data:  {
							  "oId" : id
						  },
					  	  success: function(data){
					  		 
					  		console.log(data);  
					  		 
					  		Swal.fire({
					  		  position: 'top',
					  		  icon: 'success',
					  		  title: '訂單已刪除',
					  		  showConfirmButton: false,
					  		  timer: 1500
					  		})
							    
							setTimeout(function (){
								window.location.href ="/order/findall"
							}, 1400);
					  		
					  	
						 }

					  })       
					   
				  }
			 })

		})

	})	



<!-- bar chart-->
var ctx = document.getElementById('chart-area');

var myChart = new Chart(ctx, {
  type: 'bar', //圖表類型
  data: {
    //標題
    labels: ['醫療輔具', '照顧輔具', '行動輔具', '矯正輔具', '溝通輔具', '住家及其他'],
    datasets: [{
      data: [18, 12, 15, 7, 11, 2], //資料
      //圖表背景色
      backgroundColor: [
        'rgba(255, 99, 132, 0.5)',
        'rgba(54, 162, 235, 0.5)',
        'rgba(255, 206, 86, 0.5)',
        'rgba(75, 192, 192, 0.5)',
        'rgba(153, 102, 255, 0.5)',
        'rgba(255, 159, 64, 0.5)'
      ],
      //圖表外框線色
      borderColor: [
        'rgba(255, 99, 132, 1)',
        'rgba(54, 162, 235, 1)',
        'rgba(255, 206, 86, 1)',
        'rgba(75, 192, 192, 1)',
        'rgba(153, 102, 255, 1)',
        'rgba(255, 159, 64, 1)'
      ],
      //外框線寬度
      borderWidth: 1
    }]
  },
  options: {
	 legend: {
          display: false,
      },
    scales: {
      yAxes: [{
        ticks: {
          beginAtZero: true,
          responsive: true //符合響應式
        }
      }]
    }
  }
});


<!-- line chart -->
var line = document.getElementById('myAreaChart');

var myChart = new Chart(line, {
  type: 'line', //圖表類型
  data: {
    //標題
    labels: ['April', 'May', 'June', 'July', 'Aug'],
    datasets: [{
      data: [3000, 7500, 2800, 1100, 2000], //資料
      borderColor: 'rgba(132, 193, 255, 1)',
      fill: false,
     
      //外框線寬度
      borderWidth: 1
    }]
  },
  options: {
	 legend: {
          display: false,
      },
    scales: {
      yAxes: [{
        ticks: {
          beginAtZero: true,
          responsive: true //符合響應式
        }
      }]
    }
  }
});
</script>
	
</body>
</html>
