<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
	<title>健康悠生網</title>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
<!--===============================================================================================-->	
	<link rel="icon" type="image/png" href="${pageContext.request.contextPath}/login1/images/icons/favicon.ico"/>
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/login1/vendor/bootstrap/css/bootstrap.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/login1/fonts/font-awesome-4.7.0/css/font-awesome.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/login1/fonts/Linearicons-Free-v1.0.0/icon-font.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/login1/vendor/animate/animate.css">
<!--===============================================================================================-->	
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/login1/vendor/css-hamburgers/hamburgers.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/login1/vendor/animsition/css/animsition.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/login1/vendor/select2/select2.min.css">
<!--===============================================================================================-->	
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/login1/vendor/daterangepicker/daterangepicker.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/login1/css/util.css">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/login1/css/main.css">
<!--===============================================================================================-->

<script src="https://code.jquery.com/jquery-3.6.0.js"></script>

</head>
<body>
	
	<div class="limiter">
		<div class="container-login100">
			<div class="wrap-login100 p-l-85 p-r-85 p-t-55 p-b-55">
				<form action="/iiiHealth/login" method="post" id="form1" class="login100-form validate-form flex-sb flex-w">
					<span class="login100-form-title p-b-32">
						管理者登入
					</span>

					<span class="txt1 p-b-11">
						帳號
					</span>
					<div class="wrap-input100 validate-input m-b-36" data-validate = "Username is required">
						<input class="input100" type="text" id="account1" name="username" >
						<span class="focus-input100"></span>
					</div>
					
					<span class="txt1 p-b-11">
						密碼
					</span>
					<div class="wrap-input100 validate-input m-b-12" data-validate = "Password is required">
						<span class="btn-show-pass">
							<i class="fa fa-eye"></i>
						</span>
						<input class="input100" type="password" id="pwd1" name="password" >
						<span class="focus-input100"></span>
					</div>
					
					<div class="flex-sb-m w-full p-b-48">
						<div class="contact100-form-checkbox">
							<input class="input-checkbox100" id="ckb1" type="checkbox" name="remember-me">
							<label class="label-checkbox100" for="ckb1">
								記住我
							</label>
						</div>

						<div>
<!-- 							<a href="#" class="txt3"> -->
<!-- 								忘記密碼? -->
<!-- 							</a><br> -->
					<a class="txt1" id="onekey" href="#">紀岱昀/林昱伸</a><br>
					<a class="txt1" id="twokey" href="#">林羽墨/陳厚丞</a><br>
					<a class="txt1" id="threekey" href="#">陳宥芸</a>
						</div>
					</div>

					<div class="container-login100-form-btn">
						<button type="submit" class="login100-form-btn" id="subBtn" name="sublogin">
							登入
						</button>
					</div>
				</form>
			</div>
		</div>
	</div>
	

	<div id="dropDownSelect1"></div>
	
	
	

<script type="text/javascript">
//一鍵輸入
$('#onekey').on('click', function(){
	$('#account1').val('eeit12901');
	$('#pwd1').val('password01');
}).on('dblclick', function(){
	$('#account1').val('eeit12902');
	$('#pwd1').val('password02');
})

//一鍵輸入
$('#twokey').on('click', function(){
	$('#account1').val('eeit12903');
	$('#pwd1').val('password03');
}).on('dblclick', function(){
	$('#account1').val('eeit12904');
	$('#pwd1').val('password04');
})

//一鍵輸入
$('#threekey').on('click', function(){
	$('#account1').val('eeit12905');
	$('#pwd1').val('password05');
})
</script>	
	
	
	
<!--===============================================================================================-->
	<script src="${pageContext.request.contextPath}/login1/vendor/jquery/jquery-3.2.1.min.js"></script>
<!--===============================================================================================-->
	<script src="${pageContext.request.contextPath}/login1/vendor/animsition/js/animsition.min.js"></script>
<!--===============================================================================================-->
	<script src="${pageContext.request.contextPath}/login1/vendor/bootstrap/js/popper.js"></script>
	<script src="${pageContext.request.contextPath}/login1/vendor/bootstrap/js/bootstrap.min.js"></script>
<!--===============================================================================================-->
	<script src="${pageContext.request.contextPath}/login1/vendor/select2/select2.min.js"></script>
<!--===============================================================================================-->
	<script src="${pageContext.request.contextPath}/login1/vendor/daterangepicker/moment.min.js"></script>
	<script src="${pageContext.request.contextPath}/login1/vendor/daterangepicker/daterangepicker.js"></script>
<!--===============================================================================================-->
	<script src="${pageContext.request.contextPath}/login1/vendor/countdowntime/countdowntime.js"></script>
<!--===============================================================================================-->
	<script src="${pageContext.request.contextPath}/login1/js/main.js"></script>

</body>
</html>