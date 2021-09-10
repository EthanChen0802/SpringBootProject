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
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
  
  <!-- 引用ajax商品頁面 -->
  <script src="${pageContext.request.contextPath}/js/equipsellfront.js"></script>
  
  
  <!-- owl.carousel -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/assets/owl.carousel.min.css"></link>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/assets/owl.theme.default.min.css"></link>
<script src="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/owl.carousel.min.js"></script>
  
  <style>
  	
  	*{
  		font-family:Microsoft JhengHei;
  	}
  	
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
	  bottom: 90px;
	  right: 20px;
	}
	
	
	#top {
	  position: fixed;
	  bottom: 180px;
	  right: 20px;
	}
	
	
	.sort{
	    position: absolute;  /*固定在網頁上不隨卷軸移動，若要隨卷軸移動用absolute*/
	    top: 850px;  /*設置垂直位置*/
	    left: -10px;  /*設置水平位置，依所放的內容多寡需要自行手動調整*/
	    background: transparent;  /*背景顏色*/
		transition-duration:1s;
	}
	
	
	.btn{
		font-size:20px;
		border-radius:0;
	}
	
	.btn-dark{
		font-size:20px;
	}
	
	.h{
		width:100%;
	}
	
	.h:hover{
		background-color: rgb(36,160,237);
		color:white;
	}
	
	.btn-outline-primary {
	  color:rgb(36,160,237);
	  background-color: #fff;
	  border-color: rgb(36,160,237);
	}
	
	.btn-outline-primary:hover, .btn-outline-primary:focus, .btn-outline-primary:active:hover{
	  color: #fff;
	  background-color: rgb(36,160,237);
	  border-color: rgb(36,160,237);
	}
	
	.heart{
		-webkit-filter:opacity(0.2);
	}
	
	.heart:hover{
		-webkit-filter:opacity(1);
	}
	
	#dialog{
		background:white;
		background-image: url("${pageContext.request.contextPath}/images/background.jpg");
		background-size: cover;
	}
	
	#span{
		font-size: 30px;
		font-weight:bold;
		text-family:Microsoft JhengHei ;
		text-shadow: 0.1em 0.1em  lightgrey;
		
	}
	
	.dialogstyle{
		border:none;
	}
	
	.slideshow {
	    position: relative;
	    margin: auto;
	    overflow: hidden;
	    height: 400px;
	    width: 900px;
	}
	
	.slideshow img {
	    position: absolute;
	    top: 0;
	    left: 50%;
	    transform: translateX(-50%);
	    display: none;
	}
	
	
	 .modal-backdrop.in
	{
	    opacity:0.9 !important;
	}
		
  </style>  
  
   
  <script>
  
