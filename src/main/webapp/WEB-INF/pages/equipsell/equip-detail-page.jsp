<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

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
  
  
<style>
#pic{
  display: block;
  margin-left: auto;
  margin-right: auto;
  width: 280px;
  height:280px;
  border: none;
  border-radius: 4px;


}


h4{
	font-size:22px;
	font-weight:bold;
}

p{
	font-size:20px;
}

.service{
	padding-bottom:20px;
	padding-top:10px;
	padding-left:20px;
	padding-right:20px;
	border:1px solid lightgrey;

}


#minus , #plus{
	border:0; 
	font-size:20px;
	background-color:white

}

#text-box{
	font-size:14px;
	text-align:center;
	width:35px;
	height:30px;

}

#cart-icon {
  position: fixed;
  bottom: 80px;
  right: 10px;
}

#top {
  position: fixed;
  bottom: 170px;
  right: 10px;
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
	
	
	
	 <div id="top">
		  <a href="#"><img src="${pageContext.request.contextPath}/images/top.png" width="50px" height="50px"/></a>
	</div>	

	<div id="cart-icon">
		  <a href="${pageContext.request.contextPath}/cart"><img src="${pageContext.request.contextPath}/images/checklist.png" width="60px" height="60px"/></a>
	</div>	



  
    <div class="site-section">
      <div class="container">
        <div class="row">
        	
         
          <div class="col-md-4">
	          <div class="service">
		         	<div>
		         		<h4>商品名稱</h4>
		         		<p>${equip.name}</p>
		         		<p>.......................</p>
		         	</div>
		         	
		         	<div>
		         		<h4>商品種類</h4>
		         		<p>${equip.type}</p>
		         		<p>.......................</p>
		         	</div>
		         	<div>
		         		<h4>販售商</h4>
		         		<p>${equip.vendor}</p>
		         		<p>.......................</p>
		         	</div>
		         	<div>
		         		<h4>醫療器材查驗登記字號</h4>
		         		<p>${equip.document}</p>
		         	</div>
	          </div>
      	  </div>
      	  
      	  
      	  
      	  
          <div class="col-md-4">
            <div class="service">
            	 <img src="${pageContext.request.contextPath}/EquipImg/${equip.photo}" id="pic"/>
            </div>
          </div>
          
          
          
          
          <div class="col-md-3">
            <div class="service">
            		
		         	
		         	<div>
		         		<h4>商品價格</h4>
		         		<p>NT$${equip.price}</p>
		         		<p>.......................</p>
		         	</div>
		         	
		         	<div>
	            		<p>購買數量: &nbsp 
	            		
	            			<input type="button" value="-" id="minus" >
	            			<input type="text" value="1" id="text-box">
	            			<input type="button" value="+" id="plus">	            		
		         		</p>
	            			
		         		<p>.......................</p>
		         	</div>
		         	
		         	
		         	<div>
		         		<a href="${pageContext.request.contextPath}/consumer/toTheFrontPage" 
		         				class="btn btn-outline-primary" style="font-weight:bold; font-size:14px">返回商品頁</a>
		         		
		         		<p>.......................</p>
		         	</div>
		         	
		         	
		         	<div>
		         		<input type="button" value="加入購物車" id="buttonAddToCart" class="btn btn-outline-dark" style="font-weight:bold; font-size:14px">
		         	</div>
		         	
	        	</div>
            </div>
       
       
       		<div class="col-md-1">
        	</div>
       			
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
	

<script>
	$("#plus").click(function(){
		
		var o1 = $("#text-box").val();
		var o2 = parseInt(o1);
		if (o2 < 20){
			var n  = o2  + 1;
			$("#text-box").val(n);
		}
		
	})
	
	
	
	$("#minus").click(function(){
		
		var o1 = $("#text-box").val();
		var o2 = parseInt(o1);
		
		if (o2 > 1){
			var n  = o2  - 1;
			$("#text-box").val(n);
		}
		
	})
	
	
	
	
	// 新增到購物車
	$("#buttonAddToCart").click(function(){
		var eid	= ${equip.id}
		var qty= parseInt($("#text-box").val());

		$.ajax({
			type:"post",
			url: "${pageContext.request.contextPath}/cart/add/" + eid + "/" + qty,
			datatype: "json",
			success: function(data){
				
				if (data == "success"){
					
					Swal.fire({
						  position: 'top',
						  icon: 'success',
						  title: '商品已加入購物車',
						  showConfirmButton: false,
						  timer: 1500
						})
					}
					
				else{
					
					Swal.fire({
						  icon: 'error',
						  title: 'Oops...',
						  text: '請先登入會員!',
						})
				}
				
				}

				
		})
	
	
	
	
	})

</script>

</body>
</html>