<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!doctype html>
<html lang="en">
<head>
  <title>健康優生網</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">    

  <script src="${pageContext.request.contextPath}/js/jquery-3.6.0.js"></script>
  
  <%@ include file="/WEB-INF/pages/user-css-js.jsp"%>
  
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

    
    <%@ include file="/WEB-INF/pages/user-header.jsp"%>


    <!-- MAIN -->
   <div class="slide-item overlay" style="background-image: url('${pageContext.request.contextPath}/images/wheelchair.jpg')">
      <div class="container">
        <div class="row">
          <div class="col-lg-6 align-self-center">
            <h1 class="heading mb-3" >輔具購買商城</h1>
            <p class="lead text-white mb-5">各式各樣的輔具產品<br>讓生活自在得意</p>
            <p><a href="${pageContext.request.contextPath}/contact" class="btn btn-primary">聯絡我們</a></p>
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

<%@ include file="/WEB-INF/pages/user-site-footer.jsp"%>

  </div> <!-- .site-wrap -->

<%@ include file="/WEB-INF/pages/user-js.jsp"%>

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