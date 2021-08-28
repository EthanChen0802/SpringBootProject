<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<title>健康悠生網</title>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
<!--===============================================================================================-->	
	<link rel="icon" type="image/png" href="${pageContext.request.contextPath}/login/images/icons/favicon.ico"/>
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/login/vendor/bootstrap/css/bootstrap.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/login/fonts/font-awesome-4.7.0/css/font-awesome.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/login/fonts/Linearicons-Free-v1.0.0/icon-font.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/login/vendor/animate/animate.css">
<!--===============================================================================================-->	
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/login/vendor/css-hamburgers/hamburgers.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/login/vendor/animsition/css/animsition.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/login/vendor/select2/select2.min.css">
<!--===============================================================================================-->	
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/login/vendor/daterangepicker/daterangepicker.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/login/css/util.css">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/login/css/main.css">
<!--===============================================================================================-->
</head>
<body style="background-color: #666666;">
	
	<div class="limiter">
		<div class="container-login100">
			<div class="wrap-login100">
				<form action="/Member/login" method="post" id="form1" class="login100-form validate-form" onsubmit="return checkSubBtn();">
					<span class="login100-form-title p-b-43">
						會員登入
					</span>
					
					
					<span style="color: red;" id="acntCheck"></span>
					<div class="wrap-input100 validate-input">
						<input class="input100" type="text" id="account1" name="username">
						<span class="focus-input100"></span>
						<span class="label-input100">帳號</span>
					</div>
					
					
					<span style="color: red;" id="pwd1Check"></span>
					<div class="wrap-input100 validate-input">
						<input class="input100" type="password" id="pwd1" name="password">
						<span class="focus-input100"></span>
						<span class="label-input100">密碼</span>
					</div>
					
						<div class="contact100-form-checkbox">
							<input class="input-checkbox100" id="showPwd" type="checkbox" name="remember-me">
							<label class="label-checkbox100" for="showPwd">
								顯示密碼
							</label>
						</div>
						

					<div class="flex-sb-m w-full p-t-3 p-b-32">
						<div class="contact100-form-checkbox">
							<input class="input-checkbox100" id="ckb1" type="checkbox" name="remember-me">
							<label class="label-checkbox100" for="ckb1">
								記住我
							</label>
						</div>

						<div>
							<a href="#" class="txt1">
								忘記密碼?
							</a>
						</div>
					</div>
			

					<div class="container-login100-form-btn">
						<button type="submit" class="login100-form-btn" id="subBtn" name="sublogin">
							登入
						</button>
					</div>
					
					<div class="text-center p-t-46 p-b-20">
						<span class="txt2">
							沒有帳戶?<a class="txt1" href="/HealthProject/insertMember">點此註冊</a>
						</span>
						<div class="text-center p-t-46 p-b-20">
							<span class="txt2">
								<a class="txt1" href="/HealthProject/">返回首頁</a>
							</span>
						</div>
					</div>
				
				</form>

				<div class="login100-more" style="background-image: url('${pageContext.request.contextPath}/login/images/login_elder.jpg');">
				</div>
			</div>
		</div>
	</div>
	
	

	<script>
    let acntCheck = document.getElementById("acntCheck");
    let pwd1Check = document.getElementById("pwd1Check");
    document.getElementById("subBtn").onclick = checkSubBtn;

    let flagSubmit1 = true;
    let flagSubmit2 = true;
    //account1
    function checkAccount() {
        flagSubmit1 = true;
        let acntObj = document.getElementById("account1");
        let acntValue = acntObj.value;
        let acntLen = acntValue.length;
        let flag1 = false, flag2 = false;

        if (acntLen == "") {
            acntCheck.innerHTML = "帳號不能為空";
            flagSubmit1 = false;
        }else{
        	acntCheck.innerHTML = "";
        	flagSubmit1 = true;
        }
    }

    //pwd1
    function checkPwd1() {
        flagSubmit2 = true
        let pwd1Obj = document.getElementById("pwd1");
        let pwd1Value = pwd1Obj.value;
        let pwd1Len = pwd1Value.length;
        let flag1 = false, flag2 = false;

        if (pwd1Len == "") {
            pwd1Check.innerHTML = "密碼不能為空";
            flagSubmit2 = false;
        } else{
        	pwd1Check.innerHTML = "";
        	flagSubmit2 = true;
        }
    }

    //顯示密碼
    document.getElementById("showPwd").onclick = showPwd;
    function showPwd() {
        let pwdType = document.getElementById("pwd1").type;
        //pwdType現在是密碼的話，就轉成文字顯示
        if (pwdType === "password") {
            document.getElementById("pwd1").type = "text";
            //pwdType現在是文字的話，就轉回密碼來不顯示
        } else {
            document.getElementById("pwd1").type = "password";
        }
    }

    //checkSubBtn
    function checkSubBtn() {
        checkAccount();
        checkPwd1();

        if (flagSubmit1 == false || flagSubmit2 == false) {
            return false;
        } else {
            return true;
        }

    }
    </script>
	
	
	
<!--===============================================================================================-->
	<script src="${pageContext.request.contextPath}/login/vendor/jquery/jquery-3.2.1.min.js"></script>
<!--===============================================================================================-->
	<script src="${pageContext.request.contextPath}/login/vendor/animsition/js/animsition.min.js"></script>
<!--===============================================================================================-->
	<script src="${pageContext.request.contextPath}/login/vendor/bootstrap/js/popper.js"></script>
	<script src="${pageContext.request.contextPath}/login/vendor/bootstrap/js/bootstrap.min.js"></script>
<!--===============================================================================================-->
	<script src="${pageContext.request.contextPath}/login/vendor/select2/select2.min.js"></script>
<!--===============================================================================================-->
	<script src="${pageContext.request.contextPath}/login/vendor/daterangepicker/moment.min.js"></script>
	<script src="${pageContext.request.contextPath}/login/vendor/daterangepicker/daterangepicker.js"></script>
<!--===============================================================================================-->
	<script src="${pageContext.request.contextPath}/login/vendor/countdowntime/countdowntime.js"></script>
<!--===============================================================================================-->
	<script src="${pageContext.request.contextPath}/login/js/main.js"></script>

</body>
</html>