<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="org.springframework.security.core.*,org.springframework.security.core.context.*"%>
    <header class="site-navbar light js-sticky-header site-navbar-target" role="banner">

      <div class="container">
        <div class="row align-items-center">

          <div class="col-6 col-xl-2">
            <div class="mb-0 site-logo"><a href="${pageContext.request.contextPath}index.html" class="mb-0">Elderly<span class="text-primary">.</span> </a></div>
          </div>

          <div class="col-12 col-md-10 d-none d-xl-block">
            <nav class="site-navigation position-relative text-right" role="navigation">

              <ul class="site-menu main-menu js-clone-nav mr-auto d-none d-lg-block">
                <li><a href="${pageContext.request.contextPath}index.html" class="active nav-link">首頁</a></li>


			  <li class="has-children">
                <a href="services.html" class="nav-link">便利專區</a>
                <ul class="dropdown">
                  <li><a href="/taxiFront/fronttaximainpage.controller" class="nav-link">叫車資訊</a></li>
                  <li><a href="/taxiFront/frontlocmainpage.controller" class="nav-link">尋找附近店家</a></li>
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
                    <li><a href="${pageContext.request.contextPath}/mealIndex.controller" class="nav-link">營養餐</a></li>
                    <li><a href="${pageContext.request.contextPath}/dietIndex.controller" class="nav-link">食品資料</a></li>
                  </ul>
                </li>


                <li class="has-children">
                  <a href="services.html" class="nav-link">用藥查詢</a>
                  <ul class="dropdown">
                    <li><a href="${pageContext.request.contextPath}/Drug/findalldrugFront" class="nav-link">藥品辨識</a></li>
                    <li><a href="${pageContext.request.contextPath}/DrugProductr/findalldrugproductFront" class="nav-link">藥品包裝</a></li>
                  </ul>
                </li>

<!--                 <li><a href="about.html" class="nav-link">關於我們</a></li> -->
                <li><a href="${pageContext.request.contextPath}/contact" class="nav-link">聯絡我們</a></li>
                
                <!-- <li><a href="contact.html" class="nav-link">會員登入</a></li> -->
<%
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        if (auth != null) {
%>
               <li class="has-children">
                  <a href="/Member/searchOneMemberAction.controller" class="nav-link">歡迎您，${member.membername}</a>
                  <ul class="dropdown">
                   <li class="has-children">
                      <a href="#">會員專區</a>
                      <ul class="dropdown">
                        <li><a href="/Member/searchOneMemberAction.controller">會員個人資料</a></li>
                        <li><a href="/Member/logout">會員登出</a></li>
                        <li><a href="/HealthProject/insertMember">會員註冊</a></li>
                      </ul>
                    </li>
                    <li class="has-children">
                      <a href="#">廠商專區</a>
                      <ul class="dropdown">
                        <li><a href="#">廠商登入</a></li>
                        <li><a href="#">廠商註冊</a></li>
<%
        }else{
%>
        
               <li class="has-children">
                  <a href="#" class="nav-link">登入</a>
                  <ul class="dropdown">
                   <li class="has-children">
                      <a href="#">會員專區</a>
                      <ul class="dropdown">
                        <li><a href="/Member/login">會員登入</a></li>
                        <li><a href="/HealthProject/insertMember">會員註冊</a></li>
                      </ul>
                    </li>
                    <li class="has-children">
                      <a href="#">廠商專區</a>
                      <ul class="dropdown">
                        <li><a href="#">廠商登入</a></li>
                        <li><a href="#">廠商註冊</a></li>
                      </ul>
                    </li>
                  </ul>
                </li>
<%
        }
%>
              </ul>

            </nav>
          </div>


          <div class="col-6 d-inline-block d-xl-none ml-md-0 py-3" style="position: relative; top: 3px;"><a href="#" class="site-menu-toggle js-menu-toggle float-right"><span class="icon-menu h3 text-white"></span></a></div>

        </div>
      </div>

    </header>