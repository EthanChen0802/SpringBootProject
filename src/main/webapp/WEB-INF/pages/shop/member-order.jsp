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
 
<style>
.o {
	font-size: 18px;
	font-weight:bold;
	list-style:circle;
}
</style>
 
 
</head>

<body data-spy="scroll" data-target=".site-navbar-target" data-offset="300">


  <div id="overlayer"></div>
  <div class="loader">
    <div class="spinner-border text-primary" role="status">
      <span class="sr-only">Loading...</span>
    </div>
  </div>

    <div class="site-mobile-menu site-navbar-target">
      <div class="site-mobile-menu-header">
        <div class="site-mobile-menu-close mt-3">
          <span class="icon-close2 js-menu-toggle"></span>
        </div>
      </div>
      <div class="site-mobile-menu-body"></div>
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
			
				<div class="card-header" style="margin-bottom:60px;">
					<i class="fas fa-table me-1"></i> 會員系統
				</div>
				
				
				<!-- 第一列 -->
				<div class=row  style="margin-bottom:18px">
				<div class="col-md-3"></div>
				<div class="col-md-8" style="margin: 0 auto;">
					<c:choose>
						<c:when test="${not empty cartItems}">
							<h3 style="margin: 0 auto 20px auto;  text-align:center;">會員訂單紀錄</h3>
						</c:when>
					</c:choose>
				</div>
				<div class="col-md-1"></div>
				
				</div>
				
				
				
				<!-- 第二列 -->
				<div class="row" style="margin-bottom:100px">
				
					<!-- 會員資料索引 -->	
					<div class="sort btn-group-vertical">
						<span class="btn btn-dark btn-lg" style="font-size:20px; display: flex; align-items: center;" class="btn btn-outline-secondary btn-lg">會員資料索引</span>
						<a class="btn btn-outline-secondary btn-lg" style="font-size:20px; display: flex; align-items: center;" href="/Member/updateMember">修改個人資料</a>
						<a class="btn btn-outline-secondary btn-lg" style="font-size:20px; display: flex; align-items: center;" href="/Member/updateMemberAP">修改密碼</a>
						<a class="btn btn-outline-secondary btn-lg" style="font-size:20px; display: flex; align-items: center;" href="#">健康資料表</a>
						<a class="btn btn-outline-secondary btn-lg" style="font-size:20px; display: flex; align-items: center;" href="${pageContext.request.contextPath}/cart/order">會員訂單</a>
						<a class="btn btn-outline-secondary btn-lg" style="font-size:20px; display: flex; align-items: center;" href="${pageContext.request.contextPath}/cart/showcollect">會員收藏</a>
						<a class="btn btn-outline-secondary btn-lg" style="font-size:20px; display: flex; align-items: center;" href="#">加甚麼看你</a>
					</div>
				

					<div class="col-md-8" style="margin: 0 auto;">
						
				          <c:choose>
					          <c:when test="${not empty cartItems}">
					          
					          <c:forEach var="order" items="${orders}">
					          <div style="margin-bottom:100px">
					          	  <ul>
						         	 <li class="o"> 訂單編號: ${order.id} </li>
						         	 <li class="o"> 出貨狀態: <span style="color:red">${order.status}</span> </li>
						         	 <li class="o">收件人姓名: ${order.name} </li>
						         	 <li class="o"> 收件人電話: ${order.number} </li>
						         	 <li class="o"> 收件人信箱: ${order.email} </li>
						         	 <li class="o"> 收件人地址: ${order.address} </li>
						          </ul>
						          <input type="button" class="btn btn-outline-info" style="font-size:16px; font-weight:bold" value="訂單內容" onclick="show(${order.id})">
						     		 <div style="display:none" id="${order.id}">
							          	<table class="table table-hover" >
											<thead style="background-color:#F5F5F5"> 
												<tr>
													<th>輔具照片</th>
													<th>輔具名稱</th>
													<th>價格</th>
													<th>數量</th>
													<th>小計</th>
												</tr>
											</thead>
												
										
											<tbody>
												<c:forEach var="detail" items="${order.orderDetail}">
													<tr>
														<td>
															<img src="${pageContext.request.contextPath}/EquipImg/${detail.photo}"
																onerror="this.style.display='none'" width="120px"
																height="120px" />
														</td>
														<td>${detail.product}</td>
														<td>${detail.price}</td>
														<td>${detail.quantity}</td>
														<td>${detail.total}</td>
													</tr>
										
												</c:forEach>
											</tbody>
										</table>
									</div>
								</div>
							</c:forEach>
							</c:when>
							<c:otherwise>
								<div style="margin: 100px auto 0 auto; width:300px">
									 <span style="font-size:35px;">沒有訂單紀錄</span> 
								</div>
							</c:otherwise>
						</c:choose>
  					</div>
				<div class="col-md-4"></div>
			</div>
		</main>
	</div>
  
  
  
  
  <!-- Footer -->
    
  <%@ include file="/WEB-INF/pages/user-site-footer.jsp"%>


  <%@ include file="/WEB-INF/pages/user-js.jsp"%>
	

<script>
function show(id){
	
	$("#"+id).slideToggle();
	
}




</script>
 

  
</body>
</html>