<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>

<html>
<head>
<meta charset="utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<title>健康優生網</title>

<script src="../js/jquery-3.6.0.js"></script>

<%@ include file="/WEB-INF/pages/user-css-js.jsp"%>
</head>

<body data-spy="scroll" data-target=".site-navbar-target" data-offset="300">

<%@ include file="/WEB-INF/pages/user-header.jsp"%>



  <!-- 老人圖 -->

    <div class="slide-item overlay" style="background-image: url('${pageContext.request.contextPath}/images/slider-1.jpg')">
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



	<!-- 表單 -->
	
		<div id="layoutSidenav_content">
			<main>
				<div class="card mb-4">
					<div class="card-header">
						<i class="fas fa-table me-1"></i> 會員系統
						</div>
						<div class="row">
							
							<div class="col-md-6">
								<h2 style="margin: 8px 150px">修改密碼</h2>
								<div class="card-body">
										<table class="table  table-hover">
									<form:form method="POST" action="/Member/displayUpdateMemberAP" modelAttribute="member" enctype="multipart/form-data">
											<tr>
												<td><form:label path="memberaccount">帳號:</form:label></td>
												<td>
													<form:hidden path="memberid" value="${member.memberid}" />
													<form:hidden path="verificationCode" value="${member.verificationCode}" />
													<form:hidden path="role" value="${member.role}" />
													<form:hidden path="disabled" value="${member.disabled}" />
													<form:hidden path="accountExpired" value="${member.accountExpired}" />
													<form:hidden path="accountLocked" value="${member.accountLocked}" />
													<form:hidden path="credentialsExpired" value="${member.credentialsExpired}" />
													<form:hidden path="membername" value="${member.membername}" />
													<form:hidden path="membergender" value="${member.membergender}" />
													<form:hidden path="memberyear" value="${member.memberyear}" />
													<form:hidden path="membermonth" value="${member.membermonth}" />
													<form:hidden path="memberday" value="${member.memberday}" />
													<form:hidden path="memberemail" value="${member.memberemail}" />
													<form:hidden path="memberphone" value="${member.memberphone}" />
													<form:hidden path="membercity" value="${member.membercity}" />
													<form:hidden path="membertown" value="${member.membertown}" />
													<form:hidden path="memberaddress" value="${member.memberaddress}" />
													<form:hidden path="handbook" value="${member.handbook}" />
													<form:hidden path="dementia" value="${member.dementia}" />
													<form:hidden path="memberphoto" value="${member.memberphoto}" />
													<form:input path="memberaccount" maxlength="15" size="15" />
													<span id="accountCheck"></span>
												</td>
											</tr>
											<tr>
												<td><form:label path="memberpwd">密碼:</form:label></td>
												<td>
													<form:password path="memberpwd" maxlength="15" size="15" />
													<span id="pwd1Check"></span><br>
													<input type="checkbox" id="showPwd" />顯示密碼
												</td>
											</tr>
											<tr>
												<td>確認密碼:</td>
												<td>
													<input type="password" id="pwd2" maxlength="15" size="15" />
													<span id="pwd2Check"></span>
												</td>
											</tr>
											<tr>
												<td style="text-align: center">
													<input type="submit" class="btn" style="font-size:20px;" value="送出" />
												</td>
									</form:form>
												<td>
													<form action="/Member/searchOneMemberAction.controller" method="post">
														<input type="submit" class="btn" style="font-size:20px;" value="取消">
													</form>
												</td>
											</tr>
										</table>
								</div>
								<div class="col-md-6"></div>
							</div>
						</div>
					</div>
			</main>
		</div>
		
		
<%@ include file="/WEB-INF/pages/user-site-footer.jsp"%>
<%@ include file="/WEB-INF/pages/user-js.jsp"%>


		<script type="text/javascript">
	$(document).ready(function(){
		$.getJSON('/json/taiwan_districts.json',function(data){
			var resultText='';
			resultText="<option value=0>請選擇</option>";
			for(var i=0; i<data.length; i++){
				resultText+="<option value='"+data[i].name+"'/>"+data[i].name
			}
			
			$("#membercity").html(resultText);
		});

	$("select[name='membercity']").on('change',function(){
		$.getJSON('/json/taiwan_districts.json',function(data){	
			let CN=$("select[name='membercity']").val();		
			for(n=0; n<data.length; n++ ){
    			if(CN == data[n].name){
    				var resultText2='';
    				for(var j=0; j<data[n].districts.length; j++){
    					resultText2+="<option value='"+data[n].districts[j].name+"'/>"+data[n].districts[j].name
    				}
    							    				
    			}
    		}	
			$("#membertown").html(resultText2);
		});		
	});
	
	});
	
	
	/* 更新圖片 or 上傳圖片 */
    $("#inputImageFile").change(function(e){
    	processImageFile(e.target.files[0]);
	});
    
    
    function processImageFile(imageObject) {
        //顯示分析的圖片
        var sourceImageUrl = URL.createObjectURL(imageObject);
        //document.querySelector("#sourceImage").src = sourceImageUrl;
        $("#sourceImage").attr('src', sourceImageUrl);
    }
	
</script>
		<script>
		
	    //顯示密碼
	    document.getElementById("showPwd").onclick=showPwd;
	        function showPwd(){
	            let pwdType=document.getElementById("memberpwd").type;
	            //pwdType現在是密碼的話，就轉成文字顯示
	            if(pwdType === "password"){
	                document.getElementById("memberpwd").type="text";
	                document.getElementById("pwd2").type="text";
	                //pwdType現在是文字的話，就轉回密碼來不顯示
	            }else{
	                document.getElementById("memberpwd").type="password";
	                document.getElementById("pwd2").type="password";
	            }
	        }
	
	        </script>
</body>
</html>