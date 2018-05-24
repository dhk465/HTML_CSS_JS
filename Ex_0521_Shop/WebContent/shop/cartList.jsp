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
	function modify(f){
		
		let c_cnt = f.c_cnt.value;
		let num = /^[1-9][0-9]{0,2}$/;
		
		if (!num.test(c_cnt)) {
			alert("1 ~ 3자리의 점수만 입력하세요.");
			f.c_cnt.focus();
			return;
		}
		
		f.submit();	
	}
	
	function del(c_idx) {
		
		if (!confirm("현재 항목을 삭제합니다.")) {
			return;
		}
		
		location.href="cart_delete.do?c_idx=" + c_idx;
	}
	
</script>
</head>

<body>
	
	<jsp:include page="index.jsp"/>
	
	<table align="center" width="600" border="1" style="border-collapse:collapse">
	
		<tr>
			<th>제품번호</th>
			<th width="25%">제품명</th>
			<th>단가</th>
			<th>수량</th>
			<th>금액</th>
			<th>삭제</th>
		</tr>
	
		<c:forEach var="vo" items="${list}">
			<tr>
				<td>${vo.p_num}</td>
				<td>${vo.p_name}</td>
				<td>
					<fmt:parseNumber value="${vo.p_price}"/><br>
					<font color="red">
						할인가:<fmt:parseNumber value="${vo.p_saleprice}"/>
					</font>
				</td>
				
				<td>
					<!-- 수량조정 폼 -->
					<form action="cart_update.do">
						<input type="hidden" name="c_idx" value="${vo.c_idx}">
						<input name="c_cnt" size="4" align="center" value="${vo.c_cnt}">
						<input type="button" value="수정" onclick="modify(this.form);">
					</form>
				</td>
				
				<td>${vo.c_cnt * vo.p_saleprice}</td>
				
				<td>
					<input type="button" value="삭제" style="cursor:hand" onclick="del('${vo.c_idx}');">
				</td>
			</tr>
		
		</c:forEach>
		
		<c:if test="${empty list}">
			<tr>
				<td colspan="6" align="center">
					장바구니가 비었습니다.
				</td>
			</tr>
		</c:if>
	
		<tr>
			<td colspan="5" align="right">
				총 결제액 : 
			</td>
			<td><fmt:formatNumber value="${total_amount}"/></td>
		</tr>
	</table>
	
</body>

</html>








































