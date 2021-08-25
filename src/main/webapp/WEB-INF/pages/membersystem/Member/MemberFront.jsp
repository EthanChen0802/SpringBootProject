<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>健康優生網</title>
</head>
<body>
	<div>
		<table>
			<tr>
				<td>被看護人姓名:</td>
				<td>${member.membername}</td>
			</tr>
			<tr>
				<td>性別:</td>
				<td>${member.membergender}</td>
			</tr>
			<tr>
				<td>出生日期:</td>
				<td>民國 ${member.memberyear} 年 ${member.membermonth} 月 ${member.memberday} 日</td>
			</tr>
			<tr>
				<td>帳號:</td>
				<td>${member.memberaccount}</td>
			</tr>
			<tr>
				<td>密碼:</td>
				<td>${member.memberpwd}</td>
			</tr>
			<tr>
				<td>E-mail:</td>
				<td>${member.memberemail}</td>
			</tr>
			<tr>
				<td>手機:</td>
				<td>${member.memberphone}</td>
			</tr>
			<tr>
				<td>被看護人居住地址:</td>
				<td>${member.membercity}${member.membertown}${member.memberaddress}</td>
			</tr>
			<tr>
				<td>身心障礙手冊/證明:</td>
				<td>${member.handbook}</td>
			</tr>
			<tr>
				<td>失智症確診:</td>
				<td>${member.dementia}</td>
			</tr>
			<tr>
				<td>大頭照:</td>
				<td>
					<img src="${pageContext.request.contextPath}/MemberPhoto/${member.memberphoto}"onerror="this.style.display='none'" width="200px" height="200px">
				</td>
			</tr>
			<tr>
				<td>
					<a href="/Member/updateMember">修改個人資料</a>
				</td>
				<td>
					<a href="/Member/updateMemberAP">修改密碼</a>
				</td>
				<td>
					<a href="/Member/HealthProject">返回首頁</a>
				</td>
			</tr>
		</table>
	</div>
</body>
</html>