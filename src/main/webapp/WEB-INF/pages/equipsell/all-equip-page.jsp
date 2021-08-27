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
  	
  	#button{
  		width:200px;
  		margin: 0 auto 20px auto;
  	}
  	
  	#myPage{
  		border-radius:10px;
  		margin:5px;
  		font-size:25px;
  		transition-duration: 0.4s;
  		border:none;
  		box-shadow: 0 8px 16px 0 rgba(0,0,0,0.2);
  		outline:none;

  	}
  	
  	#myPage:hover {
  		background-color: skyblue;
  		color: white;
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
	
	
	.sort{
	    position: absolute;  /*固定在網頁上不隨卷軸移動，若要隨卷軸移動用absolute*/
	    top: 118%;  /*設置垂直位置*/
	    left: -17px;  /*設置水平位置，依所放的內容多寡需要自行手動調整*/
	    background: transparent;  /*背景顏色*/
		transition-duration:1s;
	}
	
	
	.btn{
		font-size:16px;
		font-family:serif;
		border-radius:0;
	}
	
	.btn-dark{
		font-size:18px;
		font-family:serif;
	}
  </style>  
  
   
<script>
    <!-- ajax 載入內容 -->
	
    // 設定頁數
  	var indexPage = 3;
  
  
	// 啟動時載入，顯示在第一頁
	$(function(){
		createInitialButton(indexPage);
		change(1);
	})

	   
  
	 // 換頁時更動資料
	 function change(page){ 
	   	indexPage = page;
	  	load(indexPage);
	 }
		 

  
	// 向資料庫要取分頁資料的function
	function load(indexPage){
		
		$.ajax({
			
			type:"post",
			url:"/consumer/findallforConsumerByPage/" + indexPage,
			dataType:'JSON',
			contentType:'application/json',
			
			success : function(data){
				 var json = JSON.stringify(data, null, 4);
			     //console.log("SUCCESS : ", json);
			     
				 var parsedObjinArray = JSON.parse(json);
				 
				 
				 // 清除div下的所有子內容
				 $(".site-section .container .row").empty();
				 
				 var div =  $(".site-section .container .row");
				

				 var content =""
				 
				 // 資料迴圈寫出
				 $.each(parsedObjinArray,function(i,n){
					 
					 content += 
						"<div class='col-6 col-sm-6 col-md-6 mb-4 mb-lg-0 col-lg-3'>" 
					 +	"<div class='service' style='border:2px double rgba(0,0,0,.1); margin-bottom:50px; padding:0px;'>"	
					 +	"<a href='/consumer/findByIdforCustomer/"+ n.id  + "' class='d-block'>"
					 +  "<img src='../../EquipImg/" + n.photo +"'"
					 +  "alt='Image' class='img-fluid' style='height:240px; width:100%;'></a>"
					 +	"<div class='service-inner' style='padding-bottom:2px; padding-left:15px;'>"
					 +  "<p style='font-size:18px; font-weight:bold; color:black'>" + n.name + "<p>"
					 +  "<p style='color:red; font-size:18px; "
					 +  " margin-top:50px; text-align:left; font-weight:bold'> $" + n.price +"</P>"
					 +  "</div>"
					 +  "</div>"
					 +  "</div>"
					 
				 })
				 
			
	
				 // append
				div.append(content);		 
			}
		
		})

	}
	
	
	// 創建button
	function createInitialButton(indexPage){
		
			$("#button").empty();
					 
			var button = "";
					
			for (var i=1; i <= indexPage; i++){
				button += "<button id='myPage' value='" + i +"'  onclick='change("+i+")'>" +i +"</button>";   
			}

			$("#button").append(button);
	}
	
	
	
	
	
	// 依據輔具種類搜索，創建button，並顯示在第一頁
	function sort(sort){
		var indexPage = 1;
		createSortButton(sort, indexPage);
		sortchange(sort, 1)
	}
	
	
	// ajax依照輔具種類搜索
	function findsort(sort, indexPage){ 
		
		$.ajax({
			
			type:"post",
			url:"/consumer/findSortforConsumerByPage/" +  sort + "/" +indexPage,
			dataType:'JSON',
			contentType:'application/json',
			
			success : function(data){
				 var json = JSON.stringify(data, null, 4);
			     //console.log("SUCCESS : ", json);
			     
				 var parsedObjinArray = JSON.parse(json);
				 
				 
				 // 清除div下的所有子內容
				 $(".site-section .container .row").empty();
				 
				 var div =  $(".site-section .container .row");
				

				 var content =""
				 
				 // 資料迴圈寫出
				 $.each(parsedObjinArray,function(i,n){
					 
					 content += 
						"<div class='col-6 col-sm-6 col-md-6 mb-4 mb-lg-0 col-lg-3'>" 
					 +	"<div class='service' style='border:2px double rgba(0,0,0,.1); margin-bottom:50px; padding:0px;'>"	
					 +	"<a href='/consumer/findByIdforCustomer/"+ n.id  + "' class='d-block'>"
					 +  "<img src='../../EquipImg/" + n.photo +"'"
					 +  "alt='Image' class='img-fluid' style='height:240px; width:100%;'></a>"
					 +	"<div class='service-inner' style='padding-bottom:2px; padding-left:15px;'>"
					 +  "<p style='font-size:18px; font-weight:bold; color:black'>" + n.name + "<p>"
					 +  "<p style='color:red; font-size:18px; "
					 +  " margin-top:50px; text-align:left; font-weight:bold'> $" + n.price +"</P>"
					 +  "</div>"
					 +  "</div>"
					 +  "</div>"
					 
				 })
				// append
				div.append(content);		 
			}
		
		})
	}
	
	

	// 搜索後創建button
	function createSortButton(sort, indexPage){
		
			$("#button").empty();
					 
			var button = "";
					
			for (var i=1; i <= indexPage; i++){
				button += "<button  id='myPage' value='" + i + "' onclick='sortchange("+ '"'+sort + '"'+ ", " + i +" )' >" + i +  "</button>";   
			}
			
			$("#button").append(button);
	}
	
	
	
	// 點擊sort button的時候換頁
	function sortchange(sort, indexPage){
		findsort(sort, indexPage);
	}
	
	
	
	// 重新使用全搜索
	function reset(){
		createInitialButton(3);
		change(1);
	}