<!-- GetButton.io widget -->
    (function () {
        var options = {
            line: "//manager.line.biz/account/@100lshyw", // Line QR code URL
            call_to_action: "加入官方line", // Call to action
            position: "right", // Position may be 'right' or 'left'
        };
        var proto = document.location.protocol, host = "getbutton.io", url = proto + "//static." + host;
        var s = document.createElement('script'); s.type = 'text/javascript'; s.async = true; s.src = url + '/widget-send-button/js/init.js';
        s.onload = function () { WhWidgetSendButton.init(host, proto, options); };
        var x = document.getElementsByTagName('script')[0]; x.parentNode.insertBefore(s, x);
    })();
 <!-- /GetButton.io widget -->   
 
    
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

    
   <%@ include file="/WEB-INF/pages/user-header.jsp"%>


    <!-- MAIN -->
    <div class="slide-item overlay" style="background-image: url('${pageContext.request.contextPath}/images/wheelchair.jpg')">
      <div class="container">
        <div class="row">
          <div class="col-lg-8 align-self-center">
            <h1 class="heading mb-3">輔具購買商城</h1>
            <p class="lead text-white mb-5">提供各式各樣的輔具產品 <br>讓生活自在得意</p>
            <p><a href="${pageContext.request.contextPath}/contact" class="btn btn-primary">聯絡我們</a></p>
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
	<div class="sort btn-group-vertical" style="width:220px">
		<span class="btn btn-dark btn-lg">搜索</span>
		
		<input type="button" value="全部搜索" class="btn btn-outline-primary" onclick="reset()">
		
 		<button class="btn btn-outline-primary" onclick="hot()" style="padding-left:0px">
 		<img src="${pageContext.request.contextPath}/images/fire.png" style="width:30px;"/>熱門商品
 		</button>
 		
 		<button id="flip2" type="button" class="btn btn-outline-primary">
       	價格
   		</button>
    	<div id="panel2" style="display:none;border-right:1px solid blue">
			<input type="button" value="價格:低到高" class="btn h" onclick="ascend()">
			<input type="button" value="價格:高到低" class="btn h"  onclick="descend()"> 
		</div>
	
 		
 		
 		<button id="flip" type="button" class="btn btn-outline-primary">
       	輔具種類
    	</button>
    	
    	<div id="panel" style="display:none; border-right:1px solid blue; border-bottom:1px solid blue;">
			<input type="button" value="個人照護輔具" class="btn h" onclick="sort('個人照護輔具')"  >
			<input type="button" value="個人醫療輔具" class="btn h"  onclick="sort('個人醫療輔具')" > 
			<input type="button" value="個人行動輔具" class="btn h" onclick="sort('個人行動輔具')">
			<input type="button" value="矯正輔具" class="btn h" onclick="sort('矯正輔具')" >
			<input type="button" value="溝通與資訊輔具" class="btn h " onclick="sort('溝通與資訊輔具')" >
			<input type="button" value="家具與改裝組件" class="btn h" onclick="sort('住家及其他場所之家具與改裝組件')" >
 		</div>
	</div>
	
	<!--  產品推銷頁 -->
	<div id="dialog" >
		<div style="width:500px; margin:0px auto 20px auto;text-align:center">
			<span id="span">熱銷產品</span>
		</div>
		
		<div class="owl-carousel owl-theme">
			<c:forEach var="equip" items="${list}">
				<img src="${pageContext.request.contextPath}/EquipImg/${equip.photo}" style="width:260px;height:260px;">
			</c:forEach>
		</div>
		
		<div style=" position: absolute;bottom:25px; left:505px">
			<input type="button" value="close" id="close" class="btn btn-outline-info" style="font-size:10px;padding:4px 8px;  text-transform: none;">
		</div>
	</div>
		



    <div class="site-section">
	    
      <div class="container" style="width:1050px; margin-left:280px">
      	
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
	<%@ include file="/WEB-INF/pages/user-site-footer.jsp"%>


    

 	</div> <!-- .site-wrap -->
	<%@ include file="/WEB-INF/pages/user-js.jsp"%>
 
 
 <script>
 <!-- 搜索列滑動 -->
 $("#flip").click(function(){
	$("#panel").slideToggle("slide");
 });
 
 
 $("#flip2").click(function(){
		$("#panel2").slideToggle("slide");
	 });
 
 
 
 <!-- 收藏 -->
 function collect(eid){
	
	 $.ajax({
			  type:"post",
			  url:"${pageContext.request.contextPath}/cart/collect/" + eid,
			  success: function(data){
					
					if (data == "success"){
						Swal.fire('已為您加入收藏清單')
					}
					
					else if (data == "duplicate"){
						Swal.fire({
							  icon: 'error',
							  title: 'Oops...',
							  text: '已經收藏過囉!',
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
		 };
			 

		 // 創建dialog
	     $( "#dialog" ).dialog({
	    	dialogClass: 'dialogstyle',
	    	modal: true,
	    	draggable: false,
	    	hide: 'clip',
	    	height:480,
	    	width: 1060,
	        open: function(event, ui) {
	    	        $(event.target).parent().css('position', 'fixed');
	    	        $(event.target).parent().css('top', '30%');
	    	        $(event.target).parent().css('left', '18%');
	    	    }
	     });
		
	     //頁面黑色
	     $('.ui-widget-overlay').css({ background:"rgb(0, 0, 0)", opacity: '.7' });
		 
		 //移除標題列
	     $('.dialogstyle div.ui-dialog-titlebar').hide();
	
		 // 關閉dialog
		 $("#close").click(function(){
			 
			 $( "#dialog" ).dialog("close");
		 })

		 
		 
		 // 輪播圖
		 $('.owl-carousel').owlCarousel({
			    center: true,
			    items:2,
			    loop:true,
			    margin:0,
			    responsive:{
			        600:{
			            items:4
			        }
			    }
			});
 </script>

</body>
</html>