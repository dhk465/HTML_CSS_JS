<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="../js/httpRequest.js"></script>
<script>
	function addCart(p_idx, m_idx) {
		let url = "cart_insert.do?p_idx=" + p_idx + "&m_idx=" + m_idx;
		sendRequest(url, null, resultFn, "GET");
	}
	
	function resultFn() {
		if (xhr.readyState == 4 && xhr.status == 200) {
			
		}
	}
</script>
</head>

<body>
	<jsp:include page="index.jsp"/>
	
	<table align="center" border="1" width="600" style="border-collapse:collapse">
	
		<tr>
			<td width="40%">제품분류</td>
			<td width="60%">${ vo.category }</td>
		</tr>
	
		<tr>
			<td width="40%">제품번호</td>
			<td width="60%">${ vo.p_num }</td>
		</tr>
		
		<tr>
			<td width="40%">제품명</td>
			<td width="60%">${ vo.p_name }</td>
		</tr>
		
		<tr>
			<td width="40%">제조사</td>
			<td width="60%">${ vo.p_company }</td>
		</tr>
		
		<tr>
			<td width="40%">제품가격</td>
			<td width="60%">
				<fmt:formatNumber value="${vo.p_price}"/>
				(할인가:<fmt:formatNumber value="${vo.p_saleprice}"/>원)
			</td>
		</tr>
		
		<tr>
			<td colspan="2">제품설명</td>
		</tr>
		
		<tr>
			<td colspan="2" align="center">
				<img src="../images/${vo.p_image_l}" width="500">
			</td>
		</tr>
		
		<tr>
			<td colspan="2">${vo.p_content}</td>
		</tr>
		
		<tr>
			<td colspan="2" align="center">
				<input type="button" value="장바구니에 담기" 
				onclick="addCart('${vo.idx}','${1}')"> <!-- if there is a login, use '${sessionScope.user.idx}' for the 2nd parameter -->
				
				<input type="button" value="장바구니 보기" 
				onclick="location.href='cart_list.do'">
			</td>
		</tr>
		
	</table>
</body>

</html>
















































