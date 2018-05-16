<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="../js/httpRequest.js"></script>
<script>
	function del(idx) {
		
		if (confirm('회원을 지우시겠습니까?') == false) { 
			return;
		}
		
		let url = "delete.do";
		let param = "idx=" + encodeURIComponent(idx);
		sendRequest(url, param, result, "POST");

	}
	function result () {
		console.log(xhr.readyState + " / " + xhr.status);
		if(xhr.readyState == 4 && xhr.status == 200) {
			alert('삭제성공');	
			location.href = "member_list.do";
		}
	}
</script>
<style>
	table {
		border-collapse: collapse;
		text-align: center;
	}
	caption {
		font: bold 1.2em sans-serif;
	}
</style>
</head>
<body>
	
	<table border="1">
		<caption>:::회원목록:::</caption>
		<tr>
			<td colspan="7">
				<input type="button" value="회원가입" onclick="location.href='member_insert_form.jsp'">
			</td>
		</tr>
		<tr>
			<th>번호</th>
			<th>이름</th>
			<th>아이디</th>
			<th>비밀번호</th>
			<th>이메일</th>
			<th>주소</th>
			<th>비고</th>
		</tr>
		<c:forEach var="vo" items="${list}">
			<tr>
				<td>${vo.idx}</td>
				<td>${vo.name}</td>
				<td>${vo.id}</td>
				<td>${vo.pwd}</td>
				<td>${vo.email}</td>
				<td>${vo.addr}</td>
				<td><input type="button" value="삭제" onclick="del('${vo.idx}')"></td>
			</tr>
		</c:forEach>
	</table>
	
</body>
</html>