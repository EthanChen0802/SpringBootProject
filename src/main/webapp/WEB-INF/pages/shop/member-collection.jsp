<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!doctype html>
<html lang="en">
<head>
  <title>健康優生網</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">    

  <%@ include file="/WEB-INF/pages/user-css-js.jsp"%>
  
  <script src="${pageContext.request.contextPath}/js/jquery-3.6.0.js"></script>
 
 
</head>

<body data-spy="scroll" data-target=".site-navbar-target" data-offset="300">


  <div id="overlayer"></div>
  <div class="loader">
    <div class="spinner-border text-primary" role="status">
      <span class="sr-only">Loading...</span>
    </div>
  </div>


  <div class="site-wrap">

    <div class="site-mobile-menu site-navbar-target">
      <div class="site-mobile-menu-header">
        <div class="site-mobile-menu-close mt-3">
          <span class="icon-close2 js-menu-toggle"></span>
        </div>
      </div>
      <div class="site-mobile-menu-body"></div>
    </div>
  </div>
    
  <%@ include file="/WEB-INF/pages/user-header.jsp"%>


    <!-- MAIN -->
   <div class="slide-item overlay" style="background-image: url('${pageContext.request.contextPath}/images/slider-2.jpg')">
      <div class="container">
        <div class="row">
          <div class="col-lg-6 align-self-center">
            <h1 class="heading mb-3">健康悠生伴你一生</h1>
            <p class="lead text-white mb-5">健康一生 悠活一生</p>
            <p><a href="about.html" class="btn btn-primary">關於我們</a></p>
          </div>
        </div>
      </div>  
    </div>



<div id="layoutSidenav_content">
		<main>
				<div class="card-header" style="margin-bottom:25px;">
					<i class="fas fa-table me-1"></i> 會員系統
				</div>
				
				
				<!-- 第一列 -->
				<div class=row  style="margin-bottom:30px">
				<div class="col-md-2"></div>
				<div class="col-md-9" style="margin: 0 auto;">
					<h3 style="text-align:center;">會員輔具收藏</h3>
				</div>
				<div class="col-md-1"></div>
				
				</div>
				
				
				<!-- 第二列 -->
				<div class="row" style="margin-bottom:100px">
				
				<div class="col-md-2">
					<!-- 會員資料索引 -->	
					<%@ include file="/WEB-INF/pages/Member-index.jsp"%>
				</div>

						<div class="col-md-9" style="margin: 0 auto;">
						
						
						
						<table class="table table-hover">
							<thead>
								<tr class="table-primary">
									<th>輔具照片</th>
									<th>輔具名稱</th>
									<th>輔具類型</th>
									<th>販賣商</th>
									<th>價格</th>
									<th>衛生署字號</th>
									<th></th>
								</tr>
							</thead>
					
						<c:choose>
						<c:when test="${not empty list}">
							<c:forEach var="equip" items="${list}">
							<tbody>
								<tr>
									<td>
										<a href="/consumer/findByIdforCustomer/${equip.id}"  >
											<img src="${pageContext.request.contextPath}/EquipImg/${equip.photo}"
												onerror="this.style.display='none'" width="120px"
												height="120px" />
										</a>	
									</td>
									<td>${equip.name}</td>
									<td>${equip.type}</td>
									<td>${equip.vendor}</td>
									<td>${equip.price}</td>
									<td>${equip.document}</td>
									<td><input type="image" src="/images/delete.png" id="${equip.id}" class="delete"></td>
								</tr>
							</tbody>
							</c:forEach>
						</c:when>
			            <c:otherwise>
							<tbody>
								<tr>
									<td colspan=7 style="text-align:center;"> <span style="font-size:25px;">目前沒有任何收藏喔</span> </td>
								</tr>
							</tbody>
						</c:otherwise>
						</c:choose>
					</table>
				</div>
				<div class="col-md-1"></div>

			</div>
		</main>
	</div>
  
  
  
  
  
  
  <!-- Footer -->
    
  <%@ include file="/WEB-INF/pages/user-site-footer.jsp"%>


  <%@ include file="/WEB-INF/pages/user-js.jsp"%>
	
  	
 
  <script>
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
						  url: "/cart/deleteCollect",
						  type: "post",
						  data:  {
							  "eId" : id
						  },
					  	  success: function(data){
					  		 
					  		console.log(data);  
					  		 
					  		$("#"+ id).closest("tr").remove();
					  		
					  		
					  		Swal.fire({
					  		  position: 'top',
					  		  icon: 'success',
					  		  title: '資料已刪除',
					  		  showConfirmButton: false,
					  		  timer: 1500
					  		})
							  
					  	
						 }

					  })       
					   
				  }
			 })

		})

	})	
  
  
  
  </script>
</body>
</html>