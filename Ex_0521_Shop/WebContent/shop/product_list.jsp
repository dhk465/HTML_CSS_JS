<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script>
	function register() {
		location.href="insert_form.do";
	}
</script>
<style>
	table {
		border: 1px solid #000;
		border-collapse: collapse;
	}
	.reg {
		width: 600px;
		align: center;
		text-align: right;
		margin: auto;
		margin-bottom: 6px;
	}
</style>
</head>
<body>
	<jsp:include page="index.jsp"></jsp:include>
	
	<div class="reg">
		<input id="reg" type="button" value="상품등록" onclick="register();">
	</div>
	<table align="center" width="600">
		<tr>
			<th width="12%">제품번호</th>
			<th width="10%">이미지</th>
			<th width="35%">제품명</th>
			<th width="22%">제품가격</th>
			<th width="25%">비고</th>
		</tr>
		<!-- 제품이 없을경우 -->
		<c:if test="${ empty list }">
			<tr>
				<td colspan="5" align="center">
					상품이 없습니다.
				</td>
			</tr>
		</c:if>
		<c:forEach var="p" items="${list}">
		<tr align="center">
			<td>${p.p_num}</td>
			<td>
				<img alt="" src="../images/${p.p_image_s}" width="100" height="90">
			</td>
			
			<td>
				<a href="view.do?idx=${p.idx}">${p.p_name}</a>
			</td>
			
			<td>
				할인가: <fmt:formatNumber value="${p.p_saleprice}"></fmt:formatNumber>원<br>
				<font color="#f00">
					(${p.sale_rate}% 할인)
				</font>
			</td>
			
			<td>
				단가: <fmt:formatNumber value="${p.p_price}"></fmt:formatNumber>원
			</td>
		</tr>
		</c:forEach>
	</table>
</body>
</html>