</script>
  
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
                
                
                <li><a href="${pageContext.request.contextPath}/contact" class="nav-link">聯絡我們</a></li>
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
    
    

    <!-- 最上面 -->
    <div id="top">
		  <a href="#"><img src="${pageContext.request.contextPath}/images/top.png" width="50px" height="50px"/></a>
	</div>	
	
	<!-- 購物車 -->
	<div id="cart-icon">
		  <a href="${pageContext.request.contextPath}/cart"><img src="${pageContext.request.contextPath}/images/checklist.png" width="60px" height="60px"/></a>
	</div>	
	
	<!-- 搜索列 -->	
	<div class="sort btn-group-vertical">
		<span class="btn btn-dark btn-lg">搜索列</span>
		<input type="button" value="全部搜索" class="btn btn-outline-secondary btn-lg" onclick="reset()">
		<input type="button" value="個人照護輔具" class="btn btn-outline-secondary btn-lg" onclick="sort('個人照護輔具')">
		<input type="button" value="個人醫療輔具" class="btn btn-outline-secondary btn-lg"  onclick="sort('個人醫療輔具')"> 
		<input type="button" value="個人行動輔具" class="btn btn-outline-secondary btn-lg" onclick="sort('個人行動輔具')">
		<input type="button" value="矯正輔具" class="btn btn-outline-secondary btn-lg" onclick="sort('矯正輔具')">
		<input type="button" value="溝通與資訊輔具" class="btn btn-outline-secondary btn-lg" onclick="sort('溝通與資訊輔具')">
		
		<button type="button" class="btn btn-outline-secondary btn-lg" onclick="sort('住家及其他場所之家具與改裝組件')">
		住家及其他場所<br>之家具與改裝組件 </button>

	</div>


    <div class="site-section">
	    	  
      <div class="container">
      		
        <div class="row">
	       
        </div>
      </div>
      
      
    </div>
		
		

	<div id="button">
		<!-- 
		<c:forEach var="i" begin="1" end="${totalPages}" step="1">
			<button id="myPage" value="${i}" onclick="change(${i})">${i}</button>
		</c:forEach>
		 -->
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
 

</body>
</html>