/**
 * 
 */

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
							 +  "<span style='color:rgb(36,160,237);font-size:20px;position:absolute; left:5px; font-weight:bold'> NT$" + n.price  + "</span>"
							 +  "<img src='/images/fire.png' style='width:40px; height:25px; position:absolute; bottom:4px; right:30px;'>"	
							 +  "<img src='/images/heart.png' class='heart' style='width:22px; position:absolute; bottom:4px; right:10px; cursor:pointer'"
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
							 +  "<span style='color:rgb(36,160,237);font-size:20px;position:absolute; left:5px; font-weight:bold'> NT$" + n.price  + "</span>"
							 +  "<img src='/images/heart.png' class='heart' style='width:22px; position:absolute; bottom:4px; right:10px; cursor:pointer'"
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
							 +  "<span style='color:rgb(36,160,237);font-size:20px;position:absolute; left:5px; font-weight:bold'> NT$" + n.price  + "</span>"
							 +  "<img src='/images/fire.png' style='width:40px; height:25px; position:absolute; bottom:4px; right:30px;'>"	
							 +  "<img src='/images/heart.png'class='heart' style='width:22px; position:absolute; bottom:4px; right:10px; cursor:pointer'"
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
							 +  "<span style='color:rgb(36,160,237);font-size:20px;position:absolute; left:5px; font-weight:bold'> NT$" + n.price  + "</span>"
							 +  "<img src='/images/heart.png' class='heart' style='width:22px; position:absolute; bottom:4px; right:10px; cursor:pointer'"
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
		createInitialButton(3);
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
							 +  "<span style='color:rgb(36,160,237);font-size:20px;position:absolute; left:5px; font-weight:bold'> NT$" + n.price  + "</span>"
							 +  "<img src='/images/fire.png' style='width:40px; height:25px; position:absolute; bottom:4px; right:30px;'>"	
							 +  "<img src='/images/heart.png' class='heart' style='width:22px; position:absolute; bottom:4px; right:10px; cursor:pointer'"
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
							 +  "<span style='color:rgb(36,160,237);font-size:20px;position:absolute; left:5px; font-weight:bold'> NT$" + n.price  + "</span>"
							 +  "<img src='/images/heart.png' class='heart' style='width:22px; position:absolute; bottom:4px; right:10px; cursor:pointer'"
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
							 +  "<span style='color:rgb(36,160,237);font-size:20px;position:absolute; left:5px; font-weight:bold'> NT$" + n.price  + "</span>"
							 +  "<img src='/images/fire.png' style='width:40px; height:25px; position:absolute; bottom:4px; right:30px;'>"	
							 +  "<img src='/images/heart.png' class='heart' style='width:22px; position:absolute; bottom:4px; right:10px; cursor:pointer'"
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
							 +  "<span style='color:rgb(36,160,237);font-size:20px;position:absolute; left:5px; font-weight:bold'> NT$" + n.price  + "</span>"
							 +  "<img src='/images/heart.png' class='heart' style='width:22px; position:absolute; bottom:4px; right:10px; cursor:pointer'"
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
	
	
	// 熱門搜索
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
							 +  "<span style='color:rgb(36,160,237);font-size:20px;position:absolute; left:5px; font-weight:bold'> NT$" + n.price  + "</span>"
							 +  "<img src='/images/fire.png' style='width:40px; height:25px; position:absolute; bottom:4px; right:30px;'>"	
							 +  "<img src='/images/heart.png' class='heart' style='width:22px; position:absolute; bottom:4px; right:10px; cursor:pointer'"
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
							 +  "<span style='color:rgb(36,160,237);font-size:20px;position:absolute; left:5px; font-weight:bold'> NT$" + n.price  + "</span>"
							 +  "<img src='/images/heart.png' class='heart' style='width:22px; position:absolute; bottom:4px; right:10px; cursor:pointer'"
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
	
	// 熱門搜索後創建button
	function createHotButton(hotPage){
		
		$("#button").empty();
		 
		var button = "";
				
		for (var i=1; i <= hotPage; i++){
			button += "<button id='myPage' value='" + i +"'  onclick='hotChange("+i+")'>" +i +"</button>";   
		}

		$("#button").append(button);
	}
	
	
	
	
	
