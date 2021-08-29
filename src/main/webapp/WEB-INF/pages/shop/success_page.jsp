<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

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




  
   <div class="site-section">
      <div class="container">
      
      	<!-- 第一列 -->
      	  <div class="row">
	          <div class="col-md-1"></div>
	   		  
	          <div class="col-md-10">
	          		<h3>訂單已送出， 資訊如下</h3>
	          		<table class="table table-hover" style="margin-top:50px">
		          		<thead style="background-color:#F5F5F5">
		          			<tr>
		          				<th colspan="2">訂購人資訊</th>
		          			</tr>
		          		</thead>
		          		<tbody>
			          		<tr>
			          			<td><label>收件人姓名:</label></td>
				          		<td>${order.name}</td>
			          		</tr>
			          		<tr>
				          		<td><label>收件人電話:</label></td>
				          		<td>${order.number}</td>
			          		</tr>
			          		<tr>
				          		<td><label>收件人email:</label></td>
				          		<td>${order.email}</td>
			          		</tr>
			          		<tr>
				          		<td><label>收件人地址:</label></td>
				          		<td>${order.address}</td>
			          		</tr>
			          		<tr>
				          		<td><label>訂單編號:</label></td>
				          		<td>${order.id}</td>
			          		</tr>
		          		</tbody>
		          	</table>
	          
	          
	          </div>	
      			
      		<div class="col-md-1"></div>
      	</div>	
     	<!--  -->
      
      
      	<!-- 第二列 -->
	      <div class="row" style="margin-top:50px">
	          <div class="col-md-1"></div>
	   
	          <div class="col-md-10">
	          	
	          	<table class="table table-hover">
	          		<thead style="background-color:#F5F5F5">
	          			<tr>
	          				<th>商品名稱</th>
	          				<th>單價</th>
	          				<th>數量</th>
	          				<th>小計</th>
	          			</tr>
	          		</thead>
		          		<c:forEach var="detail" items="${order.orderDetail}" >
			          		<tbody id="row${item.equip.id}">
			          			<tr>
									<td>${detail.product}</td>
									<td>${detail.price}</td>
									<td>${detail.quantity}</td>
									<td class=single>${detail.total}</td>
			          			</tr>
			          		</tbody>
		          		</c:forEach>
			  
			  				
					<tfoot style="background-color:#F5F5F5">
						<tr>
	          				<td></td>
	          				<td></td>
	          				<td>商品總金額:</td>
	          				<td id=all style="font-weight:bold; font-size:22px"></td>
	          			</tr>	

	          			<tr style="border-top-style:hidden;">
	          				<td></td>
	          				<td></td>
	          				<td></td>
	          				<td>
	          					<a href="${pageContext.request.contextPath}/consumer/toTheFrontPage" class="btn btn-info" id="checkout" style="font-weight:bold; font-size:14px; border-radius:0px">
	          						返回商品頁
	          					</a>
	          				</td>
	          			</tr>		
					</tfoot>
	         	</table>
	       	</div>
	        <div class="col-md-1"></div>	
	    </div>
       	<!--  -->
      
      </div>
    </div>
  
  
  
  
    <!-- Footer -->
 <%@ include file="/WEB-INF/pages/user-site-footer.jsp"%>

  </div> <!-- .site-wrap -->
  
<%@ include file="/WEB-INF/pages/user-js.jsp"%>
	
	
	

<script>
		var result = 0;
		$(".single").each(function(){
			result += parseInt($(this).html())
			
		});	
			
		$("#all").text(result);

</script>
	
</body>
</html>