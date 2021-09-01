<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <!-- Required meta tags-->
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="Colorlib Templates">
    <meta name="author" content="Colorlib">
    <meta name="keywords" content="Colorlib Templates">

    <!-- Title Page-->
    <title>健康優生網</title>


</head>

<body>
        <div class="wrapper wrapper--w790">
            <div class="card card-5">
                <div class="card-heading">
                    <h2 class="title">會員註冊</h2>
                </div>
                <div class="card-body">
                
                <form:form id="form1" method="POST" action="/HealthProject/displayInsertMember" modelAttribute="member" enctype="multipart/form-data" onsubmit="return checkSubBtn();">
                       
                       
                       <!-- 被看護人姓名 -->
                        <div class="form-row">
                            <div class="name">
                            	<form:label path="membername">被看護人姓名</form:label>
                            </div>
                            <div class="value">
                                <div class="input-group">
                                <form:input path="membername" class="input--style-5" size="10"/>
                                </div>
                            </div>
                        </div>
                        
                        
                        <!-- 性別 -->
                        <div class="form-row p-t-20">
                       		<form:label class="label label--block" path="membergender">性別</form:label>
                            <div class="p-t-15">
                                <label class="radio-container m-r-55">
                                	<form:radiobutton path="membergender" value="男" label="男" />
                                    <span class="checkmark"></span>
                                </label>
                                <label class="radio-container m-r-55">
                                    <form:radiobutton path="membergender" value="女" label="女" />
                                    <span class="checkmark"></span>
                                </label>
                                 <label class="radio-container m-r-55">
                                    <form:radiobutton path="membergender" value="其他" label="其他" />
                                    <span class="checkmark"></span>
                                </label>
                                    <span id="genderCheck"></span>
                            </div>
                        </div>
                        
                        
						<!-- 生日日期 -->
                        <div class="form-row m-b-55">
                            <div class="name">
                           		<form:label path="memberyear">生日日期</form:label>
                            </div>
                            <div class="value">
                                <div class="row row-space">
                                    <div class="col-3">
                                        <div class="input-group-desc">
                                        	<form:input class="input--style-5" path="memberyear" placeholder="70" />
                                            <label class="label--desc">民國年</label>
                                        </div>
                                    </div>
                                    <div class="col-3">
                                        <div class="input-group-desc">
                                        	<form:input class="input--style-5" path="membermonth" placeholder="7" />
                                            <label class="label--desc">月</label>
                                        </div>
                                    </div>
                                    <div class="col-3">
                                        <div class="input-group-desc">
                                        	<form:input class="input--style-5" path="membermonth" placeholder="7" />
                                            <label class="label--desc">日</label>
                                        </div>
                                    </div>
                                    <span id="birthCheck"></span>
                                </div>
                            </div>
                        </div>
                        
                        
                        <!-- 帳號 -->
                        <div class="form-row">
                        <div class="name">
                        	<form:label path="memberaccount">帳號</form:label>
                        </div>
                            <div class="value">
                                <div class="input-group">
                                	<form:input path="memberaccount" class="input--style-5"/>
                                    <span id="accountCheck"></span>
                                </div>
                            </div>
                        </div>
                        
                        
                        <!-- 密碼 -->
                        <div class="form-row">
                        <div class="name">
                        	<form:label path="memberpwd">密碼</form:label>
                        </div>
                            <div class="value">
                                <div class="input-group">
                                	<form:password path="memberpwd" class="input--style-5"/>
                                    <span id="pwd1Check"></span>
                                     <label class="radio-container m-r-55">
                                	<input type="checkbox" id="showPwd" />顯示密碼
                                    <span class="checkmark"></span>
                                </label>
                                </div>
                            </div>
                        </div>
									
                        
                        <!-- 確認密碼 -->
                        <div class="form-row">
                        <div class="name">
                        	<label id="pwd2">確認密碼</label>
                        </div>
                            <div class="value">
                                <div class="input-group">
                                	<input type="password" id="pwd2" class="input--style-5"/>
                                    <span id="pwd2Check"></span>
                                </div>
                            </div>
                        </div>
                        
                        
                        <!-- E-mail -->
                        <div class="form-row">
                            <div class="name">
                            	<form:label path="memberemail">E-mail</form:label>
                            </div>
                            <div class="value">
                                <div class="input-group">
                                	<form:input path="memberemail" class="input--style-5" placeholder="aaa@gmail.com" />
                                	<span id="emailCheck"></span>
                                </div>
                            </div>
                        </div>
                        
                        
                        <!-- 手機 -->
                        <div class="form-row">
                            <div class="name">
                            	<form:label path="memberphone">手機</form:label>
                            </div>
                            <div class="value">
                                <div class="input-group">
                                	<form:input path="memberphone" class="input--style-5"/>
                                	<span id="phoneCheck"></span>
                                </div>
                            </div>
                        </div>



					<div class="form-row">
						<div class="name">
							<form:label path="membercity">居住縣市:</form:label>
						</div>
						<div class="value">
							<div class="input-group">
								<div class="rs-select2 js-select-simple select--no-search">
									<form:select path="membercity"></form:select>
									<span id="idsp4"></span>
									<div class="select-dropdown"></div>
								</div>
							</div>
						</div>
					</div>



					<div class="form-row">
						<div class="name">
							<form:label path="membertown">鄉鎮市區:</form:label>
						</div>
						<div class="value">
							<div class="input-group">
								<div class="rs-select2 js-select-simple select--no-search">
									<form:select path="membertown">
										<option value=0>請選擇</option>
									</form:select>
									<span id="idsp5"></span>
									<div class="select-dropdown"></div>
								</div>
							</div>
						</div>
					</div>


                        <!-- 居住地址 -->
                        <div class="form-row">
                            <div class="name">
                            	<form:label path="memberaddress">居住地址</form:label>
                            </div>
                            <div class="value">
                                <div class="input-group">
                                	<form:input path="memberaddress" class="input--style-5"/>
                                	<span id="idsp6"></span>
                                </div>
                            </div>
                        </div>


					<!-- 身心障礙手冊/證明 -->
					<div class="form-row">
                            <div class="name"><form:label path="handbook">身心障礙手冊/證明</form:label></div>
                            <div class="value">
                                <div class="input-group">
                                    <div class="rs-select2 js-select-simple select--no-search">
                                        <form:select path="handbook">
                                        <form:option value="-1" label="--請選擇--" />
											<form:options items="${handbookOption}" />
										</form:select>
										<span id="idsp2"></span>
                                        <div class="select-dropdown"></div>
                                    </div>
                                </div>
                            </div>
                        </div>


                        <!-- 失智症確診 -->
                        <div class="form-row p-t-20">
                       		<form:label class="label label--block" path="dementia">失智症確診</form:label>
                            <div class="p-t-15">
                                <label class="radio-container m-r-55">
                                	<form:radiobutton path="dementia" value="有" label="有" />
                                    <span class="checkmark"></span>
                                </label>
                                <label class="radio-container m-r-55">
                                    <form:radiobutton path="dementia" value="無" label="無" />
                                    <span class="checkmark"></span>
                                </label>
                            </div>
                        </div>
                        
                        
                        <!-- 大頭照預覽 -->
                        <div class="form-row">
                        <div class="name">
                        	大頭照預覽
                        </div>
                            <div class="value">
                                <div class="input-group">
                                	<img id="sourceImage"  width="200px" height="200px">
                                </div>
                            </div>
                        </div>
                        
                        
                        <!-- 新增大頭照 -->
                        <div class="form-row">
                        <div class="name">
                        	新增大頭照
                        </div>
                            <div class="value">
                                <div class="input-group">
                                	<input type="file" name="memberphoto" accept="image/*" id="inputImageFile" />
									<form:hidden path="memberphoto" />
                                </div>
                            </div>
                        </div>


                    </form:form>
                        <div style="display: inline-block;">
                            <button class="btn btn--radius-2 btn--red" type="submit" id="btn">送出</button>
						</div>
						<div style="display: inline-block;">
							<form action="/HealthProject" method="post">
								<button class="btn btn--radius-2 btn--red" type="submit" id="btn">取消</button>
							</form>
						</div>
                </div>
            </div>
        </div>
        
        
        <script type="text/javascript">

