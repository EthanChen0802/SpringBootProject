<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>

<html lang="en">
<head>
<meta charset="utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<title>健康優生網</title>

<%@ include file="/WEB-INF/pages/css.jsp"%>
</head>


<body class="sb-nav-fixed">
<%@ include file="/WEB-INF/pages/left-top-bar.jsp"%>

		<div id="layoutSidenav_content">
			<main>
				<div class="container-fluid px-4">
					<h1 class="mt-4">輔具管理系統</h1>


					<div class="card mb-4">
						<div class="card-header">
							<i class="fas fa-table me-1"></i> 輔具資料
						</div>
						<div class="card-body">


							<div class="row">

								<div class="col-md-6">
									<form:form action="save" modelAttribute="equip"
										method="post" enctype="multipart/form-data" id="submit">

										<form:hidden path="id" />
										<form:hidden path="photo" />

										<table class="table table-hover">
											<thead>
												<tr>
													<th>欄位名稱</th>
													<th>欄位資料</th>
												</tr>
											</thead>
											<tbody>
												<tr>
													<td>商品照片</td>
													<td><img src="${pageContext.request.contextPath}/EquipImg/${equip.photo}"
														onerror="this.style.display='none'" width="100px" height="100px" >
													</td>
												</tr>
												<tr>
													<td>上傳預覽</td>
													<td><img id="sourceImage"  width="100px" height="100px"></td>
												</tr>
												<tr>
													<td>新增照片</td>
													<td><input type="file" name="pic" accept="image/*" id="inputImageFile" /></td>
												</tr>

												<tr>
													<td><label>輔具名稱</label></td>
													<td><form:input path="name"/></td>
												</tr>
												<tr>
													<td><label>輔具類型:</label></td>
													<td><form:input path="type"/></td>
												</tr>
												<tr>
													<td><label>輔具販賣商:</label></td>
													<td><form:input path="vendor"/></td>
												</tr>
												<tr>
													<td><label>輔具價格:</label></td>
													<td><form:input path="price"/></td>
												</tr>
												
												<tr>
													<td><label>熱門商品:</label></td>
													<td>
														<c:choose>
															<c:when test="${empty equip.hot}">
																<input type="radio" id="Y" name="hot" value="Y">
																<label for="Y">Yes</label>
																<br>
																<input type="radio" id="N" name="hot" value="N" checked>
																<label for="N">No</label>
															</c:when>
														
															<c:when test="${equip.hot == 'Y'}">
																<input type="radio" id="Y" name="hot" value="Y" checked>
																<label for="Y">Yes</label>
																<br>
																<input type="radio" id="N" name="hot" value="N">
																<label for="N">No</label>
															</c:when>
														
															<c:when test="${equip.hot =='N'}">
																<input type="radio" id="Y" name="hot" value="Y">
																<label for="Y">Yes</label>
																<br>
																<input type="radio" id="N" name="hot" value="N" checked>
																<label for="N">No</label>
															</c:when>
														</c:choose>
													</td>
												
												</tr>
												
												<tr>
													<td><label>衛生署字號:</label></td>
													<td><form:input path="document"/></td>
												</tr>

												<tr>
													<td><label></label></td>
													<td>
														<input type="button" value="提交" id="update" />
														<input type="button" value="一鍵輸入" id="input"/>
													</td>
												</tr>
											
												<tr>
													<td><label></label></td>
													<td><p>
															<a href="${pageContext.request.contextPath}/equip/findall">返回主頁</a>
														</p>
													</td>
												</tr>
											</tbody>
										</table>
									</form:form>
								</div>
								<div class="col-md-6"></div>
							</div>
						</div>
					</div>
				</div>
			</main>
		</div>
		
	<script src="/js/jquery-3.6.0.js"></script>
	<script>
		var submit = document.getElementById("submit")

		document.getElementById("update").onclick = function() {

			setTimeout(function() {
				submit.submit();
			}, 1400);

			Swal.fire({
				position : 'top',
				icon : 'success',
				title : '資料已更新',
				showConfirmButton : false,
				timer : 1500
			})
		}
		
		
		
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
	    
	    
	    
	    /* 一鍵輸入的資料 */
	    $("#input").click(function(){
	    	$("#name").val("視障語音電子體重計");
	    	$("#type").val("個人照護輔具");
	    	$("#vendor").val("日華國際");
	    	$("#price").val("785");
	    	$("#document").val("衛署醫器陸輸壹字第004551號");
	    })
		
	</script>
</body>
</html>
