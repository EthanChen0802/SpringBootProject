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
            
            <h4>我們已收到您的來信，將會盡速與您聯繫</h4>
            <p>We have received your email, and will contact you as soon as possible</p>
           	<img src="${pageContext.request.contextPath}/images/Thanks.jpg" style="width:300px"/>
          </div>
          
          
          <div class="col-lg-3 ml-auto">
            <div class="mb-3">
              <p class="mb-0 font-weight-bold text-black">聯絡地址</p>
              <p class="mb-4">台北市大安區復興南路二段234號</p>

              <p class="mb-0 font-weight-bold text-black">聯絡電話</p>
              <p class="mb-4"><a href="#">02-8790-6146</a></p>

              <p class="mb-0 font-weight-bold text-black">Email</p>
              <p class="mb-0">youremail@domain.com</p>

            </div>

          </div>
        </div>
      </div>
    </div>
  
  
  
  <!-- Footer -->

  <%@ include file="/WEB-INF/pages/user-site-footer.jsp"%>

  </div> <!-- .site-wrap -->

  <%@ include file="/WEB-INF/pages/user-js.jsp"%>
  
</body>
</html>