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
        <div class="row">
          <div class="col-lg-8 mb-5">
            
            
            
            <form action="${pageContext.request.contextPath}/submit" method="post" id="submit">


              <div class="row form-group">
                
                <div class="col-md-6">
                  <label class="text-black" for="lname">姓氏</label>
                  <input type="text" name="lname" id="lname" class="form-control">
                </div>
                <div class="col-md-6 mb-3 mb-md-0">
                  <label class="text-black" for="fname">名字</label>
                  <input type="text" name="fname" id="fname" class="form-control">
                </div>
              </div>

              <div class="row form-group">

                <div class="col-md-12">
                  <label class="text-black" for="email">Email</label> 
                  <input type="email" name="email" id="email" class="form-control">
                </div>
              </div>

              <div class="row form-group">

                <div class="col-md-12">
                  <label class="text-black" for="subject">主題</label> 
                  <input type="text" name="subject" id="subject" class="form-control">
                </div>
              </div>

              <div class="row form-group">
                <div class="col-md-12">
                  <label class="text-black" for="message">訊息</label> 
                  <textarea name="message" id="message" cols="30" rows="7" class="form-control" placeholder="Write your notes or questions here..."></textarea>
                </div>
              </div>

              <div class="row form-group">
                <div class="col-md-12">
                  <input type="button" id="button" value="提交" class="btn btn-primary text-white">
                  <input type="button" id="input" value="一鍵輸入" class="btn btn-secondary text-white">
                </div>
              </div>


            </form>
          </div>
          <div class="col-lg-3 ml-auto">
            <div class="mb-3">
              <p class="mb-0 font-weight-bold text-black">聯絡地址</p>
              <p class="mb-4">台北市大安區復興南路二段234號</p>

              <p class="mb-0 font-weight-bold text-black">聯絡電話</p>
              <p class="mb-4"><a href="#">02-8790-6146</a></p>

              <p class="mb-0 font-weight-bold text-black">Email</p>
              <p class="mb-0">iiieeit12907@gmail.com</p>

            </div>

          </div>
        </div>
      </div>
    </div>
  
  
  
    <!-- Footer -->

   <%@ include file="/WEB-INF/pages/user-site-footer.jsp"%>
   
  </div> <!-- .site-wrap -->

  <%@ include file="/WEB-INF/pages/user-js.jsp"%>
  
<script>
$("#button").click(function(){
	if ($.trim($("#lname").val()) == "" || $.trim($("#fname").val()) =="" || $.trim($("#email").val()) ==""
		|| $.trim($("#subject").val()) =="" || $.trim($("#message").val()) ==""){

		Swal.fire({
			  icon: 'error',
			  title: 'Oops...',
			  text: '請填選所有欄位!',
			})
	}
	
	else {
		$("#submit").submit();
	}
});



/* 一鍵輸入的資料 */
$("#input").click(function(){
	$("#lname").val("田");
	$("#fname").val("婉貞");
	$("#email").val("eddie47@gmail.com");
	$("#subject").val("營養餐訂購");
	$("#message").val("請問能客製化餐點嗎?");
})
</script>
</body>
</html>