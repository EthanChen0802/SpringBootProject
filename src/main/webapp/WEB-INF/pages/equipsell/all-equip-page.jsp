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
		background-color: rgb(30, 144, 255);
		color:white;
		font-weight:bold;
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
					 if (n.hot=="Y"){
						 content += 
								"<div class='col-6 col-sm-6 col-md-6 mb-4 mb-lg-0 col-lg-3'>" 
							 +	"<div class='service' style='border:2px double rgba(0,0,0,.1); margin-bottom:50px; padding:0px;'>"	
							 +	"<a href='/consumer/findByIdforCustomer/"+ n.id  + "' class='d-block'>"
							 +  "<img src='../../EquipImg/" + n.photo +"'"
							 +  "alt='Image' class='img-fluid' style='height:240px; width:100%;'></a>"
							 +	"<div class='service-inner'style='padding-top:3px; padding-bottom:0px'>"
							 +  "<p style='font-size:16px; font-weight:bold; color:black'>" + n.name + "<p>"
							 + "<div style='width:100%; height:30px; positon:relative'>"
							 +  "<span style='color:red; font-size:18px;position:absolute; left:5px; font-weight:bold'> NT$" + n.price  + "</span>"
							 +  "<img src='${pageContext.request.contextPath}/images/fire.png' style='width:40px; height:25px; position:absolute; bottom:4px; right:30px;'>"	
							 +  "<img src='${pageContext.request.contextPath}/images/heart.png' style='width:22px; position:absolute; bottom:4px; right:10px; cursor:pointer'"
							 +  "onclick='collect("+ n.id +")' >"
							 +  "</div>"
							 +  "</div>"
							 +  "</div>"
							 +  "</div>"
					 }
					 else{
						 content += 
								"<div class='col-6 col-sm-6 col-md-6 mb-4 mb-lg-0 col-lg-3'>" 
							 +	"<div class='service' style='border:2px double rgba(0,0,0,.1); margin-bottom:50px; padding:0px;'>"	
							 +	"<a href='/consumer/findByIdforCustomer/"+ n.id  + "' class='d-block'>"
							 +  "<img src='../../EquipImg/" + n.photo +"'"
							 +  "alt='Image' class='img-fluid' style='height:240px; width:100%;'></a>"
							 +	"<div class='service-inner'style='padding-top:3px; padding-bottom:0px'>"
							 +  "<p style='font-size:16px; font-weight:bold; color:black'>" + n.name + "<p>"
							 +  "<div style='width:100%; height:30px; positon:relative'>"
							 +  "<span style='color:red; font-size:18px;position:absolute; left:5px; font-weight:bold'> NT$" + n.price  + "</span>"
							 +  "<img src='${pageContext.request.contextPath}/images/heart.png' style='width:22px; position:absolute; bottom:4px; right:10px; cursor:pointer'"
							 +  "onclick='collect("+ n.id +")' >"
							 +  "</div>"
							 +  "</div>"
							 +  "</div>"
							 +  "</div>"
					 }
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
		var Page = 1;
		createSortButton(sort, Page);
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
				 var parsedObjinArray = JSON.parse(json);
				 
				 // 清除div下的所有子內容
				 $(".site-section .container .row").empty();
				 
				 var div =  $(".site-section .container .row");
				
				 var content =""
				 
				 // 資料迴圈寫出
				 $.each(parsedObjinArray,function(i,n){
					 if (n.hot=="Y"){
						 content += 
								"<div class='col-6 col-sm-6 col-md-6 mb-4 mb-lg-0 col-lg-3'>" 
							 +	"<div class='service' style='border:2px double rgba(0,0,0,.1); margin-bottom:50px; padding:0px;'>"	
							 +	"<a href='/consumer/findByIdforCustomer/"+ n.id  + "' class='d-block'>"
							 +  "<img src='../../EquipImg/" + n.photo +"'"
							 +  "alt='Image' class='img-fluid' style='height:240px; width:100%;'></a>"
							 +	"<div class='service-inner'style='padding-top:3px; padding-bottom:0px'>"
							 +  "<p style='font-size:16px; font-weight:bold; color:black'>" + n.name + "<p>"
							 + "<div style='width:100%; height:30px; positon:relative'>"
							 +  "<span style='color:red; font-size:18px;position:absolute; left:5px; font-weight:bold'> NT$" + n.price  + "</span>"
							 +  "<img src='${pageContext.request.contextPath}/images/fire.png' style='width:40px; height:25px; position:absolute; bottom:4px; right:30px;'>"	
							 +  "<img src='${pageContext.request.contextPath}/images/heart.png' style='width:22px; position:absolute; bottom:4px; right:10px; cursor:pointer'"
							 +  "onclick='collect("+ n.id +")' >"
							 +  "</div>"
							 +  "</div>"
							 +  "</div>"
							 +  "</div>"
					 }
					 else{
						 content += 
								"<div class='col-6 col-sm-6 col-md-6 mb-4 mb-lg-0 col-lg-3'>" 
							 +	"<div class='service' style='border:2px double rgba(0,0,0,.1); margin-bottom:50px; padding:0px;'>"	
							 +	"<a href='/consumer/findByIdforCustomer/"+ n.id  + "' class='d-block'>"
							 +  "<img src='../../EquipImg/" + n.photo +"'"
							 +  "alt='Image' class='img-fluid' style='height:240px; width:100%;'></a>"
							 +	"<div class='service-inner'style='padding-top:3px; padding-bottom:0px'>"
							 +  "<p style='font-size:16px; font-weight:bold; color:black'>" + n.name + "<p>"
							 +  "<div style='width:100%; height:30px; positon:relative'>"
							 +  "<span style='color:red; font-size:18px;position:absolute; left:5px; font-weight:bold'> NT$" + n.price  + "</span>"
							 +  "<img src='${pageContext.request.contextPath}/images/heart.png' style='width:22px; position:absolute; bottom:4px; right:10px; cursor:pointer'"
							 +  "onclick='collect("+ n.id +")' >"
							 +  "</div>"
							 +  "</div>"
							 +  "</div>"
							 +  "</div>"
					 }
					 
				 })
				// append
				div.append(content);		 
			}
		
		})
	}
	
	

	// 搜索後創建button
	function createSortButton(sort, Page){
		
			$("#button").empty();
					 
			var button = "";
					
			for (var i=1; i <= Page; i++){
				button += "<button  id='myPage' value='" + i + "' onclick='sortchange("+ '"'+sort + '"'+ ", " + i +" )' >" + i +  "</button>";   
			}
			
			$("#button").append(button);
	}
	
	
	
	// 點擊sort button的時候換頁
	function sortchange(sort, Page){
		findsort(sort, Page);
	}
	
	
	
	// 重新使用全搜索
	function reset(){
		createAscendButton(3);
		change(1);
	}
	
	
	
	
	
	// 依照價錢搜索(低到高)
	function ascend(){
		var ascendPage = 3;
		createAscendButton(ascendPage);
		ascendChange(1);
	}	
	
	// 換頁碼
	function ascendChange(page){
		ascendPage = page
		ascendSort(ascendPage);
	}
	
	// 依照價錢搜索(低到高)
	function ascendSort(ascendPage){

		$.ajax({
			
			type:"post",
			url:"/consumer/ascend/" + ascendPage,
			dataType:'JSON',
			contentType:'application/json',
			
			success : function(data){
				 var json = JSON.stringify(data, null, 4);
				 var parsedObjinArray = JSON.parse(json);
				 
				 // 清除div下的所有子內容
				 $(".site-section .container .row").empty();
				 
				 var div =  $(".site-section .container .row");
				

				 var content =""
				 
				 // 資料迴圈寫出
				 $.each(parsedObjinArray,function(i,n){
					 if (n.hot=="Y"){
						 content += 
								"<div class='col-6 col-sm-6 col-md-6 mb-4 mb-lg-0 col-lg-3'>" 
							 +	"<div class='service' style='border:2px double rgba(0,0,0,.1); margin-bottom:50px; padding:0px;'>"	
							 +	"<a href='/consumer/findByIdforCustomer/"+ n.id  + "' class='d-block'>"
							 +  "<img src='../../EquipImg/" + n.photo +"'"
							 +  "alt='Image' class='img-fluid' style='height:240px; width:100%;'></a>"
							 +	"<div class='service-inner'style='padding-top:3px; padding-bottom:0px'>"
							 +  "<p style='font-size:16px; font-weight:bold; color:black'>" + n.name + "<p>"
							 + "<div style='width:100%; height:30px; positon:relative'>"
							 +  "<span style='color:red; font-size:18px;position:absolute; left:5px; font-weight:bold'> NT$" + n.price  + "</span>"
							 +  "<img src='${pageContext.request.contextPath}/images/fire.png' style='width:40px; height:25px; position:absolute; bottom:4px; right:30px;'>"	
							 +  "<img src='${pageContext.request.contextPath}/images/heart.png' style='width:22px; position:absolute; bottom:4px; right:10px; cursor:pointer'"
							 +  "onclick='collect("+ n.id +")' >"
							 +  "</div>"
							 +  "</div>"
							 +  "</div>"
							 +  "</div>"
					 }
					 else{
						 content += 
								"<div class='col-6 col-sm-6 col-md-6 mb-4 mb-lg-0 col-lg-3'>" 
							 +	"<div class='service' style='border:2px double rgba(0,0,0,.1); margin-bottom:50px; padding:0px;'>"	
							 +	"<a href='/consumer/findByIdforCustomer/"+ n.id  + "' class='d-block'>"
							 +  "<img src='../../EquipImg/" + n.photo +"'"
							 +  "alt='Image' class='img-fluid' style='height:240px; width:100%;'></a>"
							 +	"<div class='service-inner'style='padding-top:3px; padding-bottom:0px'>"
							 +  "<p style='font-size:16px; font-weight:bold; color:black'>" + n.name + "<p>"
							 +  "<div style='width:100%; height:30px; positon:relative'>"
							 +  "<span style='color:red; font-size:18px;position:absolute; left:5px; font-weight:bold'> NT$" + n.price  + "</span>"
							 +  "<img src='${pageContext.request.contextPath}/images/heart.png' style='width:22px; position:absolute; bottom:4px; right:10px; cursor:pointer'"
							 +  "onclick='collect("+ n.id +")' >"
							 +  "</div>"
							 +  "</div>"
							 +  "</div>"
							 +  "</div>"
					 }
					 
				 })
				// append
				div.append(content);		 
			}
		
		})
	}
	
	// 價錢低到高搜索後創建button
	function createAscendButton(ascendPage){
		
		$("#button").empty();
		 
		var button = "";
				
		for (var i=1; i <= ascendPage; i++){
			button += "<button id='myPage' value='" + i +"'  onclick='ascendChange("+i+")'>" +i +"</button>";   
		}

		$("#button").append(button);
	}
	
	
	
	
	// 依照價錢搜索(高到低)
	function descend(){
		var descendPage = 3;
		createDescendButton(descendPage);
		descendChange(1);
	}	
	
	// 換頁碼
	function descendChange(page){
		descendPage = page
		descendSort(descendPage);
	}
	
	
	// 依照價錢搜索(高到低)
	function descendSort(descendPage){

		$.ajax({
			
			type:"post",
			url:"/consumer/descend/" + descendPage,
			dataType:'JSON',
			contentType:'application/json',
			
			success : function(data){
				 var json = JSON.stringify(data, null, 4);
				 var parsedObjinArray = JSON.parse(json);
				 
				 // 清除div下的所有子內容
				 $(".site-section .container .row").empty();
				 
				 var div =  $(".site-section .container .row");
				

				 var content =""
				 
				 // 資料迴圈寫出
				 $.each(parsedObjinArray,function(i,n){
					 if (n.hot=="Y"){
						 content += 
								"<div class='col-6 col-sm-6 col-md-6 mb-4 mb-lg-0 col-lg-3'>" 
							 +	"<div class='service' style='border:2px double rgba(0,0,0,.1); margin-bottom:50px; padding:0px;'>"	
							 +	"<a href='/consumer/findByIdforCustomer/"+ n.id  + "' class='d-block'>"
							 +  "<img src='../../EquipImg/" + n.photo +"'"
							 +  "alt='Image' class='img-fluid' style='height:240px; width:100%;'></a>"
							 +	"<div class='service-inner'style='padding-top:3px; padding-bottom:0px'>"
							 +  "<p style='font-size:16px; font-weight:bold; color:black'>" + n.name + "<p>"
							 + "<div style='width:100%; height:30px; positon:relative'>"
							 +  "<span style='color:red; font-size:18px;position:absolute; left:5px; font-weight:bold'> NT$" + n.price  + "</span>"
							 +  "<img src='${pageContext.request.contextPath}/images/fire.png' style='width:40px; height:25px; position:absolute; bottom:4px; right:30px;'>"	
							 +  "<img src='${pageContext.request.contextPath}/images/heart.png' style='width:22px; position:absolute; bottom:4px; right:10px; cursor:pointer'"
							 +  "onclick='collect("+ n.id +")' >"
							 +  "</div>"
							 +  "</div>"
							 +  "</div>"
							 +  "</div>"
					 }
					 else{
						 content += 
								"<div class='col-6 col-sm-6 col-md-6 mb-4 mb-lg-0 col-lg-3'>" 
							 +	"<div class='service' style='border:2px double rgba(0,0,0,.1); margin-bottom:50px; padding:0px;'>"	
							 +	"<a href='/consumer/findByIdforCustomer/"+ n.id  + "' class='d-block'>"
							 +  "<img src='../../EquipImg/" + n.photo +"'"
							 +  "alt='Image' class='img-fluid' style='height:240px; width:100%;'></a>"
							 +	"<div class='service-inner'style='padding-top:3px; padding-bottom:0px'>"
							 +  "<p style='font-size:16px; font-weight:bold; color:black'>" + n.name + "<p>"
							 +  "<div style='width:100%; height:30px; positon:relative'>"
							 +  "<span style='color:red; font-size:18px;position:absolute; left:5px; font-weight:bold'> NT$" + n.price  + "</span>"
							 +  "<img src='${pageContext.request.contextPath}/images/heart.png' style='width:22px; position:absolute; bottom:4px; right:10px; cursor:pointer'"
							 +  "onclick='collect("+ n.id +")' >"
							 +  "</div>"
							 +  "</div>"
							 +  "</div>"
							 +  "</div>"
					 }
				 })
				// append
				div.append(content);		 
			}
		
		})
	}
	
	// 價錢低到高搜索後創建button
	function createDescendButton(descendPage){
		
		$("#button").empty();
		 
		var button = "";
				
		for (var i=1; i <= descendPage; i++){
			button += "<button id='myPage' value='" + i +"'  onclick='descendChange("+i+")'>" +i +"</button>";   
		}

		$("#button").append(button);
	}
	
	
	
	// 商品熱門搜索
	function hot(){
		var hotPage = 1;
		createHotButton(hotPage);
		hotChange(1);
	}	
	
	// 換頁碼
	function hotChange(page){
		hotPage = page
		hotSort(hotPage);
	}
	
	
	// 依照價錢搜索(高到低)
	function hotSort(hotPage){

		$.ajax({
			
			type:"post",
			url:"/consumer/hot/" + hotPage,
			dataType:'JSON',
			contentType:'application/json',
			
			success : function(data){
				 var json = JSON.stringify(data, null, 4);
				 var parsedObjinArray = JSON.parse(json);
				 
				 // 清除div下的所有子內容
				 $(".site-section .container .row").empty();
				 
				 var div =  $(".site-section .container .row");
				
				 var content =""
				 
				 // 資料迴圈寫出
				 $.each(parsedObjinArray,function(i,n){
					 if (n.hot=="Y"){
						 content += 
								"<div class='col-6 col-sm-6 col-md-6 mb-4 mb-lg-0 col-lg-3'>" 
							 +	"<div class='service' style='border:2px double rgba(0,0,0,.1); margin-bottom:50px; padding:0px;'>"	
							 +	"<a href='/consumer/findByIdforCustomer/"+ n.id  + "' class='d-block'>"
							 +  "<img src='../../EquipImg/" + n.photo +"'"
							 +  "alt='Image' class='img-fluid' style='height:240px; width:100%;'></a>"
							 +	"<div class='service-inner'style='padding-top:3px; padding-bottom:0px'>"
							 +  "<p style='font-size:16px; font-weight:bold; color:black'>" + n.name + "<p>"
							 + "<div style='width:100%; height:30px; positon:relative'>"
							 +  "<span style='color:red; font-size:18px;position:absolute; left:5px; font-weight:bold'> NT$" + n.price  + "</span>"
							 +  "<img src='${pageContext.request.contextPath}/images/fire.png' style='width:40px; height:25px; position:absolute; bottom:4px; right:30px;'>"	
							 +  "<img src='${pageContext.request.contextPath}/images/heart.png' style='width:22px; position:absolute; bottom:4px; right:10px; cursor:pointer'"
							 +  "onclick='collect("+ n.id +")' >"
							 +  "</div>"
							 +  "</div>"
							 +  "</div>"
							 +  "</div>"
					 }
					 else{
						 content += 
								"<div class='col-6 col-sm-6 col-md-6 mb-4 mb-lg-0 col-lg-3'>" 
							 +	"<div class='service' style='border:2px double rgba(0,0,0,.1); margin-bottom:50px; padding:0px;'>"	
							 +	"<a href='/consumer/findByIdforCustomer/"+ n.id  + "' class='d-block'>"
							 +  "<img src='../../EquipImg/" + n.photo +"'"
							 +  "alt='Image' class='img-fluid' style='height:240px; width:100%;'></a>"
							 +	"<div class='service-inner'style='padding-top:3px; padding-bottom:0px'>"
							 +  "<p style='font-size:16px; font-weight:bold; color:black'>" + n.name + "<p>"
							 +  "<div style='width:100%; height:30px; positon:relative'>"
							 +  "<span style='color:red; font-size:18px;position:absolute; left:5px; font-weight:bold'> NT$" + n.price  + "</span>"
							 +  "<img src='${pageContext.request.contextPath}/images/heart.png' style='width:22px; position:absolute; bottom:4px; right:10px; cursor:pointer'"
							 +  "onclick='collect("+ n.id +")' >"
							 +  "</div>"
							 +  "</div>"
							 +  "</div>"
							 +  "</div>"
					 }
				 })
				// append
				div.append(content);		 
			}
		
		})
	}
	
	// 價錢低到高搜索後創建button
	function createHotButton(hotPage){
		
		$("#button").empty();
		 
		var button = "";
				
		for (var i=1; i <= hotPage; i++){
			button += "<button id='myPage' value='" + i +"'  onclick='hotChange("+i+")'>" +i +"</button>";   
		}

		$("#button").append(button);
	}
	
	
	
	
	
</script>

<!-- GetButton.io widget -->
<script type="text/javascript">
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
</script>
<!-- /GetButton.io widget -->
  
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
		
		<input type="button" value="全部搜索" class="btn btn-outline-primary" onclick="reset()" style="border-bottom:none">
		
 		<button class="btn btn-outline-primary" onclick="hot()" style="padding-left:0px">
 		<img src="${pageContext.request.contextPath}/images/fire.png" style="width:30px;"/>熱門商品
 		</button>
 		
 		<button id="flip2" type="button" class="btn btn-outline-primary" style="border-top:none">
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
 
 $("#flip").click(function(){
	$("#panel").slideToggle("slide");
 });
 
 
 $("#flip2").click(function(){
		$("#panel2").slideToggle("slide");
	 });
 
 
 
 <!-- 收藏 -->
 function collect(eid){
	 alert(eid);
 };
 

 
 </script>

</body>
</html>