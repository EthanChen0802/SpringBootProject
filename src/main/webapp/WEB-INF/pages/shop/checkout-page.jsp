<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!doctype html>
<html lang="en">
<head>
  <title>健康優生網</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">    

  <link href="https://fonts.googleapis.com/css2?family=Open+Sans:wght@400;700&family=Playfair+Display:wght@400;700&display=swap" rel="stylesheet">
  <link rel="stylesheet" href="${pageContext.request.contextPath}/fonts/icomoon/style.css">

  <link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.min.css">
  <link rel="stylesheet" href="${pageContext.request.contextPath}/css/jquery-ui.css">
  <link rel="stylesheet" href="${pageContext.request.contextPath}/css/owl.carousel.min.css">
  <link rel="stylesheet" href="${pageContext.request.contextPath}/css/owl.theme.default.min.css">
  <link rel="stylesheet" href="${pageContext.request.contextPath}/css/owl.theme.default.min.css">

  <link rel="stylesheet" href="${pageContext.request.contextPath}/css/jquery.fancybox.min.css">

  <link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap-datepicker.css">

  <link rel="stylesheet" href="${pageContext.request.contextPath}/fonts/flaticon/font/flaticon.css">

  <link rel="stylesheet" href="${pageContext.request.contextPath}/css/aos.css">

  <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
  
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

    
    <header class="site-navbar light js-sticky-header site-navbar-target" role="banner">

      <div class="container">
        <div class="row align-items-center">

          <div class="col-6 col-xl-2">
            <div class="mb-0 site-logo"><a href="index.html" class="mb-0">Elderly<span class="text-primary">.</span> </a></div>
          </div>

          <div class="col-12 col-md-10 d-none d-xl-block">
            <nav class="site-navigation position-relative text-right" role="navigation">

              <ul class="site-menu main-menu js-clone-nav mr-auto d-none d-lg-block">
                <li><a href="index.html" class="active nav-link">首頁</a></li>


                <li class="has-children">
                  <a href="services.html" class="nav-link">叫車專區</a>
                  <ul class="dropdown">
                    <li><a href="#" class="nav-link">附近店家資訊</a></li>
                    <li class="has-children">
                      <a href="#">我要叫車</a>
                      <ul class="dropdown">
                        <li><a href="#">立即叫車</a></li>
                        <li><a href="#">預約叫車</a></li>
                      </ul>
                    </li>
                  </ul>
                </li>

                <li class="has-children">
                  <a href="#" class="nav-link">長者專區</a>
                  <ul class="dropdown">
                    <li><a href="${pageContext.request.contextPath}/consumer/toTheFrontPage" class="nav-link">輔具購買</a></li>
                  </ul>
                </li>


                 <li class="has-children">
                  <a href="services.html" class="nav-link">營養專區</a>
                  <ul class="dropdown">
                    <li><a href="#" class="nav-link">營養餐</a></li>
                    <li><a href="#" class="nav-link">食品資料</a></li>
                  </ul>
                </li>


                <li class="has-children">
                  <a href="services.html" class="nav-link">用藥查詢</a>
                  <ul class="dropdown">
                    <li><a href="#" class="nav-link">藥品辨識</a></li>
                    <li><a href="#" class="nav-link">藥品包裝</a></li>
                  </ul>
                </li>

                <!-- <li><a href="contact.html" class="nav-link">會員登入</a></li> -->
                <li class="has-children">
                  <a href="services.html" class="nav-link">登入</a>
                  <ul class="dropdown">
                    <li><a href="#" class="nav-link">會員登入</a></li>
                    <li><a href="#" class="nav-link">廠商登入</a></li>
                  </ul>
                </li>
                
                
                <li><a href="contact.html" class="nav-link">聯絡我們</a></li>
              </ul>

            </nav>
          </div>


          <div class="col-6 d-inline-block d-xl-none ml-md-0 py-3" style="position: relative; top: 3px;"><a href="#" class="site-menu-toggle js-menu-toggle float-right"><span class="icon-menu h3 text-white"></span></a></div>

        </div>
      </div>

    </header>


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
    
    <div class="site-footer bg-light">
      <div class="container">
        <div class="row">
          <div class="col-lg-4">
            <h2 class="footer-heading mb-4">About</h2>
            <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Modi cumque tenetur inventore veniam, hic vel ipsa necessitatibus ducimus architecto fugiat!</p>
            <div class="my-5 social">
              <a href="#" class="pl-0 pr-3"><span class="icon-facebook"></span></a>
              <a href="#" class="pl-3 pr-3"><span class="icon-twitter"></span></a>
              <a href="#" class="pl-3 pr-3"><span class="icon-instagram"></span></a>
              <a href="#" class="pl-3 pr-3"><span class="icon-linkedin"></span></a>
            </div>
          </div>
          <div class="col-lg-8">
            <div class="row">
              <div class="col-lg-4">
                <h2 class="footer-heading mb-4">Quick Links</h2>
                <ul class="list-unstyled">
                  <li><a href="#">Amazing Atmosphere</a></li>
                  <li><a href="#">Caring Staff</a></li>
                  <li><a href="#">FAQs</a></li>
                  <li><a href="#">About Us</a></li>
                  <li><a href="#">Contact Us</a></li>
                </ul>
              </div>
              <div class="col-lg-4">
                <h2 class="footer-heading mb-4">Helpful Link</h2>
                <ul class="list-unstyled">
                  <li><a href="#">Hospice Care</a></li>
                  <li><a href="#">Excellent Cuisine</a></li>
                  <li><a href="#">Privacy</a></li>
                  <li><a href="#">Terms</a></li>
                </ul>
              </div>
              <div class="col-lg-4">
                <h2 class="footer-heading mb-4">Resources</h2>
                <ul class="list-unstyled">
                  <li><a href="#">Health Care</a></li>
                  <li><a href="#">Elderly Care</a></li>
                  <li><a href="#">Care with Love</a></li>
                  <li><a href="#">Quality Care</a></li>
                </ul>
              </div>
            </div>
          </div>
        </div>
        <div class="row text-center">
          <div class="col-md-12">
            <div class="border-top pt-5">
              <p class="copyright"><small>
                <!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
                Copyright &copy;<script>document.write(new Date().getFullYear());</script> All rights reserved | This template is made with <i class="icon-heart text-danger" aria-hidden="true"></i> by <a href="https://colorlib.com" target="_blank" >Colorlib</a>
                <!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. --></small></p>

              </div>
            </div>

          </div>
        </div>
      </div>

  </div> <!-- .site-wrap -->

  <script src="${pageContext.request.contextPath}/js/jquery-3.3.1.min.js"></script>
  <script src="${pageContext.request.contextPath}/js/jquery-ui.js"></script>
  <script src="${pageContext.request.contextPath}/js/popper.min.js"></script>
  <script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
  <script src="${pageContext.request.contextPath}/js/owl.carousel.min.js"></script>
  <script src="${pageContext.request.contextPath}/js/jquery.countdown.min.js"></script>
  <script src="${pageContext.request.contextPath}/js/jquery.easing.1.3.js"></script>
  <script src="${pageContext.request.contextPath}/js/aos.js"></script>
  <script src="${pageContext.request.contextPath}/js/jquery.waypoints.min.js"></script>
  <script src="${pageContext.request.contextPath}/js/jquery.animateNumber.min.js"></script>
  <script src="${pageContext.request.contextPath}/js/jquery.fancybox.min.js"></script>
  <script src="${pageContext.request.contextPath}/js/jquery.sticky.js"></script>
  <script src="${pageContext.request.contextPath}/js/isotope.pkgd.min.js"></script>


  <script src="${pageContext.request.contextPath}/js/main.js"></script>
  
  <!--  sweet alert -->
  <script src="/js/sweetalert2.all.min.js"></script>
	
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