var cn = "${member.membercity}"
	var tn = "${member.membertown}"
		
	$(document).ready(function(){
		$.getJSON('/json/taiwan_districts.json',function(data){
			var resultText='';
			resultText="<option value=0>請選擇</option>";
			for(var i=0; i<data.length; i++){
				if(cn == (data[i].name)){
					resultText+="<option value='"+data[i].name+"' selected>"+data[i].name+"</option>"
				}else{
					resultText+="<option value='"+data[i].name+"'>"+data[i].name+"</option>"
				}
			}
			$("#membercity").html(resultText);
			let CN=$("select[name='membercity']").val();		
			for(n=0; n<data.length; n++ ){
    			if(CN == data[n].name){
    				var resultText2='';
    				for(var j=0; j<data[n].districts.length; j++){
    					if(tn == data[n].districts[j].name){
    						resultText2+="<option value='"+data[n].districts[j].name+"' selected>"+data[n].districts[j].name+"</option>"
    					}else{
    						resultText2+="<option value='"+data[n].districts[j].name+"'>"+data[n].districts[j].name+"</option>"
    					}
    				}
    			}
    		}	
			$("#membertown").html(resultText2);
		});
	$("select[name='membercity']").on('change',function(){
		$.getJSON('/json/taiwan_districts.json',function(data){	
			let CN=$("select[name='membercity']").val();		
			for(n=0; n<data.length; n++ ){
    			if(CN == data[n].name){
    				var resultText2='';
    				for(var j=0; j<data[n].districts.length; j++){
    					resultText2+="<option value='"+data[n].districts[j].name+"'>"+data[n].districts[j].name+"</option>"
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
       
       
       
        
        

<!--     Jquery JS -->
<%--     <script src="${pageContext.request.contextPath}/memberInsert/vendor/jquery/jquery.min.js"></script> --%>
<!--     Vendor JS -->
<%--     <script src="${pageContext.request.contextPath}/memberInsert/vendor/select2/select2.min.js"></script> --%>
<%--     <script src="${pageContext.request.contextPath}/memberInsert/vendor/datepicker/moment.min.js"></script> --%>
<%--     <script src="${pageContext.request.contextPath}/memberInsert/vendor/datepicker/daterangepicker.js"></script> --%>

<!--     Main JS -->
<%--     <script src="${pageContext.request.contextPath}/memberInsert/js/global.js"></script> --%>

</body>

</html>
