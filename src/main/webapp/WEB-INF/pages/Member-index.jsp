<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!-- 會員資料索引 -->
	
<div class="sort btn-group-vertical" style="width:210px; line-height:50px; float:left;">
	<span class="btn btn-dark btn-lg" style="font-size:20px; display: flex; align-items: center;"  class="btn btn-outline-secondary btn-lg">會員資料索引</span>
	<a class="btn btn-outline-secondary btn-lg" style="font-size:20px; display: flex; align-items: center;" href="/Member/updateMember">修改個人資料</a>
	<a class="btn btn-outline-secondary btn-lg" style="font-size:20px; display: flex; align-items: center;" href="/Member/updateMemberAP">修改密碼</a>
	<a class="btn btn-outline-secondary btn-lg" style="font-size:20px; display: flex; align-items: center;" href="/Member/gotoHealth">健康資料表</a>
	<a class="btn btn-outline-secondary btn-lg" style="font-size:20px; display: flex; align-items: center;" href="${pageContext.request.contextPath}/cart/showcollect">輔具收藏品項</a>
	<a class="btn btn-outline-secondary btn-lg" style="font-size:20px; display: flex; align-items: center;" href="${pageContext.request.contextPath}/cart/order">輔具訂單紀錄</a>
	<a class="btn btn-outline-secondary btn-lg" style="font-size:20px; display: flex; align-items: center;" href="${pageContext.request.contextPath}/taxiFront/booktaxi/searchbooking">預約叫車訂單</a>
	<a class="btn btn-outline-secondary btn-lg" style="font-size:20px; display: flex; align-items: center;" href="${pageContext.request.contextPath}/taxiFront/booktaxi/loccollect">店家收藏</a>
	<a class="btn btn-outline-secondary btn-lg" style="font-size:20px; display: flex; align-items: center;" href="${pageContext.request.contextPath}/comment/commentfront">會員留言</a>
</div>