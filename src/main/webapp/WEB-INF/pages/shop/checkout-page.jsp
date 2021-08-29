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
      
			<form action="${pageContext.request.contextPath}/cart/saveOrder" method="get" id="submit">
			
      		<!-- 第一列 -->
	      	<div class="row">
		          <div class="col-md-1"></div>
		          <div class="col-md-8">
		          	<table class="table table-hover">
		          		<thead style="background-color:#F5F5F5">
		          			<tr>
		          				<th colspan="2">訂購人資訊填寫</th>
		          			</tr>
		          		</thead>
		          		<tbody>
			          		<tr>
			          			<td><label>收件人姓名:</label></td>
				          		<td><input name="name" value="${member.membername}" id="name"/></td>
			          		</tr>
			          		<tr>
				          		<td><label>收件人電話:</label></td>
				          		<td><input name="number" value="${member.memberphone}" id="number"/></td>
			          		</tr>
			          		<tr>
				          		<td><label>收件人email:</label></td>
				          		<td><input name="email" value="${member.memberemail}" id="email"/></td>
			          		</tr>
			          		<tr>
				          		<td><label>收件人地址:</label></td>
				          		<td><input name="address" value="${member.membercity}${member.membertown}${member.memberaddress}" id="address"/></td>
			          		</tr>
		          		</tbody>
		          	</table>
		          </div>
		          <div class="col-md-3"></div>
	      	</div>
      	  <!--  -->


		  <!-- 第二列 -->	
	      <div class="row" style="margin-top:50px">
	          <div class="col-md-1"></div>
	   
	          <div class="col-md-10">
	          	<table class="table table-hover">
	          		<thead style="background-color:#F5F5F5">
	          			<tr>
	          				<th>商品照</th>
	          				<th>商品名稱</th>
	          				<th>單價</th>
	          				<th>數量</th>
	          				<th>小計</th>
	          			</tr>
	          		</thead>
		          		<c:forEach var="item" items="${cartItems}" >
			          		<tbody id="row${item.equip.id}">
			          			<tr>
									<td><img src="${pageContext.request.contextPath}/EquipImg/${item.equip.photo}" style="width:100px; height:100px"/></td>
									<td>
										${item.equip.name}
									</td>
									<td> $${item.equip.price}</td>
									<td>
				            			${item.quantity}
									</td>
									<td class="subtotal" id="subtotal${item.equip.id}" >
										 $${item.subtotal}	
									</td>
			          			</tr>
			          		</tbody>
		          		</c:forEach>
			  
			  				
					<tfoot style="background-color:#F5F5F5">
						<tr>
	          				<td></td>
	          				<td></td>
	          				<td></td>
	          				<td>商品總金額:</td>
	          				<td id="totalAmount" style="color:red; font-size:22px"></td>
	          			</tr>	
	          			<tr style="border-top-style:hidden;">
	          				<td></td>
	          				<td></td>
	          				<td></td>
	          				<td></td>
	          				<td>
	          					<a href="${pageContext.request.contextPath}/cart" class="btn btn-info" id="checkout" style="font-weight:bold; font-size:14px; border-radius:0px">
	          						返回購物車
	          					</a>
	          				</td>
	          				
	          				
	          				<!--  
			          			<input type="submit" value="確定下單" class="btn btn-danger" style="font-weight:bold; font-size:14px;border-radius:0px" >
	          				-->
	          				
	          			</tr>	
					 </tfoot>
	              </table>
	              
	          </div>
		    <div class="col-md-1"></div>	
	    </div>
	   	<input type="hidden" name="memberid" value="${member.memberid}">
	    </form>
	    <!--  -->
	    
	    <div class="row" style="margin-top:50px; ">
	        <div class="col-md-1"></div>
	           <div class="col-md-10">
		          	<table class="table table-hover" style="width:400px;" >
		          		<thead style="background-color:#F5F5F5">
		          			<tr>
		          				<th>確認付款</th>
		          			<tr>
			          	</thead>
			          	<tbody>
			          		<tr>
			          			<td id="paypal-button-container"></td>
			          		</tr>
			          	</tbody>
		          	</table>
	          	</div>
	    	<div class="col-md-3"></div>
	   </div>
	   
	    
	    
      </div>
    </div>
  
  
  
  
  
  <!-- Footer -->
    
  <%@ include file="/WEB-INF/pages/user-site-footer.jsp"%>

  </div> <!-- .site-wrap -->

  <%@ include file="/WEB-INF/pages/user-js.jsp"%>
	
  <!-- Paypal  -->
  <script src="https://www.paypal.com/sdk/js?client-id=Ae1kvJ13veg5f-jN3vNGxKcQiamIML_WdggWjEG0tfP6Iy1xP5QAnGhyuGbGOBkKphwLjmwbpckDtzGY&currency=TWD"></script>
	
  <script>
	updateTotal();


	// 計算總數量	
	function updateTotal(){
		total=0.0;
		
		
		$(".subtotal").each(function(index, element){	
			total =  total + parseInt(element.innerHTML.replace("$",""));
		})
		
		$("#totalAmount").text("$"+total);	
	}	

	
	 



	// paypal 按鈕
	paypal.Buttons({
		
		style: {
		    layout:  'vertical',
		    color:   'blue',
		    shape:   'rect',
		    label:   'paypal',
		    size:    'small'
		  },
		
		
		
		createOrder: function(data, actions) {
			
			var surname = $("#name").val().substring(0,1);
			var firstname = $("#name").val().substring(1);
			var email = $("#email").val();
			var number = $("#number").val();
			var totalAmount = $("#totalAmount").text().substring(1);
				

			
			return actions.order.create({
				intent: "CAPTURE", // 捕捉買家付款行為
				
				payer: {
					name:{
						given_name: firstname,
						surname: surname
					},
					email_address: email,
					phone: { 
						phone_type: "MOBILE",
						country_code:"TW",
						phone_number:{
							national_number: number
						}
						
					},
					address:{
						country_code:"TW",
					}
				},
				application_context: {
		              shipping_preference: 'NO_SHIPPING'
		            },
		        purchase_units: [{
			          amount: {
			            value: totalAmount
			          }
			      }]
			
			});
		},
		
		// 付款成功
		onApprove: function(data, actions){
			
			return actions.order.capture().then(function(details){
				
				
				setTimeout(function() {
					submit.submit();
				}, 1800);
				
				
				Swal.fire({
					  position: 'top',
					  icon: 'success',
					  title: '付款成功，將為您跳轉',
					  showConfirmButton: false,
					  timer: 2000
					})
			})
		}
		
		
	
		
		
		
	}).render("#paypal-button-container");

  </script>
</body>
</html>